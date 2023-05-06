RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(src)
    local identifier = GetIdentifier(src)
    CheckPreferencesExist(identifier)
    TriggerClientEvent('gtstore-hudv1:client:UpdateSettings', src, preferences[identifier])
    SaveToPreferencesData(preferences)
    if Config.UseStress then
        if stressData[identifier] == nil then
            stressData[identifier] = 0
        end
        TriggerClientEvent('hud:client:UpdateStress', src, stressData[identifier])
        SaveToStressData(stressData)

    end
    TriggerClientEvent('gtstore-hud:SetForceHide', src, false)
    TriggerClientEvent('gtstore-hudv1:UpdateNitroData', src, nitro)

end)

RegisterNetEvent('QBCore:Server:OnPlayerLoaded')
AddEventHandler('QBCore:Server:OnPlayerLoaded', function()
    local src = source
    local identifier = GetIdentifier(src)
    CheckPreferencesExist(identifier)
    TriggerClientEvent('gtstore-hudv1:client:UpdateSettings', src,  preferences[identifier])
    SaveToPreferencesData(preferences)
    if Config.UseStress then
        if stressData[identifier] == nil then
            stressData[identifier] = 0
        end
        TriggerClientEvent('hud:client:UpdateStress', src, stressData[identifier])
        SaveToStressData(stressData)

    end
    TriggerClientEvent('gtstore-hudv1:UpdateNitroData', src, nitro)

    TriggerClientEvent('gtstore-hud:SetForceHide', src, false)
end)



--░██████╗░████████╗  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔════╝░╚══██╔══╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--██║░░██╗░░░░██║░░░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██║░░╚██╗░░░██║░░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--╚██████╔╝░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--░╚═════╝░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝
-----------------------[https://discord.gg/cy]-------------------