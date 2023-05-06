local QBCore = nil;
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

local ResetStress = false

local ResetStress = false
timermax = 21 -- In minutes. Must be one bigger than the max timer you want (Eg if you want 20 it must be 21)

cooldown = 0
ispriority = false
ishold = false

QBCore.Commands.Add('cash', 'Check Cash Balance', {}, false, function(source, _)
    local Player = QBCore.Functions.GetPlayer(source)
    local cashamount = Player.PlayerData.money.cash
    TriggerClientEvent('hud:client:ShowAccounts', source, 'cash', cashamount)
end)

QBCore.Commands.Add('bank', 'Check Bank Balance', {}, false, function(source, _)
    local Player = QBCore.Functions.GetPlayer(source)
    local bankamount = Player.PlayerData.money.bank
    TriggerClientEvent('hud:client:ShowAccounts', source, 'bank', bankamount)
end)

QBCore.Commands.Add("dev", "Enable/Disable developer Mode", {}, false, function(source, _)
    TriggerClientEvent("GT-admin:client:ToggleDevmode", source)
end, 'admin')

QBCore.Commands.Add("priority", "Priority On 20m", {}, false, function(source, args)
    local xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.PlayerData.job.name == "police" then
    TriggerEvent("cooldownt")
    end)
	
	--TriggerClientEvent('chatMessage', -1, "تحذير", "WARNING", "تم تفعيل عداد الأولوية .. ممنوع اي عمل اجرامي")	
	--TriggerClientEvent('chatMessage', -1, "تحذير", "WARNING", "تم تفعيل عداد الأولوية .. ممنوع اي عمل اجرامي")

    QBCore.Commands.Add("phold", "Priority Hold", {}, false, function(source, args)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.PlayerData.job.name == "police" then
        TriggerEvent("isOnHold")
        
        --TriggerClientEvent('chatMessage', -1, "تحذير", "WARNING", "تم تفعيل عداد الأولوية .. ممنوع اي عمل اجرامي")	
        --TriggerClientEvent('chatMessage', -1, "تحذير", "WARNING", "تم تفعيل عداد الأولوية .. ممنوع اي عمل اجرامي")	
        else
            TriggerClientEvent('chatMessage', source, "Error", "error", "Just For Police")	
            end
    end)

    QBCore.Commands.Add("priorityhold", "Priority Hold", {}, false, function(source, args)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.PlayerData.job.name == "police" then
        TriggerEvent("isOnHold")
        
        --TriggerClientEvent('chatMessage', -1, "تحذير", "WARNING", "تم تفعيل عداد الأولوية .. ممنوع اي عمل اجرامي")	
        --TriggerClientEvent('chatMessage', -1, "تحذير", "WARNING", "تم تفعيل عداد الأولوية .. ممنوع اي عمل اجرامي")	
        else
            TriggerClientEvent('chatMessage', source, "Error", "error", "Just For Police")	
            end
    end)
    
    QBCore.Commands.Add("priorityoff", "Cancel Priority", {}, false, function(source, args)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.PlayerData.job.name == "police" then
        TriggerEvent("cancelcooldown")
        else
            TriggerClientEvent('chatMessage', source, "Error", "error", "Just For Police")			
            end
    end)

RegisterNetEvent('hud:server:GainStress', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local newStress
    if not Player or (Config.DisablePoliceStress and Player.PlayerData.job.name == 'police') then return end
    if not ResetStress then
        if not Player.PlayerData.metadata['stress'] then
            Player.PlayerData.metadata['stress'] = 0
        end
        newStress = Player.PlayerData.metadata['stress'] + amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    TriggerClientEvent('QBCore:Notify', src, Lang:t("notify.stress_gain"), 'error', 1500)
end)

RegisterNetEvent('hud:server:RelieveStress', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local newStress
    if not Player then return end
    if not ResetStress then
        if not Player.PlayerData.metadata['stress'] then
            Player.PlayerData.metadata['stress'] = 0
        end
        newStress = Player.PlayerData.metadata['stress'] - amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    TriggerClientEvent('QBCore:Notify', src, Lang:t("notify.stress_removed"))
end)

QBCore.Functions.CreateCallback('hud:server:getMenu', function(_, cb)
    cb(Config.Menu)
end)

RegisterNetEvent('isPriority')
AddEventHandler('isPriority', function()
	ispriority = true
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePriority', -1, ispriority)
	TriggerClientEvent('chatMessage', -1, "System", "error", "A Priority call is in progress. Please do not interfere, All calls are on hold until this one concludes.")
end)

RegisterNetEvent('isOnHold')
AddEventHandler('isOnHold', function()
	ishold = true
	Citizen.Wait(1)
	TriggerClientEvent('UpdateHold', -1, ishold)
	TriggerClientEvent('chatMessage', -1, "System", "error", "A Priority call is in Progress. Please do not interfere, All Calls are on hold until this one Concludes.")
end)

RegisterNetEvent('isHoldOrnot')
AddEventHandler('isHoldOrnot', function()
	if ishold == true then
	Citizen.Wait(1)
	TriggerClientEvent('UpdateHold', -1, ishold)
	end
end)

RegisterNetEvent("cooldownt")
AddEventHandler("cooldownt", function()
	if ispriority == true then
		ispriority = false
		TriggerClientEvent('UpdatePriority', -1, ispriority)
	end
	Citizen.Wait(1)
	if ishold == true then
		ishold = false
		TriggerClientEvent('UpdateHold', -1, ishold)
	end
	Citizen.Wait(1)
	if cooldown == 0 then
		cooldown = 0
		cooldown = cooldown + 21
		TriggerClientEvent('chatMessage', -1, "System", "error", "A Priority call was just Conducted. All Civilians Must wait 20 minutes before Conducting another one.")
		TriggerClientEvent('police:PlaySound', -1)
		while cooldown > 0 do
			cooldown = cooldown - 1
			TriggerClientEvent('UpdateCooldown', -1, cooldown)
			Citizen.Wait(15000)
		end
	elseif cooldown ~= 0 then
		CancelEvent()
	end
end)

RegisterNetEvent("cancelcooldown")
AddEventHandler("cancelcooldown", function()
	Citizen.Wait(1)
	while cooldown > 0 do
		cooldown = cooldown - 1
		TriggerClientEvent('UpdateCooldown', -1, cooldown)
		Citizen.Wait(100)
	end
	
end)



QBCore.Functions.CreateCallback('GT-cooldown:server:GetPriority', function(source, cb, itemName)

  if ishold == true then

      cb('On Hold')

  elseif cooldown > 0 then

      cb(cooldown)

  else
  
      cb('off')
  
  end
  
end)



--░██████╗░████████╗  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔════╝░╚══██╔══╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--██║░░██╗░░░░██║░░░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██║░░╚██╗░░░██║░░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--╚██████╔╝░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--░╚═════╝░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝
-----------------------[https://discord.gg/cy]-------------------