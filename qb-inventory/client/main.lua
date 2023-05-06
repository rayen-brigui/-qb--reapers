
local QBCore = exports['qb-core']:GetCoreObject()

local inInventory = false
local currentWeapon = nil
local CurrentWeaponData = {}
local currentOtherInventory = nil
local Drops = {}
local CurrentDrop = 0
local DropsNear = {}
local CurrentVehicle = nil
local CurrentGlovebox = nil
local CurrentStash = nil
local isCrafting = false
local isHotbar = false
local showTrunkPos = false
local itemInfos = {}


-- Functions
local function FormatWeaponAttachments(itemdata)
    local attachments = {}
    itemdata.name = itemdata.name:upper()
    if itemdata.info.attachments ~= nil and next(itemdata.info.attachments) ~= nil then
        for k, v in pairs(itemdata.info.attachments) do
            if WeaponAttachments[itemdata.name] ~= nil then
                for key, value in pairs(WeaponAttachments[itemdata.name]) do
                    if value.component == v.component then
                        attachments[#attachments+1] = {
                            attachment = key,
                            label = value.label
                        }
                    end
                end
            end
        end
    end
    return attachments
end

local function IsBackEngine(vehModel)
    for _, model in pairs(BackEngineVehicles) do
        if GetHashKey(model) == vehModel then
            return true
        end
    end
    return false
end

local function OpenTrunk()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do
        RequestAnimDict("amb@prop_human_bum_bin@idle_b")
        Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 4.0, 4.0, -1, 50, 0, false, false, false)
    if (IsBackEngine(GetEntityModel(vehicle))) then
        SetVehicleDoorOpen(vehicle, 4, false, false)
    else
        SetVehicleDoorOpen(vehicle, 5, false, false)
    end
end

local function CloseTrunk()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do
        RequestAnimDict("amb@prop_human_bum_bin@idle_b")
        Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "exit", 4.0, 4.0, -1, 50, 0, false, false, false)
    if (IsBackEngine(GetEntityModel(vehicle))) then
        SetVehicleDoorShut(vehicle, 4, false)
    else
        SetVehicleDoorShut(vehicle, 5, false)
    end
end

local function ToggleHotbar(toggle)
    local HotbarItems = {
        [1] = QBCore.Functions.GetPlayerData().items[1],
        [2] = QBCore.Functions.GetPlayerData().items[2],
        [3] = QBCore.Functions.GetPlayerData().items[3],
        [4] = QBCore.Functions.GetPlayerData().items[4],
        [5] = QBCore.Functions.GetPlayerData().items[5],
        [41] = QBCore.Functions.GetPlayerData().items[41],
    }

    if toggle then
        SendNUIMessage({
            action = "toggleHotbar",
            open = true,
            items = HotbarItems
        })
    else
        SendNUIMessage({
            action = "toggleHotbar",
            open = false,
        })
    end
end

local function LoadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Wait( 5 )
    end
end


local function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Wait(5) 
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

local function ItemsToItemInfo()
	itemInfos = {
		[1] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 22x, " ..QBCore.Shared.Items["plastic"]["label"] .. ": 32x."},
		[2] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 30x, " ..QBCore.Shared.Items["plastic"]["label"] .. ": 42x."},
		[3] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 30x, " ..QBCore.Shared.Items["plastic"]["label"] .. ": 45x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 28x."},
		[4] = {costs = QBCore.Shared.Items["electronickit"]["label"] .. ": 2x, " ..QBCore.Shared.Items["plastic"]["label"] .. ": 52x, "..QBCore.Shared.Items["steel"]["label"] .. ": 40x."},
		[5] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 10x, " ..QBCore.Shared.Items["plastic"]["label"] .. ": 50x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 30x, "..QBCore.Shared.Items["iron"]["label"] .. ": 17x, "..QBCore.Shared.Items["electronickit"]["label"] .. ": 1x."},
		[6] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 36x, " ..QBCore.Shared.Items["steel"]["label"] .. ": 24x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 28x."},
		[7] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 32x, " ..QBCore.Shared.Items["steel"]["label"] .. ": 43x, "..QBCore.Shared.Items["plastic"]["label"] .. ": 61x."},
		[8] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 50x, " ..QBCore.Shared.Items["steel"]["label"] .. ": 37x, "..QBCore.Shared.Items["copper"]["label"] .. ": 26x."},
		[9] = {costs = QBCore.Shared.Items["iron"]["label"] .. ": 60x, " ..QBCore.Shared.Items["glass"]["label"] .. ": 30x."},
		[10] = {costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 60x, " ..QBCore.Shared.Items["glass"]["label"] .. ": 30x."},
		[11] = {costs = QBCore.Shared.Items["iron"]["label"] .. ": 33x, " ..QBCore.Shared.Items["steel"]["label"] .. ": 44x, "..QBCore.Shared.Items["plastic"]["label"] .. ": 55x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 22x."},
		[12] = {costs = QBCore.Shared.Items["iron"]["label"] .. ": 50x, " ..QBCore.Shared.Items["steel"]["label"] .. ": 50x, "..QBCore.Shared.Items["screwdriverset"]["label"] .. ": 3x, "..QBCore.Shared.Items["advancedlockpick"]["label"] .. ": 2x."},
	}

	local items = {}
	for k, item in pairs(Config.CraftingItems) do
		local itemInfo = QBCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = itemInfos[item.slot],
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
			weight = itemInfo["weight"],
			type = itemInfo["type"],
			unique = itemInfo["unique"],
			useable = itemInfo["useable"],
			image = itemInfo["image"],
			slot = item.slot,
			costs = item.costs,
			threshold = item.threshold,
			points = item.points,
		}
	end
	Config.CraftingItems = items
end

local function SetupAttachmentItemsInfo()
	itemInfos = {
		[1] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 140x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 250x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 60x"},
		[2] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 165x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 285x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 75x"},
		[3] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 190x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 305x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 85x, " .. QBCore.Shared.Items["smg_extendedclip"]["label"] .. ": 1x"},
		[4] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 205x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 340x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 110x, " .. QBCore.Shared.Items["smg_extendedclip"]["label"] .. ": 2x"},
		[5] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 230x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 365x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 130x"},
		[6] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 255x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 390x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 145x"},
		[7] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 270x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 435x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 155x"},
		[8] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 300x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 469x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 170x"},
	}

	local items = {}
	for k, item in pairs(Config.AttachmentCrafting["items"]) do
		local itemInfo = QBCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = itemInfos[item.slot],
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
			weight = itemInfo["weight"],
			unique = itemInfo["unique"],
			useable = itemInfo["useable"],
			image = itemInfo["image"],
			slot = item.slot,
			costs = item.costs,
			threshold = item.threshold,
			points = item.points,
		}
	end
	Config.AttachmentCrafting["items"] = items
end

local function GetThresholdItems()
	ItemsToItemInfo()
	local items = {}
	for k, item in pairs(Config.CraftingItems) do
		if QBCore.Functions.GetPlayerData().metadata["craftingrep"] >= Config.CraftingItems[k].threshold then
			items[k] = Config.CraftingItems[k]
		end
	end
	return items
end

local function GetAttachmentThresholdItems()
	SetupAttachmentItemsInfo()
	local items = {}
	for k, item in pairs(Config.AttachmentCrafting["items"]) do
		if QBCore.Functions.GetPlayerData().metadata["attachmentcraftingrep"] >= Config.AttachmentCrafting["items"][k].threshold then
			items[k] = Config.AttachmentCrafting["items"][k]
		end
	end
	return items
end

-- Events
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    LocalPlayer.state:set("inv_busy", false, true)
end)
 
RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    LocalPlayer.state:set("inv_busy", true, true)
end)

RegisterNetEvent('inventory:client:CheckOpenState', function(type, id, label)
    local name = QBCore.Shared.SplitStr(label, "-")[2]
    if type == "stash" then
        if name ~= CurrentStash or CurrentStash == nil then
            TriggerServerEvent('inventory:server:SetIsOpenState', false, type, id)
        end
    elseif type == "trunk" then
        if name ~= CurrentVehicle or CurrentVehicle == nil then
            TriggerServerEvent('inventory:server:SetIsOpenState', false, type, id)
        end
    elseif type == "glovebox" then
        if name ~= CurrentGlovebox or CurrentGlovebox == nil then
            TriggerServerEvent('inventory:server:SetIsOpenState', false, type, id)
        end
    end
end)

RegisterNetEvent('weapons:client:SetCurrentWeapon', function(data, bool)
    if data ~= false then
        CurrentWeaponData = data
    else
        CurrentWeaponData = {}
    end
end)

RegisterNetEvent("qb-inventory:client:SetCurrentStash", function(stash)
    CurrentStash = stash
end)

RegisterNetEvent('inventory:client:ItemBox', function(itemData, type, amount)
    SendNUIMessage({
        action = "itemBox",
        item = itemData,
        type = type,
        amount = amount
    }) 
end)

RegisterNetEvent('inventory:client:WeaponHolster', function(itemData, weapon)
    local type = "holster"
    if weapon == "weapon_unarmed" then
        type = "holster"
    else
        type = "unholster"
    end  
    SendNUIMessage({
        action = "itemBox",
        item = itemData,
        type = type,
        adet = 0
    })
end)

RegisterNetEvent('inventory:client:requiredItems', function(items, bool)
    local itemTable = {}
    if bool then
        for k, v in pairs(items) do
            table.insert(itemTable, {
                item = items[k].name,
                label = QBCore.Shared.Items[items[k].name]["label"],
                image = items[k].image,
            })
        end
    end
    SendNUIMessage({
        action = "requiredItem",
        items = itemTable,
        toggle = bool 
    })
end)

RegisterNetEvent('inventory:server:RobPlayer', function(TargetId)
    SendNUIMessage({
        action = "RobMoney",
        TargetId = TargetId,
    })
end) 


RegisterNetEvent("inventory:client:OpenInventory", function(PlayerAmmo, inventory, other)
    TriggerScreenblurFadeIn(1000)
    if not IsEntityDead(PlayerPedId()) then
        ToggleHotbar(false)
        SetNuiFocus(true, true)
        if other ~= nil then
            currentOtherInventory = other.name
        end
        SendNUIMessage({
            action = "open",
            inventory = inventory,
            slots = MaxInventorySlots,
            other = other,
            maxweight = QBCore.Config.Player.MaxWeight,
            Ammo = PlayerAmmo,
            maxammo = Config.MaximumAmmoValues,
        })
        inInventory = true
    end
end)

RegisterNetEvent("inventory:client:UpdatePlayerInventory", function(isError)
    SendNUIMessage({
        action = "update",
        inventory = QBCore.Functions.GetPlayerData().items,
        maxweight = QBCore.Config.Player.MaxWeight,
        slots = MaxInventorySlots,
        error = isError,
    })
end)



RegisterNetEvent('qb-inventory:client:giveAnim', function()
    LoadAnimDict('mp_common')
	TaskPlayAnim(PlayerPedId(), 'mp_common', 'givetake1_b', 8.0, 1.0, -1, 16, 0, 0, 0, 0)
end)


RegisterNetEvent("inventory:client:ShowTrunkPos", function()
    showTrunkPos = true
end)

RegisterNetEvent('InventoryAnim', function()
    playAnim("pickup_object", "putdown_low", 1000)
end)




RegisterNetEvent('inventory:client:PickupSnowballs', function()
    local ped = PlayerPedId()
    LoadAnimDict('anim@mp_snowball')
    TaskPlayAnim(ped, 'anim@mp_snowball', 'pickup_snowball', 3.0, 3.0, -1, 0, 1, 0, 0, 0)
    QBCore.Functions.Progressbar("pickupsnowball", "Collecting snowballs..", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        ClearPedTasks(ped)
        TriggerServerEvent('QBCore:Server:AddItem', "snowball", 1)
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["snowball"], "add", 1)
    end, function() -- Cancel
        ClearPedTasks(ped)
        QBCore.Functions.Notify("Canceled", "error")
    end)
end)

RegisterNetEvent('inventory:client:UseSnowball', function(amount)
    local ped = PlayerPedId()
    GiveWeaponToPed(ped, `weapon_snowball`, amount, false, false)
    SetPedAmmo(ped, `weapon_snowball`, amount)
    SetCurrentPedWeapon(ped, `weapon_snowball`, true)
end)

RegisterNetEvent("inventory:client:UseWeapon", function(weaponData, shootbool)
    local ped = PlayerPedId()
    local weaponName = tostring(weaponData.name)
    if currentWeapon == weaponName then
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(ped, true)
        currentWeapon = nil
        TriggerEvent('qb-hud:client:ToggleWeaponMode', false)  
        TriggerEvent('inventory:client:WeaponHolster', weaponData, "weapon_unarmed")
    elseif weaponName == "weapon_stickybomb" or weaponName == "weapon_pipebomb" or weaponName == "weapon_shoe" or weaponName == "weapon_smokegrenade" or weaponName == "weapon_flare" or weaponName == "weapon_proxmine" or weaponName == "weapon_ball"  or weaponName == "weapon_molotov" or weaponName == "weapon_grenade" or weaponName == "weapon_bzgas" then
        GiveWeaponToPed(ped, GetHashKey(weaponName), 1, false, false)
        SetPedAmmo(ped, GetHashKey(weaponName), 1)
        SetCurrentPedWeapon(ped, GetHashKey(weaponName), true)
        -- TriggerServerEvent('QBCore:Server:RemoveItem', weaponName, 1)
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
        TriggerEvent('qb-hud:client:ToggleWeaponMode', true)  
    elseif weaponName == "weapon_snowball" then
        GiveWeaponToPed(ped, GetHashKey(weaponName), 10, false, false)
        SetPedAmmo(ped, GetHashKey(weaponName), 10)
        SetCurrentPedWeapon(ped, GetHashKey(weaponName), true)
        TriggerServerEvent('QBCore:Server:RemoveItem', weaponName, 1)
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
        TriggerEvent('qb-hud:client:ToggleWeaponMode', true)  
    else
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)

        QBCore.Functions.TriggerCallback("weapon:server:GetWeaponAmmo", function(result)
            local ammo = tonumber(result)
            if weaponName == "weapon_petrolcan" or weaponName == "weapon_fireextinguisher" then 
                ammo = 4000
            end
            GiveWeaponToPed(ped, GetHashKey(weaponName), ammo, false, false)
            SetPedAmmo(ped, GetHashKey(weaponName), ammo)
            SetCurrentPedWeapon(ped, GetHashKey(weaponName), true)
            if weaponData.info.attachments ~= nil then
                for _, attachment in pairs(weaponData.info.attachments) do
                    GiveWeaponComponentToPed(ped, GetHashKey(weaponName), GetHashKey(attachment.component))
                end
            end
            currentWeapon = weaponName
            TriggerEvent('qb-hud:client:ToggleWeaponMode', true)  
            TriggerEvent('inventory:client:WeaponHolster', weaponData, currentWeapon)
        end, CurrentWeaponData)
    end
end)

RegisterNetEvent('inventory:client:CheckWeapon', function(weaponName)
    local ped = PlayerPedId()
    if currentWeapon == weaponName then
        TriggerEvent('weapons:ResetHolster')
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(ped, true)
        currentWeapon = nil
    end
end)

RegisterNetEvent('inventory:client:AddDropItem', function(dropId, player, coords)
    local forward = GetEntityForwardVector(GetPlayerPed(GetPlayerFromServerId(player)))
	local x, y, z = table.unpack(coords + forward * 0.5)
    Drops[dropId] = {
        id = dropId,
        coords = {
            x = x,
            y = y,
            z = z - 0.3,
        },
    }
end) 

RegisterNetEvent('inventory:client:RemoveDropItem', function(dropId)
    Drops[dropId] = nil
    DropsNear[dropId] = nil
end)

RegisterNetEvent('inventory:client:DropItemAnim', function()
    local ped = PlayerPedId()
    SendNUIMessage({
        action = "close",
    })
    RequestAnimDict("pickup_object")
    while not HasAnimDictLoaded("pickup_object") do
        Wait(7)
    end
    TaskPlayAnim(ped, "pickup_object" ,"pickup_low" ,8.0, -8.0, -1, 1, 0, false, false, false )
    Wait(2000)
    ClearPedTasks(ped)
end)

RegisterNetEvent("inventory:client:showWeaponLicense", function(sourceId, citizenid, character)
    local sourcePos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(sourceId)), false)
    local pos = GetEntityCoords(PlayerPedId(), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>Citizen-ID:</strong> {1} <br><strong>First Name:</strong> {2} <br><strong>Last Name:</strong> {3} <br><strong>Type:</strong> {4} </div></div>',
            args = {'Weapon License', character.citizenid, character.firstname, character.lastname, character.type}
        })
    end
end) 

RegisterNetEvent("inventory:client:SetCurrentStash", function(stash)
    CurrentStash = stash
end)

RegisterNetEvent("inventory:client:Crafting", function(dropId)
	local crafting = {}
	crafting.label = "Crafting"
	crafting.items = GetThresholdItems()
	TriggerServerEvent("inventory:server:OpenInventory", "crafting", math.random(1, 99), crafting)
end)


RegisterNetEvent("inventory:client:WeaponAttachmentCrafting", function(dropId)
	local crafting = {}
	crafting.label = "Attachment Crafting"
	crafting.items = GetAttachmentThresholdItems()
	TriggerServerEvent("inventory:server:OpenInventory", "attachment_crafting", math.random(1, 99), crafting)
end)

RegisterNetEvent('inventory:client:CraftItems', function(itemName, itemCosts, amount, toSlot, points)
    local ped = PlayerPedId()
    SendNUIMessage({
        action = "close",
    })
    isCrafting = true
    QBCore.Functions.Progressbar("repair_vehicle", "Crafting..", (math.random(2000, 5000) * amount), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "mini@repair",
		anim = "fixing_a_player",
		flags = 16,
	}, {}, {}, function() -- Done
		StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
        TriggerServerEvent("inventory:server:CraftItems", itemName, itemCosts, amount, toSlot, points)
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'add', amount)
        isCrafting = false
	end, function() -- Cancel
		StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
        QBCore.Functions.Notify("Failed", "error")
        isCrafting = false
	end)
end)

RegisterNetEvent('inventory:client:CraftAttachment', function(itemName, itemCosts, amount, toSlot, points)
    local ped = PlayerPedId()
    SendNUIMessage({
        action = "close",
    })
    isCrafting = true
    QBCore.Functions.Progressbar("repair_vehicle", "Crafting..", (math.random(2000, 5000) * amount), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "mini@repair",
		anim = "fixing_a_player",
		flags = 16,
	}, {}, {}, function() -- Done
		StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
        TriggerServerEvent("inventory:server:CraftAttachment", itemName, itemCosts, amount, toSlot, points)
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'add',amount)
        isCrafting = false
	end, function() -- Cancel
		StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
        QBCore.Functions.Notify("Failed", "error")
        isCrafting = false
	end)
end)


-- Commands
RegisterCommand('inventory', function()
    if not isCrafting and not inInventory then
        QBCore.Functions.GetPlayerData(function(PlayerData) 
            if not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() then
                local ped = PlayerPedId()
                local curVeh = nil
                local BinFound = ClosestGarbageBin()
                local DumpsterFound = ClosestContainer()
                local JailContainerFound = ClosestJailContainer()

                if IsPedInAnyVehicle(ped) then
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    CurrentGlovebox = GetVehicleNumberPlateText(vehicle)
                    curVeh = vehicle
                    CurrentVehicle = nil
                else
                    local vehicle = QBCore.Functions.GetClosestVehicle()
                    if vehicle ~= 0 and vehicle ~= nil then
                        local pos = GetEntityCoords(ped)
                        local trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        end
                        if #(pos - trunkpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            if GetVehicleDoorLockStatus(vehicle) < 2 then
                                CurrentVehicle = GetVehicleNumberPlateText(vehicle)
                                curVeh = vehicle
                                CurrentGlovebox = nil
                            else
                                QBCore.Functions.Notify("Vehicle is locked..", "error")
                                return
                            end
                        else
                            CurrentVehicle = nil
                        end
                    else
                        CurrentVehicle = nil
                    end
                end

                -- Trunk
    
                if CurrentVehicle ~= nil then
                    local vehicleClass = GetVehicleClass(curVeh)
                    local maxweight = 0
                    local slots = 0
                    if vehicleClass == 0 then
                        maxweight = 38000
                        slots = 30
                    elseif vehicleClass == 1 then
                        maxweight = 50000
                        slots = 40
                    elseif vehicleClass == 2 then
                        maxweight = 75000
                        slots = 50
                    elseif vehicleClass == 3 then
                        maxweight = 42000
                        slots = 35
                    elseif vehicleClass == 4 then
                        maxweight = 38000
                        slots = 30
                    elseif vehicleClass == 5 then
                        maxweight = 30000
                        slots = 25
                    elseif vehicleClass == 6 then
                        maxweight = 30000
                        slots = 25
                    elseif vehicleClass == 7 then
                        maxweight = 30000
                        slots = 25
                    elseif vehicleClass == 8 then
                        maxweight = 15000
                        slots = 15
                    elseif vehicleClass == 9 then
                        maxweight = 60000
                        slots = 35
                    elseif vehicleClass == 12 then
                        maxweight = 120000
                        slots = 35
		            elseif vehicleClass == 13 then
                        maxweight = 0
                        slots = 0
                    elseif vehicleClass == 14 then
                        maxweight = 120000
                        slots = 50
                    elseif vehicleClass == 15 then
                        maxweight = 120000
                        slots = 50
                    elseif vehicleClass == 16 then
                        maxweight = 120000
                        slots = 50
                    else
                        maxweight = 60000
                        slots = 35
                    end
                    local other = {
                        maxweight = maxweight,
                        slots = slots,
                    }
                    TriggerServerEvent("inventory:server:OpenInventory", "trunk", CurrentVehicle, other)
                    OpenTrunk()
                elseif CurrentGlovebox ~= nil then
                    TriggerServerEvent("inventory:server:OpenInventory", "glovebox", CurrentGlovebox)
                elseif CurrentDrop ~= 0 then
                    TriggerServerEvent("inventory:server:OpenInventory", "drop", CurrentDrop)
                elseif BinFound then
                    local GarbageBin = 'Garbage Bin | '..math.floor(BinFound.x).. ' | '..math.floor(BinFound.y)..' |'
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", GarbageBin, {maxweight = 1000000, slots = 15})
                    TriggerEvent("inventory:client:SetCurrentStash", GarbageBin)
                elseif DumpsterFound then
                    local Dumpster = 'Dumpster | '..math.floor(DumpsterFound.x).. ' | '..math.floor(DumpsterFound.y)..' |'
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", Dumpster, {maxweight = 1000000, slots = 15})
                    TriggerEvent("inventory:client:SetCurrentStash", Dumpster)
                elseif JailContainerFound then 
                    local Container = 'Jail-Container | '..math.floor(JailContainerFound.x).. ' | '..math.floor(JailContainerFound.y)..' |'
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", Container, {maxweight = 1000000, slots = 15})
                    TriggerEvent("inventory:client:SetCurrentStash", Container)
                else
                    TriggerEvent('InventoryAnim')
                    TriggerServerEvent("inventory:server:OpenInventory")
                end
            end    
        end)
    end
end)
RegisterKeyMapping('inventory', 'Open Inventory', 'keyboard', 'TAB')


RegisterCommand('hotbar', function()
    isHotbar = not isHotbar
	QBCore.Functions.GetPlayerData(function(PlayerData)
        if not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() then
			ToggleHotbar(isHotbar)
		end
	end)
end)
RegisterKeyMapping('hotbar', 'Toggles keybind slots', 'keyboard', 'z')

for i=1, 6 do
    RegisterCommand('slot' .. i,function()
        QBCore.Functions.GetPlayerData(function(PlayerData)
            if not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() then
                if i == 6 then
                    i = MaxInventorySlots
                end
                TriggerServerEvent("inventory:server:UseItemSlot", i)
            end
        end)
    end)
    RegisterKeyMapping('slot' .. i, 'Uses the item in slot ' .. i, 'keyboard', i)
end



-- NuiCallbacks


RegisterNUICallback('RobMoney', function(data, cb)
    TriggerServerEvent("police:server:RobPlayer", data.TargetId)
end)

RegisterNUICallback('Notify', function(data, cb)
    QBCore.Functions.Notify(data.message, data.type)
end)

RegisterNUICallback("GiveItem", function(data, cb)
    local player, distance = QBCore.Functions.GetClosestPlayer(GetEntityCoords(PlayerPedId()))
    if player ~= -1 and distance < 3 then
        if (data.inventory == 'player') then
            local playerId = GetPlayerServerId(player)
            SetCurrentPedWeapon(PlayerPedId(),'WEAPON_UNARMED',true)
            TriggerServerEvent("inventory:server:GiveItem", playerId, data.inventory, data.item, data.amount)
        else
            QBCore.Functions.Notify("You do not own this item!", "error")
        end
    else
        QBCore.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNUICallback('GetWeaponData', function(data, cb)
    local data = {
        WeaponData = QBCore.Shared.Items[data.weapon],
        AttachmentData = FormatWeaponAttachments(data.ItemData)
    }
    cb(data)
end)

RegisterNUICallback('RemoveAttachment', function(data, cb)
    local ped = PlayerPedId()
    local WeaponData = QBCore.Shared.Items[data.WeaponData.name]
    local Attachment = WeaponAttachments[WeaponData.name:upper()][data.AttachmentData.attachment]

    QBCore.Functions.TriggerCallback('weapons:server:RemoveAttachment', function(NewAttachments)
        if NewAttachments ~= false then
            local Attachies = {}
            RemoveWeaponComponentFromPed(ped, GetHashKey(data.WeaponData.name), GetHashKey(Attachment.component))
            for k, v in pairs(NewAttachments) do
                for wep, pew in pairs(WeaponAttachments[WeaponData.name:upper()]) do
                    if v.component == pew.component then
                        Attachies[#Attachies+1] = {
                            attachment = pew.item,
                            label = pew.label,
                        }
                    end
                end
            end
            local DJATA = {
                Attachments = Attachies,
                WeaponData = WeaponData,
            }
            cb(DJATA)
        else
            RemoveWeaponComponentFromPed(ped, GetHashKey(data.WeaponData.name), GetHashKey(Attachment.component))
            cb({})
        end
    end, data.AttachmentData, data.WeaponData)
end)

RegisterNUICallback('getCombineItem', function(data, cb)
    cb(QBCore.Shared.Items[data.item])
end)

RegisterNUICallback("CloseInventory", function(data, cb)
    if currentOtherInventory == "none-inv" then
        CurrentDrop = 0
        CurrentVehicle = nil
        CurrentGlovebox = nil
        CurrentStash = nil
        SetNuiFocus(false, false)
        inInventory = false
        TriggerScreenblurFadeOut(1000)
        ClearPedTasks(PlayerPedId())
        return
    end
    if CurrentVehicle ~= nil then
        CloseTrunk()
        TriggerServerEvent("inventory:server:SaveInventory", "trunk", CurrentVehicle)
        CurrentVehicle = nil
    elseif CurrentGlovebox ~= nil then
        TriggerServerEvent("inventory:server:SaveInventory", "glovebox", CurrentGlovebox)
        CurrentGlovebox = nil
    elseif CurrentStash ~= nil then
        TriggerServerEvent("inventory:server:SaveInventory", "stash", CurrentStash)  
        CurrentStash = nil
    else
        TriggerServerEvent("inventory:server:SaveInventory", "drop", CurrentDrop)
        CurrentDrop = 0
    end
    SetNuiFocus(false, false)
    inInventory = false

    TriggerScreenblurFadeOut(1000)
    TriggerEvent('InventoryAnim')
    DeletePedScreen()
end)
 
RegisterNUICallback("UseItem", function(data, cb)
    TriggerServerEvent("inventory:server:UseItem", data.inventory, data.item)
end)

RegisterNUICallback("combineItem", function(data)
    Wait(150)
    TriggerServerEvent('inventory:server:combineItem', data.reward, data.fromItem, data.toItem)
end)

RegisterNetEvent('inventory:client:RobPlayer', function()
    local player, distance = GetClosestPlayer()

    if player ~= -1 and distance < 2.5 then
        local playerPed = GetPlayerPed(player)
        local playerId = GetPlayerServerId(player)
        if IsEntityPlayingAnim(playerPed, "missminuteman_1ig_2", "handsup_base", 3) --[[or IsEntityPlayingAnim(playerPed, "mp_arresting", "idle", 3) or IsTargetDead(playerId)]] then
            QBCore.Functions.Progressbar("robbing_player", "Robbing person..", math.random(5000, 7000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "random@shop_robbery",
                anim = "robbery_action_b",
                flags = 16,
            }, {}, {}, function() -- Done
                local plyCoords = GetEntityCoords(playerPed)
                local pos = GetEntityCoords(PlayerPedId())
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, plyCoords.x, plyCoords.y, plyCoords.z, true)
                if dist < 2.5 then
                    StopAnimTask(PlayerPedId(), "random@shop_robbery", "robbery_action_b", 1.0)
                    TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", playerId)
                    TriggerEvent("inventory:server:RobPlayer", playerId)
                else
                    QBCore.Functions.Notify("No one nearby!", "error")
                end
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), "random@shop_robbery", "robbery_action_b", 1.0)
                QBCore.Functions.Notify("Canceled..", "error")
            end)
		else
			QBCore.Functions.Notify("Players hands are not up!", "error")
        end
    else
        QBCore.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNUICallback('combineWithAnim', function(data)
    local ped = PlayerPedId()

    local combineData = data.combineData
    local aDict = combineData.anim.dict
    local aLib = combineData.anim.lib
    local animText = combineData.anim.text
    local animTimeout = combineData.anim.timeOut

    QBCore.Functions.Progressbar("combine_anim", animText, animTimeout, false, true, {
        disableMovement = false,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = aDict,
        anim = aLib,
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), aDict, aLib, 1.0)
        TriggerServerEvent('inventory:server:combineItem', combineData.reward, data.requiredItem, data.usedItem)
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), aDict, aLib, 1.0)
        QBCore.Functions.Notify("Failed!", "error")
    end)
end)

RegisterNUICallback("SetInventoryData", function(data, cb)
    TriggerServerEvent("inventory:server:SetInventoryData", data.fromInventory, data.toInventory, data.fromSlot, data.toSlot, data.fromAmount, data.toAmount)
end)

RegisterNUICallback("PlayDropSound", function(data, cb)
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback("PlayDropFail", function(data, cb)
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)



-- Threads
CreateThread(function()
    while true do
        Wait(1)
        if DropsNear ~= nil then
            for k, v in pairs(DropsNear) do
                if DropsNear[k] ~= nil then
                    DrawMarker(2, v.coords.x, v.coords.y, v.coords.z - 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 255, 255, 255, 155, false, false, false, false, false, false, false)
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        if Drops ~= nil and next(Drops) ~= nil then
            local pos = GetEntityCoords(PlayerPedId(), true)
            for k, v in pairs(Drops) do
                if Drops[k] ~= nil then
                    local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
                    if dist < 7.5 then
                        DropsNear[k] = v
                        if dist < 1.3 then
                            CurrentDrop = k
                        else
                            CurrentDrop = nil
                        end
                    else
                        DropsNear[k] = nil
                    end
                end
            end
        else
            DropsNear = {}
        end
        Wait(500)
    end
end)

CreateThread(function()
    while true do
        Wait(1)
        DisableControlAction(0, 37, true) -- TAB
        DisableControlAction(0, 157, true) -- 1
        DisableControlAction(0, 158, true) -- 2
        DisableControlAction(0, 160, true) -- 3
        DisableControlAction(0, 164, true) -- 4
        DisableControlAction(0, 165, true) -- 5
    end
end)

--====================================================================================================================

function GetClosestPlayer()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end

function ClosestJailContainer()
  for k, v in pairs(Config.JailContainers) do
      local StartShape = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 0.1, 0)
      local EndShape = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 1.8, -0.4)
      local RayCast = StartShapeTestRay(StartShape.x, StartShape.y, StartShape.z, EndShape.x, EndShape.y, EndShape.z, 16, PlayerPedId(), 0)
      local Retval, Hit, Coords, Surface, EntityHit = GetShapeTestResult(RayCast)
      local BinModel = 0
      if EntityHit then
        BinModel = GetEntityModel(EntityHit)
      end
      if v['Model'] == BinModel then
       local EntityHitCoords = GetEntityCoords(EntityHit)
       if EntityHitCoords.x < 0 or EntityHitCoords.y < 0 then
           EntityHitCoords = {x = EntityHitCoords.x + 5000,y = EntityHitCoords.y + 5000}
       end
       return EntityHitCoords
      end
  end
end

function ClosestContainer()
    for k, v in pairs(Config.Dumpsters) do
        local StartShape = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 0.1, 0)
        local EndShape = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 1.8, -0.4)
        local RayCast = StartShapeTestRay(StartShape.x, StartShape.y, StartShape.z, EndShape.x, EndShape.y, EndShape.z, 16, PlayerPedId(), 0)
        local Retval, Hit, Coords, Surface, EntityHit = GetShapeTestResult(RayCast)
        local BinModel = 0
        if EntityHit then
          BinModel = GetEntityModel(EntityHit)
        end
        if v['Model'] == BinModel then
         local EntityHitCoords = GetEntityCoords(EntityHit)
         if EntityHitCoords.x < 0 or EntityHitCoords.y < 0 then
             EntityHitCoords = {x = EntityHitCoords.x + 5000,y = EntityHitCoords.y + 5000}
         end
         return EntityHitCoords
        end
    end
end
 
function ClosestGarbageBin() 
    for k, v in pairs(Config.GarbageBin) do
        local StartShape = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 0.1, 0)
        local EndShape = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 1.8, -0.4)
        local RayCast = StartShapeTestRay(StartShape.x, StartShape.y, StartShape.z, EndShape.x, EndShape.y, EndShape.z, 16, PlayerPedId(), 0)
        local Retval, Hit, Coords, Surface, EntityHit = GetShapeTestResult(RayCast)
        local BinModel = 0
        if EntityHit then
            BinModel = GetEntityModel(EntityHit)

        end
        if v['Model'] == BinModel then
            local EntityHitCoords = GetEntityCoords(EntityHit)
            if EntityHitCoords.x < 0 or EntityHitCoords.y < 0 then
                EntityHitCoords = {x = EntityHitCoords.x + 7500,y = EntityHitCoords.y + 7500}
            end
            return EntityHitCoords
        end
    end
end

-- function ClosestGarbageBin()
--     local ped = PlayerPedId()
--     local pos = GetEntityCoords(ped)
--     local object = nil
--     for _, machine in pairs(Config.GarbageBin) do
--         local ClosestObject = GetClosestObjectOfType(pos.x, pos.y, pos.z, 2.75, GetHashKey(machine), 0, 0, 0)
--         if ClosestObject ~= 0 and ClosestObject ~= nil then
--             if object == nil then
--                 object = ClosestObject
--             end
        
--         end

--     end
--     return object
-- end

RegisterNetEvent('inventory:client:OpenVendingMachine', function()
    local ShopItems = {}
    local num = math.random(1, 99)
    ShopItems.label = "Vending Machine "..num
    ShopItems.items = Config.VendingMachine
    ShopItems.slots = #Config.VendingMachine
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_"..num, ShopItems)
end)

RegisterNetEvent('inventory:client:OpenWaterMachine', function()
    local ShopItems = {}
    local num = math.random(1, 99)
    ShopItems.label = "Water Machine "..num
    ShopItems.items = Config.WaterMachine
    ShopItems.slots = #Config.WaterMachine
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_"..num, ShopItems)
end)

RegisterNetEvent('inventory:client:OpenCoffeeMachine', function()
    local ShopItems = {}
    local num = math.random(1, 99)
    ShopItems.label = "Coffee Machine "..num
    ShopItems.items = Config.CoffeeMachine
    ShopItems.slots = #Config.CoffeeMachine
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_"..num, ShopItems)
end)

RegisterNetEvent('inventory:client:OpenSodaMachine', function()
    local ShopItems = {}
    local num = math.random(1, 99)
    ShopItems.label = "Soda Machine "..num
    ShopItems.items = Config.SodaMachine
    ShopItems.slots = #Config.SodaMachine
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_"..num, ShopItems)
end)

RegisterNetEvent('inventory:client:openBurgerStorage', function()
    local ShopItems = {}
    ShopItems.label = "Burgershot"
    ShopItems.items = Config.BurgerShotStorage
    ShopItems.slots = #Config.BurgerShotStorage
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_", ShopItems)
end)


function closeInventoryOpenStash()
    SendNUIMessage({
        action = "close",
    })
    Wait (270)
end

RegisterNetEvent('qb-items:client:use:duffel-bag', function(BagId)
	local player = PlayerPedId()
	if not clothingitem then 
    QBCore.Functions.Progressbar("use_bag", "Putting on Bag", 2000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
		RequestAnimDict(dict)
		TaskPlayAnim(player, "clothingtie", "try_tie_negative_a", 3.0, 3.0, 2000, 51, 0, false, false, false)
		Wait (600)
		ClearPedSecondaryTask(PlayerPedId())
		SetPedComponentVariation(PlayerPedId(), 5, 41, 0, 2)
		clothingitem = true
        closeInventoryOpenStash()

		TriggerServerEvent("inventory:server:OpenInventory", "stash", 'bag_'..BagId, {maxweight = 100000, slots = 10})
		TriggerEvent("inventory:client:SetCurrentStash", 'bag_'..BagId)
		end)
	elseif clothingitem then
		clothingitem = false
		RequestAnimDict(dict)
		TaskPlayAnim(player, "clothingtie", "try_tie_negative_a", 3.0, 3.0, 2000, 51, 0, false, false, false)
		Wait (600)
		ClearPedSecondaryTask(PlayerPedId())
		SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 2)
	end
	Wait(1000)
end) 

RegisterNetEvent('qb-items:client:use:murder-meal', function(MealId)
    closeInventoryOpenStash()
	TriggerServerEvent("inventory:server:OpenInventory", "stash", 'meal_'..MealId, {maxweight = 20000, slots = 5})
	TriggerEvent("inventory:client:SetCurrentStash", 'meal_'..MealId) 

end) 

RegisterNetEvent('inventory:client:OpenDumpster', function()
    -- local DumpsterFound = ClosestContainer()
    -- local Dumpster = 'Dumpster | '..math.floor(DumpsterFound.x).. ' | '..math.floor(DumpsterFound.y)..' |'
    -- TriggerServerEvent("inventory:server:OpenInventory", "stash", Dumpster, {maxweight = 1000000, slots = 15})
    -- TriggerEvent("inventory:client:SetCurrentStash", Dumpster)
    QBCore.Functions.Notify("Open inventory right next to dumpster to access!", "error")
end) 

RegisterNetEvent('inventory:client:OpenBin', function()
    -- local BinFound = ClosestGarbageBin()
    -- local GarbageBin = 'Garbage Bin | '..math.floor(BinFound.x).. ' | '..math.floor(BinFound.y)..' |'
    -- TriggerServerEvent("inventory:server:OpenInventory", "stash", GarbageBin, {maxweight = 1000000, slots = 15})
    -- TriggerEvent("inventory:client:SetCurrentStash", GarbageBin)
    QBCore.Functions.Notify("Open inventory right next to bin to access!", "error")
end)

RegisterNUICallback('OpenHudMenu', function()
    if Config.SettingsButton.enablemenu then 
        ExecuteCommand(Config.SettingsButton.command)  
    else
        if Config.SettingsButton.enablemessage then
            QBCore.Functions.Notify(Config.SettingsButton.message, "error")
        else
            -- do nothing
        end
    end
end) 


-- CloseInventory very rare if scuff 
RegisterCommand('closeinv', function()
	exports['textUi']:DrawTextUi('show', "Closing Inventory ")
    Wait(1000)
	exports['textUi']:DrawTextUi('show', "Closing Inventory .")
    Wait(1000)
	exports['textUi']:DrawTextUi('show', "Closing Inventory ..")
    Wait(1000)
    SendNUIMessage({
        action = "close",
    })
	exports['textUi']:DrawTextUi('show', "Inventory Closed")
    Wait(1000)
    exports['textUi']:DrawTextUi('hide')
end, false)

-- local toolBoxModels = {
--     `prop_toolchest_05`,
--     `prop_tool_bench02_ld`,
--     `prop_tool_bench02`,
--     `prop_toolchest_02`,
--     `prop_toolchest_03`,
--     `prop_toolchest_03_l2`,
--     `prop_toolchest_05`,
--     `prop_toolchest_04`,
-- }
-- exports['qb-target']:AddTargetModel(toolBoxModels, {
-- 		options = {
-- 			{
-- 				event = "inventory:client:WeaponAttachmentCrafting",
-- 				icon = "fas fa-wrench",
-- 				label = "Weapon Attachment Crafting", 
-- 			},
-- 			{
-- 				event = "inventory:client:Crafting",
-- 				icon = "fas fa-wrench",
-- 				label = "Item Crafting", 
-- 			},
-- 		},
--     distance = 1.0
-- })
