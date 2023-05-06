
--░██████╗░████████╗  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔════╝░╚══██╔══╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--██║░░██╗░░░░██║░░░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██║░░╚██╗░░░██║░░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--╚██████╔╝░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--░╚═════╝░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝
-----------------------[https://discord.gg/cy]-------------------

frameworkObject = nil

Citizen.CreateThread(function()
    frameworkObject = GetFrameworkObject()
    if Config.Framework == "esx" then
        frameworkObject.RegisterServerCallback("gtstore-hudv1:GetMoney", function(source, cb, moneytype)
            local src = source
            local Player = frameworkObject.GetPlayerFromId(src)
            if moneytype == "cash" then
                cb(Player.getMoney())
            else
                cb(Player.getAccount('bank').money)
            end
        end)
    end
end)
preferences = {}

function GetPreferencesData()
    local json_data = LoadResourceFile(GetCurrentResourceName(),  './preferences.json')
    if(json_data == '')then
        json_data = {}
    else
        json_data = json.decode(json_data)
    end
    return json_data
end

function SaveToPreferencesData(data)
    SaveResourceFile(GetCurrentResourceName(),'preferences.json', json.encode(data), -1)
end

RegisterServerEvent('gtstore-hudv1:RemoveItem')
AddEventHandler('gtstore-hudv1:RemoveItem', function(item, amount)
    local src = source
    local player = Config.Framework == 'esx' and frameworkObject.GetPlayerFromId(src) or frameworkObject.Functions.GetPlayer(src)
    if Config.Framework == "esx" then
        player.removeInventoryItem(item, amount)
    else
        player.Functions.RemoveItem(item, amount)
    end
end)

Citizen.CreateThread(function()
    while frameworkObject == nil do
        Citizen.Wait(0)
    end
    Citizen.Wait(2000)
    preferences = GetPreferencesData()
    for _,v in pairs(GetPlayers()) do
        local player = nil
        if Config.Framework == 'esx' then
            player = frameworkObject.GetPlayerFromId(tonumber(v))
        else
            player = frameworkObject.Functions.GetPlayer(tonumber(v))
        end
        if player ~= nil then
            local identifier = GetIdentifier(v)
            CheckPreferencesExist(identifier)
            if Config.UseStress then
                if stressData[identifier] == nil then
                    stressData[identifier] = 0
                end
                TriggerClientEvent('hud:client:UpdateStress', v, stressData[identifier])
            end
            TriggerClientEvent('gtstore-hudv1:client:UpdateSettings', v,  preferences[identifier])
            TriggerClientEvent('gtstore-hud:SetForceHide', v, false)
            TriggerClientEvent('gtstore-hudv1:UpdateNitroData', v, nitro)
        end


    end
    SaveToPreferencesData(preferences)
    SaveToStressData(stressData)

end)

function CheckPreferencesExist(identifier)
    if preferences[identifier] == nil then
        preferences[identifier] = {
            hud = Config.DefaultHud,
            hide = false,
            speedtype = Config.DefaultSpeedUnit,
        }
    end
end
if Config.EnableCashAndBankCommands then
    RegisterCommand(Config.CashCommand, function(source)
        if Config.Framework == "esx" then
            local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))
            local cashamount = xPlayer.getMoney()
            TriggerClientEvent('codemblvckhudv2:ShowAccounts', source, 'cash', cashamount)
        else
            local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
            local cashamount = Player.PlayerData.money.cash
    
            TriggerClientEvent('codemblvckhudv2:ShowAccounts', source, 'cash', cashamount)
    
        end
    end)
    RegisterCommand(Config.BankCommand, function(source)
        if Config.Framework == "esx" then
            local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))
            local bankamount = xPlayer.getAccount('bank')
            if bankamount then
                TriggerClientEvent('codemblvckhudv2:ShowAccounts', source, 'bank', bankamount.money)
            end
        else
            local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
            local bankamount = Player.PlayerData.money.bank
            TriggerClientEvent('codemblvckhudv2:ShowAccounts', source, 'bank', bankamount)
    
        end
    end)
    
end

RegisterServerEvent('seatbelt:server:PlaySound')
AddEventHandler('seatbelt:server:PlaySound', function(action, passengers)
    pass = json.decode(passengers)
    for _, ped in ipairs(pass) do
        local vol = (source == ped and 0.25 or 0.20)
        TriggerClientEvent('seatbelt:client:PlaySound', ped, action, vol)
    end
end)

function GetIdentifier(source)
    if Config.Framework == "esx" then
        local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))
        if xPlayer then
            return xPlayer.getIdentifier()
        else
            return "0"
        end
    else
        local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
        if Player then
            return Player.PlayerData.citizenid
        else
            return "0"
        end
    end
end


RegisterNetEvent('gtstore-hudv1:UpdateData')
AddEventHandler("gtstore-hudv1:UpdateData", function(settingstype, val)
    local src = source
    local identifier = GetIdentifier(src)
    CheckPreferencesExist(identifier)

    if preferences[identifier][settingstype] ~= nil then
        preferences[identifier][settingstype] = val
        TriggerClientEvent('gtstore-hudv1:client:UpdateSettings', src, preferences[identifier])

        SaveToPreferencesData(preferences)

    end
end)





--░██████╗░████████╗  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔════╝░╚══██╔══╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--██║░░██╗░░░░██║░░░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██║░░╚██╗░░░██║░░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--╚██████╔╝░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--░╚═════╝░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝
-----------------------[https://discord.gg/cy]-------------------