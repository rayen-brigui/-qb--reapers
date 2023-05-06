


--░██████╗░████████╗  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔════╝░╚══██╔══╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--██║░░██╗░░░░██║░░░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██║░░╚██╗░░░██║░░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--╚██████╔╝░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--░╚═════╝░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝
-----------------------[https://discord.gg/cy]-------------------

stressData = {}

function GetStressData()
    local json_data = LoadResourceFile(GetCurrentResourceName(),  './stressData.json')
    if(json_data == '')then
        json_data = {}
    else
        json_data = json.decode(json_data)
    end
    return json_data
end

function SaveToStressData(data)
    SaveResourceFile(GetCurrentResourceName(),'stressData.json', json.encode(data), -1)
end
if Config.UseStress then


    
    Citizen.CreateThread(function()
        stressData = GetStressData()
    end)

    function IsWhitelisted(source)
        local player = Config.Framework == 'esx' and frameworkObject.GetPlayerFromId(source) or frameworkObject.Functions.GetPlayer(source)
        if player then
            if Config.Framework == 'esx' then
                for _,v in pairs(Config.StressWhitelistJobs) do
                    if player.job.name == v then
                        return true
                    end
                end
            else
                for _,v in pairs(Config.StressWhitelistJobs) do
                    if player.PlayerData.job.name == v then
                        return true
                    end
                end
            end
        end

        return false
    end
    
    RegisterNetEvent('hud:server:GainStress', function(amount)
    
        local src = source
        local identifier = GetIdentifier(src)
        local newStress
        if IsWhitelisted(src) then
            return
        end
        if stressData[identifier] == nil then
            stressData[identifier] = 0
        end
        newStress = tonumber(stressData[identifier]) + amount
        if newStress <= 0 then newStress = 0 end
    
        if newStress > 100 then
            newStress = 100
        end
        stressData[identifier] = newStress
        SaveToStressData(stressData)

        TriggerClientEvent('hud:client:UpdateStress', src, newStress)
        Config.Notification(Config.Notifications["stress_gained"].message, Config.Notifications["stress_gained"].type, true, src)
    end)
    
    RegisterNetEvent('hud:server:RelieveStress', function(amount)
        local src = source
        local identifier = GetIdentifier(src)
    
        local newStress
            
        if stressData[identifier] == nil then
            stressData[identifier] = 0
        end
        newStress = tonumber(stressData[identifier]) - amount
        if newStress <= 0 then newStress = 0 end

        if newStress > 100 then
            newStress = 100
        end
        stressData[identifier] = newStress
        SaveToStressData(stressData)
        TriggerClientEvent('hud:client:UpdateStress', src, newStress)
        Config.Notification(Config.Notifications["stress_relive"].message, Config.Notifications["stress_relive"].type, true, src)

    end)

end


RegisterNetEvent("GTSTORE:server:UpdateStatus")
AddEventHandler("GTSTORE:server:UpdateStatus", function()

    local Player = frameworkObject.Functions.GetPlayer(source)
    if Player ~= nil then
        local newHunger = Player.PlayerData.metadata["hunger"]
        local newThirst = Player.PlayerData.metadata["thirst"]
        TriggerClientEvent("hud:client:UpdateNeeds", source, newHunger, newThirst)
    end
end)




--░██████╗░████████╗  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔════╝░╚══██╔══╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--██║░░██╗░░░░██║░░░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██║░░╚██╗░░░██║░░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--╚██████╔╝░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--░╚═════╝░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝
-----------------------[https://discord.gg/cy]-------------------