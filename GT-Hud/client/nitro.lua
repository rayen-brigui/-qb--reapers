
--░██████╗░████████╗  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔════╝░╚══██╔══╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--██║░░██╗░░░░██║░░░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██║░░╚██╗░░░██║░░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--╚██████╔╝░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--░╚═════╝░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝
-----------------------[https://discord.gg/cy]-------------------



nitro = {}

if Config.EnableNitro then

    function GetVehicleInDirection()

        local playerCoords = GetEntityCoords(playerPed)
        local inDirection  = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 5.0, 0.0)
        local rayHandle    = StartShapeTestRay(playerCoords, inDirection, 10, playerPed, 0)
        local numRayHandle, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
    
        if hit == 1 and GetEntityType(entityHit) == 2 then
            return entityHit
        end
    
        return nil
    end
    RegisterNetEvent('gtstore-hudv1:SetupNitro')
    AddEventHandler('gtstore-hudv1:SetupNitro', function()
        local vehicle = GetVehicleInDirection() 
        if IsPedSittingInAnyVehicle(playerPed) then
            Config.Notification(Config.Notifications["cant_install_nitro"]["message"], Config.Notifications["cant_install_nitro"]["type"])
        else
            if vehicle ~= nil and DoesEntityExist(vehicle) and IsPedOnFoot(playerPed) then
                TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                Citizen.CreateThread(function()
                    Citizen.Wait(5000)
                    ClearPedTasksImmediately(playerPed)
                    TriggerServerEvent('gtstore-hudv1:RemoveItem',Config.NitroItem, 1)
                    TriggerServerEvent('gtstore-hudv1:InstallNitro', GetVehicleNumberPlateText(vehicle))
                end)
            else
                Config.Notification(Config.Notifications["no_veh_nearby"]["message"], Config.Notifications["no_veh_nearby"]["type"])
            end
        end
    end)
    RegisterNetEvent('gtstore-hudv1:UpdateNitroData')
    AddEventHandler('gtstore-hudv1:UpdateNitroData', function(nitroData)
        nitro = nitroData
    
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        if playerVeh ~= 0 and nitro[GetVehicleNumberPlateText(playerVeh)] ~= nil then
            SendNUIMessage({ type="set_status",       statustype = "nitro", value = nitro[GetVehicleNumberPlateText(playerVeh)]})
        end
    end)
    
    local isPressing = false
    RegisterCommand('+nitro', function()
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        isPressing = true
        if playerVeh ~= 0 and nitro[GetVehicleNumberPlateText(playerVeh)] ~= nil then
            if tonumber(nitro[GetVehicleNumberPlateText(playerVeh)]) > 0 then
                if GetPedInVehicleSeat(playerVeh, -1) == playerPed then
                    while isPressing do
                        playerVeh = GetVehiclePedIsIn(playerPed, false)
                        if tonumber(nitro[GetVehicleNumberPlateText(playerVeh)]) <= 0 then
                            if  tonumber(nitro[GetVehicleNumberPlateText(playerVeh)]) < 0 then
                                nitro[GetVehicleNumberPlateText(playerVeh)] = 0
                            end
                            isPressing = false
                            TriggerServerEvent('gtstore-hudv1:UpdateNitro', GetVehicleNumberPlateText(playerVeh), nitro[GetVehicleNumberPlateText(playerVeh)])
                            break
    
                        end
                        if playerVeh == 0 then
                            isPressing = false
                            TriggerServerEvent('gtstore-hudv1:UpdateNitro', GetVehicleNumberPlateText(playerVeh), nitro[GetVehicleNumberPlateText(playerVeh)])
                            break
                        end
                        if GetPedInVehicleSeat(playerVeh, -1) == playerPed then
                            local force = Config.NitroForce
                            nitro[GetVehicleNumberPlateText(playerVeh)] = nitro[GetVehicleNumberPlateText(playerVeh)] - Config.RemoveNitroOnpress
                            SendNUIMessage({ type="set_status",       statustype = "nitro", value = nitro[GetVehicleNumberPlateText(playerVeh)]})
                           SetVehicleBoostActive(playerVeh, 1, 0)
                            SetVehicleForwardSpeed(playerVeh, force)
                            StartScreenEffect("RaceTurbo", 0, 0)
                            SetVehicleBoostActive(playerVeh, 0, 0)
                        else
                            isPressing = false
                            TriggerServerEvent('gtstore-hudv1:UpdateNitro', GetVehicleNumberPlateText(playerVeh), nitro[GetVehicleNumberPlateText(playerVeh)])
    
                            break
                        end
                        Citizen.Wait(400)
                    end
                end
            end
        end
    end)
    RegisterCommand('-nitro', function()
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        if playerVeh ~= 0 and nitro[GetVehicleNumberPlateText(playerVeh)] ~= nil  then
            if GetPedInVehicleSeat(playerVeh, -1) == playerPed then
                isPressing = false
                SendNUIMessage({ type="set_status",       statustype = "nitro", value = nitro[GetVehicleNumberPlateText(playerVeh)]})
                TriggerServerEvent('gtstore-hudv1:UpdateNitro', GetVehicleNumberPlateText(playerVeh), nitro[GetVehicleNumberPlateText(playerVeh)])
            end
        else
            SendNUIMessage({ type="set_status",       statustype = "nitro", value = 0})
        end
    end)
    
    RegisterKeyMapping('+nitro', 'Toggle Nitro', 'keyboard',  Config.NitroKey)
    
    
end




--░██████╗░████████╗  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔════╝░╚══██╔══╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--██║░░██╗░░░░██║░░░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██║░░╚██╗░░░██║░░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--╚██████╔╝░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--░╚═════╝░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝
-----------------------[https://discord.gg/cy]-------------------