
--░██████╗░████████╗  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔════╝░╚══██╔══╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--██║░░██╗░░░░██║░░░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██║░░╚██╗░░░██║░░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--╚██████╔╝░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--░╚═════╝░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝
-----------------------[https://discord.gg/cy]-------------------



frameworkObject = nil
speedMultiplier = Config.DefaultSpeedUnit == "kmh" and 3.6 or 2.23694
CinematicHeight = 0.2
CinematicModeOn = false
w = 0
preferencesData = {}
forceHide = false
Citizen.CreateThread(function()
    frameworkObject = GetFrameworkObject() 
end)
playerPed = PlayerPedId()

Citizen.CreateThread(function()
    while true do
        playerPed = PlayerPedId()
        Citizen.Wait(3000)
    end
end)

Citizen.CreateThread(function()
    local ped = PlayerPedId()
    while true do
        Citizen.Wait(10)
        SetRadarZoom(1100)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        SetBigmapActive(false, false)
    end
end)
Citizen.CreateThread(function()
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)
end)

Citizen.CreateThread(function()
    while true do
        playerCoords = GetEntityCoords(playerPed)
        Citizen.Wait(1500)
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if IsPedInAnyVehicle(playerPed) then

            local vehicle = GetVehiclePedIsIn(playerPed, false)
            if vehicle then
                local currSpeed = GetEntitySpeed(vehicle)    
                local speed = ("%.1d"):format(math.ceil(currSpeed * speedMultiplier)) 
                SendNUIMessage({
                    type = "speed_update",
                    speed = speed,
                    rpm =  GetVehicleCurrentRpm(vehicle),
                })
            end
        end
    end
end)


function WaitPlayer()
    if Config.Framework == "esx" then
        while frameworkObject == nil do
            Citizen.Wait(0)
        end
        while frameworkObject.GetPlayerData()  == nil do
            Citizen.Wait(0)
        end
        while frameworkObject.GetPlayerData().job == nil do
            Citizen.Wait(0)
        end       
    else
        while frameworkObject == nil do
            Citizen.Wait(0)
        end
        while frameworkObject.Functions.GetPlayerData() == nil do
            Citizen.Wait(0)
        end
        while frameworkObject.Functions.GetPlayerData().metadata == nil do
            Citizen.Wait(0)
        end
    end
end


RegisterNetEvent('gtstore-hudv1:OnAddedMoney')
AddEventHandler("gtstore-hudv1:OnAddedMoney", function(amount, minus, moneyType)
    SendNUIMessage({ type="on_added_money",  amount = amount, minus = minus, moneyType = moneyType})
end)

Citizen.CreateThread(function()
    while true do
        local player = playerPed
        local oxygen = 0
        if IsEntityInWater(player) then
            oxygen = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10
        else
            oxygen = 100 - GetPlayerSprintStaminaRemaining(PlayerId())
        end
        SendNUIMessage({ type="set_status",       statustype = "stamina", value = oxygen})
        Citizen.Wait(500)
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('gtstore-hud:SetForceHide', false)
end)

Citizen.CreateThread(function()
    Citizen.Wait(2500)


    SendNUIMessage({ type="watermark_text",  text1 =Config.WaterMarkText1, text2 = Config.WaterMarkText2})

    SendNUIMessage({ type="set_id",  value =GetPlayerServerId(PlayerId())})
    SendNUIMessage({ type="set_watermarkhud",  value = Config.EnableWaterMarkHud})
    SendNUIMessage({ type="set_useNitro",  value = Config.EnableNitro})
    SendNUIMessage({ type="set_DateDisplay",  value = Config.EnableDateDisplay})

    SendNUIMessage({ type="set_cruiseDisplay",  value = Config.EnableCruise})
    SendNUIMessage({ type="set_seatbeltDisplay",  value = Config.EnableSeatbelt})
    
    SendNUIMessage({ type="set_locales",  value = Config.SettingsLocale})

    SendNUIMessage({ type="UseStress",  value = Config.UseStress})
    SendNUIMessage({ type="DisplayRealTime",  value = Config.DisplayRealTime})
end)

CreateThread(function()
    while true do
        Wait(5000)
        TriggerServerEvent("GTSTORE:server:UpdateStatus")
    end
end)

RegisterNetEvent('gtstore-hud:SetForceHide')
AddEventHandler('gtstore-hud:SetForceHide', function(val)
    while true do
        Citizen.Wait(0)

        if NetworkIsSessionStarted() then
            break
        end
    end
    SendNUIMessage({ type="set_force_hide",  value = val})

end)

RegisterNetEvent('codemblvckhudv2:ShowAccounts')
AddEventHandler('codemblvckhudv2:ShowAccounts', function(type, money)
    if Config.EnableCashAndBankCommands then
        if type == "cash" then
            Config.Notification(string.format(Config.Notifications["cash_display"]["message"], money), Config.Notifications["cash_display"]["type"])
        else
            Config.Notification(string.format(Config.Notifications["bank_display"]["message"], money), Config.Notifications["bank_display"]["type"])
        end
    end
end)

local lastArmour = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(400)
        local playerPed = playerPed
        local armour = GetPedArmour(playerPed)
        if lastArmour ~= armour then
            SendNUIMessage({
                type = "set_status",
                statustype = "armour",
                value = armour,
            })
            lastArmour = armour
        end
    end
end)

local inSettings = false
RegisterCommand(Config.HudSettingsCommand, function()
    SendNUIMessage({
        type = "open_hudsettings",
    })
    inSettings = true
    SetNuiFocus(true, true)
end)
RegisterCommand('+engine', function()
   TriggerEvent('MojiaVehicleKeys:client:Engine')
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if inSettings then
            DisplayRadar(false)
        end
    end
end)

RegisterNUICallback('ExitSettings', function()
    SetNuiFocus(false, false)
    inSettings = false
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 and not preferencesData.hide then
        DisplayRadar(true)
    end
    if Config.DisplayMapOnWalk then
        DisplayRadar(true)
    end
end)


Citizen.CreateThread(function()
    Citizen.Wait(2000)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 then
        SendNUIMessage({
            type = "show_speedometer",
            displayOnWalk = Config.DisplayMapOnWalk,
        })
        if nitro[GetVehicleNumberPlateText(vehicle)] ~= nil then
            SendNUIMessage({ type="set_status",       statustype = "nitro", value = nitro[GetVehicleNumberPlateText(vehicle)] })

        else
            SendNUIMessage({ type="set_status",       statustype = "nitro", value = 0})

        end
        alreadyInVehicle = true
        if not preferencesData.hide then
            DisplayRadar(true)
        end
    else
        SendNUIMessage({
            type = "hide_speedometer",
            displayOnWalk = Config.DisplayMapOnWalk,
        })
        alreadyInVehicle = false
        if Config.DisplayMapOnWalk then
            DisplayRadar(true)
        else
            DisplayRadar(false)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(700)
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if vehicle ~= 0 then
            if not alreadyInVehicle then
                SendNUIMessage({
                    type = "show_speedometer",
                    displayOnWalk = Config.DisplayMapOnWalk,
                })
                if nitro[GetVehicleNumberPlateText(vehicle)] ~= nil then
                    SendNUIMessage({ type="set_status",       statustype = "nitro", value = nitro[GetVehicleNumberPlateText(vehicle)] })
        
                else
                    SendNUIMessage({ type="set_status",       statustype = "nitro", value = 0})
        
                end
                alreadyInVehicle = true
            end
            if not preferencesData.hide then
                DisplayRadar(true)
            end
        else
            if alreadyInVehicle then
                SendNUIMessage({
                    type = "hide_speedometer",
                    displayOnWalk = Config.DisplayMapOnWalk,

                })
                alreadyInVehicle = false
            end

            if Config.DisplayMapOnWalk then
                DisplayRadar(true)
            else
                DisplayRadar(false)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        HideHudComponentThisFrame(6) -- VEHICLE_NAME
        HideHudComponentThisFrame(7) -- AREA_NAME
        HideHudComponentThisFrame(8) -- VEHICLE_CLASS
        HideHudComponentThisFrame(9) -- STREET_NAME
        HideHudComponentThisFrame(3) -- CASH
        HideHudComponentThisFrame(4) -- MP_CASH

    end
end)

Citizen.CreateThread(function()
    local defaultAspectRatio = 1920/1080 -- Don't change this.
    local resolutionX, resolutionY = GetActiveScreenResolution()
    local aspectRatio = resolutionX/resolutionY
    local minimapOffset = 0
    if aspectRatio > defaultAspectRatio then
        minimapOffset = ((defaultAspectRatio-aspectRatio)/3.6)-0.008
    end
    RequestStreamedTextureDict("squaremap", false)
    if not HasStreamedTextureDictLoaded("squaremap") then
        Wait(150)
    end

    SetMinimapClipType(0)
    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "squaremap", "radarmasksm")
    AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "squaremap", "radarmasksm")
    -- 0.0 = nav symbol and icons left
    -- 0.1638 = nav symbol and icons stretched
    -- 0.216 = nav symbol and icons raised up
    SetMinimapComponentPosition("minimap", "L", "B", 0.0 + minimapOffset, -0.047, 0.1638, 0.183)

    -- icons within map
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.0 + minimapOffset, 0.0, 0.128, 0.20)

    -- -0.01 = map pulled left
    -- 0.025 = map raised up
    -- 0.262 = map stretched
    -- 0.315 = map shorten
    SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.01 + minimapOffset, 0.025, 0.262, 0.300)

    SetBlipAlpha(GetNorthRadarBlip(), 0)
    SetRadarBigmapEnabled(true, false)
    SetMinimapClipType(0)
    Wait(50)
    SetRadarBigmapEnabled(false, false)
end)



RegisterNetEvent('gtstore-hudv1:client:UpdateSettings')
AddEventHandler('gtstore-hudv1:client:UpdateSettings', function(data)
    data.forceHide = forceHide
    preferencesData = data
    SendNUIMessage({
        type = "update_settings",
        val = data,
    })
    if data.hide then
        DisplayRadar(false)
    end



    speedMultiplier = data.speedtype == "kmh" and 3.6 or 2.23694

    if data.hud == "radial" then
        local playerPed = playerPed
        local armour = GetPedArmour(playerPed)
        SendNUIMessage({
            type = "armour_update",
            armour = armour,
        })
        if Config.Framework == "esx" then

        else
            local myhunger = frameworkObject.Functions.GetPlayerData().metadata["hunger"]
            local mythirst = frameworkObject.Functions.GetPlayerData().metadata["thirst"]
            SendNUIMessage({
                type = "set_status",
                statustype = "hunger",
                value =  myhunger,
            })
            SendNUIMessage({
                type = "set_status",
                statustype = "thirst",
                value =  mythirst,
            })
        end
    

        local health = GetEntityHealth(playerPed)
        SendNUIMessage({
            type = "set_status",
            statustype = "health",
            value = health-100,
        })
    end
end)




function CinematicShow(bool)
  
    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)
    CinematicModeOn = bool
    if CinematicModeOn then
        forceHide= true
    else
        forceHide = false
    end
    TriggerEvent('gtstore-hudv1:client:UpdateSettings', preferencesData)
    if bool then
        for i = CinematicHeight, 0, -1.0 do
            Wait(10)
            w = i
        end 
    else
        for i = 0, CinematicHeight, 1.0 do 
            Wait(10)
            w = i
        end
    end
    if w > 0 then
        Citizen.CreateThread(function()
            local minimap = RequestScaleformMovie("minimap")
            if not HasScaleformMovieLoaded(minimap) then
                RequestScaleformMovie(minimap)
                while not HasScaleformMovieLoaded(minimap) do 
                    Wait(1)
                end
            end
            while w > 0 do
                Wait(0)
                BlackBars()
                DisplayRadar(0)
            end
        end)
    end

 
end

function BlackBars()
    DrawRect(0.0, 0.0, 2.0, w, 0, 0, 0, 255)
    DrawRect(0.0, 1.0, 2.0, w, 0, 0, 0, 255)
end

RegisterNUICallback('toggleCinematic', function(data, cb)
    if not CinematicModeOn then
        CinematicShow(true)
    else
        CinematicShow(false)
    end

    cb(CinematicModeOn)
end)

Citizen.CreateThread(function()
    while true do
        if IsPedInAnyVehicle(playerPed) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            if vehicle then
                local fuel = Config.GetVehicleFuel(vehicle)
                SendNUIMessage({
                    type = "fuel_update",
                    fuel = fuel,
                })
            end
        end
        Citizen.Wait(1700)
    end
end)
local directions = {
    N = 360, 0,
    NE = 315,
    E = 270,
    SE = 225,
    S = 180,
    SW = 135,
    W = 90,
    NW = 45
    --  N = 0, <= will result in the HUD breaking above 315deg
  }
  
local lastZone = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local position = playerCoords
		local var1, var2 = GetStreetNameAtCoord(position.x, position.y, position.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
        local zone = GetNameOfZone(position.x, position.y, position.z);
		local zoneLabel = GetLabelText(zone);
		hash1 = GetStreetNameFromHashKey(var1);
		hash2 = GetStreetNameFromHashKey(var2);
        local street2;
		street2 = zoneLabel;
        local heading = GetEntityHeading(playerPed);
        for k, v in pairs(directions) do
            if (math.abs(heading - v) < 22.5) then
                heading = k;
      
                if (heading == 1) then
                    heading = 'N';
                    break;
                end

                break;
            end
        end
        SendNUIMessage({
            type = "location_update",
            street = hash1,
			zone = street2,
            heading = heading,
        })
    end
end)

Citizen.CreateThread(function()
    if not Config.DisplayRealTime then
        while true do
            Citizen.Wait(1000)
            local hours = GetClockHours()
            local minutes = GetClockMinutes()
            if hours < 10 then 
                hours = '0'..hours 
            end
            if minutes < 10 then 
                minutes = '0'..minutes 
            end
            SendNUIMessage({type = "clock_update", minutes = minutes, hours=hours})
        end
    end
end)

if Config.EnableCruise then
    local cruiseIsOn = false
    local cruiseSpeed = 999.0
    
    RegisterKeyMapping('cruise', 'Cruise Control', 'keyboard', Config.DefaultCruiseControlKey)
    local cruiseSpam = 0
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            if cruiseSpam > 0 then
                Citizen.Wait(3500)
                cruiseSpam = 0
            end
        end
    end)
    
    RegisterCommand('cruise', function()
        if cruiseSpam >= 3 then
            if Config.EnableSpamNotification  then
                Config.Notification(Config.Notifications["spam"]["message"], Config.Notifications["spam"]["type"])
            end
            return
        end
        local player = playerPed
        local vehicle = GetVehiclePedIsIn(player, false)
        if (GetPedInVehicleSeat(vehicle, -1) == player and vehicle ~= 0) then
            cruiseIsOn = not cruiseIsOn
            if cruiseIsOn then
                Config.Notification(Config.Notifications["cruise_actived"]["message"], Config.Notifications["cruise_actived"]["type"])
            else
                Config.Notification(Config.Notifications["cruise_disabled"]["message"], Config.Notifications["cruise_disabled"]["type"])
            end
            local currSpeed = GetEntitySpeed(vehicle)
            cruiseSpeed = currSpeed
            local maxSpeed = cruiseIsOn and cruiseSpeed or GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel")
            SetEntityMaxSpeed(vehicle, maxSpeed)
            SendNUIMessage({type = "toggle_cruise", toggle = cruiseIsOn})
            cruiseSpam = cruiseSpam + 1
        end
    end, false)
end


local lastCheckIsAlreadyEngineRunning = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(400)
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if vehicle ~= 0 then
            local isRunning = GetIsVehicleEngineRunning(vehicle)
            if isRunning ~= lastCheckIsAlreadyEngineRunning then
                lastCheckIsAlreadyEngineRunning = isRunning
                if isRunning then
                    SendNUIMessage({
                        type = "toggle_engine",
                        toggle = true,
                    })
                else
                    SendNUIMessage({
                        type = "toggle_engine",
                        toggle = false,
                    })
                end
            end
        end
    end
end)
seatbeltOn = false

if Config.EnableSeatbelt then

    RegisterKeyMapping('seatbelt', 'Toggle Seatbelt', 'keyboard', Config.DefaultSeatbeltControlKey)
    local seatbeltSpam = 0
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(30)
            if IsPedInAnyVehicle(playerPed) then
                if seatbeltOn then
                    DisableControlAction(0, 75, true) -- Disable exit vehicle when stop
                    DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
                end
            else
                if seatbeltOn then
                    toggleSeatbelt(false, false)
                end
            end
        end
    end)
    RegisterCommand('seatbelt', function(source, args, rawCommand)
        if seatbeltSpam >= 3 then
            if Config.EnableSpamNotification  then
                Config.Notification(Config.Notifications["spam"]["message"], Config.Notifications["spam"]["type"])
            end
            return
        end
        local ped = playerPed
        if IsPedInAnyVehicle(ped, false) then
            local class = GetVehicleClass(GetVehiclePedIsIn(ped))
            if class ~= 8 and class ~= 13 and class ~= 14 then
                toggleSeatbelt(true)
                if seatbeltOn then
                    Config.Notification(Config.Notifications["took_seatbelt"]["message"], Config.Notifications["took_seatbelt"]["type"])
                else
                    Config.Notification(Config.Notifications["took_off_seatbelt"]["message"], Config.Notifications["took_off_seatbelt"]["type"])
                end
                seatbeltSpam = seatbeltSpam + 1
            end
        end
    end, false)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            if seatbeltSpam > 0 then
                Citizen.Wait(3500)
                seatbeltSpam = 0
            end
        end
    end)
    
    function toggleSeatbelt(makeSound, toggle)
    
        if toggle == nil then
            if seatbeltOn then
                playSound("unbuckle")
                SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage)
                SendNUIMessage({
                    type="update_seatbelt",
                    toggle = false
    
                })
            else
                playSound("buckle")
                SendNUIMessage({
                    type="update_seatbelt",
                    toggle = true
                })
                SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
            end
            seatbeltOn = not seatbeltOn
        else
            if toggle then
                
                SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
                SendNUIMessage({
                    type="update_seatbelt",
                    toggle = true
    
                })
                playSound("buckle")
            
            else
             
                SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage)
                SendNUIMessage({
                    type="update_seatbelt",
                    toggle = false
                })
                playSound("unbuckle")
            end
            seatbeltOn = toggle
    
        end
    end
    
    function playSound(action)
        local ped = playerPed
        local veh = GetVehiclePedIsUsing(ped)
        local maxpeds = GetVehicleMaxNumberOfPassengers(veh) - 2
        local passengers = {}
        for i = -1, maxpeds do
            if not IsVehicleSeatFree(veh, i) then
                local ped = GetPlayerServerId( NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(veh, i)) )
                table.insert(passengers, ped)
            end
        end
        TriggerServerEvent('seatbelt:server:PlaySound', action, json.encode(passengers))
    end
    
    RegisterNetEvent('seatbelt:client:PlaySound')
    AddEventHandler('seatbelt:client:PlaySound', function(action, volume)
        SendNUIMessage({type = action, volume = volume})
    end)
    
end



local alreadyInHeli = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if IsPedInAnyHeli(playerPed) or IsPedInAnyPlane(playerPed) then
            if not alreadyInHeli then
                SendNUIMessage({
                    type = "update_altitude",
                    val = true
                })
                alreadyInHeli = true
            end
                local veh = GetVehiclePedIsUsing(playerPed)
      
            SendNUIMessage({ type="set_status",       statustype = "altitude", value = GetEntityHeightAboveGround(veh)})

        else
            if  alreadyInHeli then
                SendNUIMessage({
                    type = "update_altitude",
                    val = false
                })
                alreadyInHeli = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if GetPedParachuteState(playerPed) >= 0 then
            SendNUIMessage({ type="set_status",       statustype = "altitude", value = GetEntityHeightAboveGround(PlayerPedId())})
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        if GetPedParachuteState(playerPed) >= 0 then
            SendNUIMessage({
                type = "update_parachute",
                val = true,
            })
        else
            SendNUIMessage({
                type = "update_parachute",
                val = false,
            })
        end
    end
end)


Citizen.CreateThread(function()
    while true do 
        local player = playerPed
        local vehicle = GetVehiclePedIsIn(player, true)
        local vehicleVal,vehicleLights,vehicleHighlights  = GetVehicleLightsState(vehicle)
        local vehicleIsLightsOn
        if vehicleLights == 1 and vehicleHighlights == 0 then
            vehicleIsLightsOn = true
        elseif (vehicleLights == 1 and vehicleHighlights == 1) or (vehicleLights == 0 and vehicleHighlights == 1) then
            vehicleIsLightsOn = true
        else
            vehicleIsLightsOn = false
        end
        SendNUIMessage({type = "update_ligths", state = vehicleIsLightsOn})
        Citizen.Wait(400)
    end
end)

if Config.EnableEngineToggle then
    local engineRunning = true
    local lastVehicle = nil
    RegisterCommand('engine', function()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if vehicle == 0 or GetPedInVehicleSeat(vehicle, -1) ~= playerPed then return end
        if GetIsVehicleEngineRunning(vehicle) then
            Config.Notification(Config.Notifications["engine_off"]["message"], Config.Notifications["engine_off"]["type"])
        else
            Config.Notification(Config.Notifications["engine_on"]["message"], Config.Notifications["engine_on"]["type"])
        end
        engineRunning = not GetIsVehicleEngineRunning(vehicle)
        lastVehicle = vehicle
        SetVehicleEngineOn(vehicle, not GetIsVehicleEngineRunning(vehicle), true, false)
    end)
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if not engineRunning then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                if vehicle ~= 0 or GetPedInVehicleSeat(vehicle, -1) == playerPed then 
                    if lastVehicle == vehicle then
                        ClearPedTasks(PlayerPedId())
                        SetVehicleEngineOn(vehicle, false, true, false)
                    else
                        engineRunning = true
                    end
                end
            end
        end
    end)
    
    RegisterKeyMapping('engine', 'Toggle Engine', 'keyboard',  Config.VehicleEngineToggleKey)
end



RegisterNetEvent('SaltyChat_VoiceRangeChanged')
AddEventHandler('SaltyChat_VoiceRangeChanged', function(voiceRange, index, availableVoiceRanges) 
    SendNUIMessage({ type="set_status",       statustype = "mic_level", value = index  + 1})
 end)

RegisterNetEvent('SaltyChat_TalkStateChanged')
AddEventHandler('SaltyChat_TalkStateChanged', function(isTalking)
    SendNUIMessage({ type="set_status",       statustype = "talking", value = isTalking})

end)

RegisterNetEvent('pma-voice:setTalkingMode')
AddEventHandler('pma-voice:setTalkingMode', function(voiceMode) 
    SendNUIMessage({ type="set_status",       statustype = "mic_level", value = voiceMode})

end)

RegisterNetEvent("mumble:SetVoiceData")
AddEventHandler("mumble:SetVoiceData", function(player, key, value) 
    if GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId())) == player and key == 'mode' then
         SendNUIMessage({ type="set_status",       statustype = "mic_level", value = value})
    end
end)

local checkTalkStatus = false
Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do
        if NetworkIsPlayerTalking(PlayerId()) then
            if not checkTalkStatus then
                checkTalkStatus = true
                SendNUIMessage({ type="set_status",       statustype = "talking", value = true})
            end
        else
            if checkTalkStatus then
                checkTalkStatus = false
                SendNUIMessage({ type="set_status",       statustype = "talking", value = false})

            end
        end
        Citizen.Wait(300)
    end
end)

local pauseActive = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(350)
        if IsPauseMenuActive() and not pauseActive then
            pauseActive = true
            TriggerEvent('gtstore-hud:SetForceHide', true)
        end
        if not IsPauseMenuActive() and pauseActive and not CinematicModeOn then
            pauseActive = false
            TriggerEvent('gtstore-hud:SetForceHide', false)
        end
    end
end)



--░██████╗░████████╗  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔════╝░╚══██╔══╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--██║░░██╗░░░░██║░░░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██║░░╚██╗░░░██║░░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--╚██████╔╝░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--░╚═════╝░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝
-----------------------[https://discord.gg/cy]-------------------