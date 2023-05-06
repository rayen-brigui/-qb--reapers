local weapons = {
	'WEAPON_FLASHLIGHT',
	'WEAPON_KNIFE',
	'WEAPON_MACHETE',
	'WEAPON_NIGHTSTICK',
	'WEAPON_HAMMER',
	'WEAPON_BAT',
	'WEAPON_GOLFCLUB',
	'WEAPON_CROWBAR',
	'WEAPON_BOTTLE',
	'WEAPON_HATCHET',
	'WEAPON_DAGGER',
	'WEAPON_KATANA',
	'WEAPON_SHIV',
	'WEAPON_BOOK',
	'WEAPON_CASH',
	'WEAPON_BRICK',
	'WEAPON_SHOE',
	'WEAPON_PISTOL',
	'WEAPON_PISTOL_MK2',
	'WEAPON_COMBATPISTOL',
	'WEAPON_APPISTOL',
	'WEAPON_PISTOL50',
	'WEAPON_SNSPISTOL',
	'WEAPON_HEAVYPISTOL',
	'WEAPON_NAILGUN',
	'WEAPON_GLOCK',
	'WEAPON_DP9',
	'WEAPON_MICROSMG',
	'WEAPON_MICROSMG2',
	'WEAPON_MICROSMG3',
	'WEAPON_SMG',
	'WEAPON_MINISMG',
	'WEAPON_MACHINEPISTOL',
	'WEAPON_COMBATPDW',
	'WEAPON_PUMPSHOTGUN',
	'WEAPON_SAWNOFFSHOTGUN',
	'WEAPON_ASSAULTRIFLE',
	'WEAPON_ASSAULTRIFLE_MK2',
	'WEAPON_CARBINERIFLE',
	'WEAPON_CARBINERIFLE_MK2',
	'WEAPON_M4',
	'WEAPON_COMPACTRIFLE',
	'WEAPON_COMBATMG',
	'WEAPON_SNIPERRIFLE',
	'WEAPON_GRENADELAUNCHER_SMOKE',
	'WEAPON_RPG',
	'WEAPON_MINIGUN',
	'WEAPON_GRENADE',
	'WEAPON_STICKYBOMB',
	'WEAPON_SMOKEGRENADE',
	'WEAPON_BZGAS',
	'WEAPON_MOLOTOV',
	'WEAPON_FIREWORK',
	'WEAPON_TASER',
	'WEAPON_RAILGUN',
	'WEAPON_DBSHOTGUN',
	'WEAPON_PIPEBOMB',
	'WEAPON_DOUBLEACTION',
}

-- Weapons that require the Police holster animation
local holsterableWeapons = {
	'WEAPON_TASER',
	'WEAPON_PISTOL',
	'WEAPON_PISTOL_MK2',
	'WEAPON_COMBATPISTOL',
	'WEAPON_APPISTOL',
	'WEAPON_PISTOL50',
	'WEAPON_SNSPISTOL',
	'WEAPON_HEAVYPISTOL'
}

local holstered = true
local canFire = true
local currWeapon = GetHashKey('WEAPON_UNARMED')
local currentHoldster = nil

RegisterNetEvent('weapons:ResetHolster')
AddEventHandler('weapons:ResetHolster', function()
	holstered = true
	canFire = true
	currWeapon = GetHashKey('WEAPON_UNARMED')
	currentHoldster = nil
end)

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInParachuteFreeFall(ped) and not IsPedFalling(ped) and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) then
			if currWeapon ~= GetSelectedPedWeapon(ped) then
				pos = GetEntityCoords(ped, true)
				rot = GetEntityHeading(ped)

				local newWeap = GetSelectedPedWeapon(ped)
				SetCurrentPedWeapon(ped, currWeapon, true)
				loadAnimDict("reaction@intimidation@1h")
				loadAnimDict("reaction@intimidation@cop@unarmed")
				loadAnimDict("rcmjosh4")
				loadAnimDict("weapons@pistol@")
				if CheckWeapon(newWeap) then
					if holstered then
						if QBCore.Functions.GetPlayerData().job.name == "police" then
							--TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
							canFire = false
							currentHoldster = GetPedDrawableVariation(ped, 7)
							TaskPlayAnimAdvanced(ped, "rcmjosh4", "josh_leadout_cop2", GetEntityCoords(ped, true), 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(300)
							SetCurrentPedWeapon(ped, newWeap, true)

							if IsWeaponHolsterable(newWeap) then
								if currentHoldster == 8 then
									SetPedComponentVariation(ped, 7, 2, 0, 2)
								elseif currentHoldster == 1 then
									SetPedComponentVariation(ped, 7, 3, 0, 2)
								elseif currentHoldster == 6 then
									SetPedComponentVariation(ped, 7, 5, 0, 2)
								end
							end
							currWeapon = newWeap
							Citizen.Wait(300)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						else
							canFire = false
							TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1000)
							SetCurrentPedWeapon(ped, newWeap, true)
							currWeapon = newWeap
							Citizen.Wait(1400)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						end
					elseif newWeap ~= currWeapon and CheckWeapon(currWeapon) then
						if QBCore.Functions.GetPlayerData().job.name == "police" then
							canFire = false

							TaskPlayAnimAdvanced(ped, "reaction@intimidation@cop@unarmed", "intro", GetEntityCoords(ped, true), 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(500)

							if IsWeaponHolsterable(currWeapon) then
								SetPedComponentVariation(ped, 7, currentHoldster, 0, 2)
							end

							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							currentHoldster = GetPedDrawableVariation(ped, 7)

							TaskPlayAnimAdvanced(ped, "rcmjosh4", "josh_leadout_cop2", GetEntityCoords(ped, true), 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(300)
							SetCurrentPedWeapon(ped, newWeap, true)

							if IsWeaponHolsterable(newWeap) then
								if currentHoldster == 8 then
									SetPedComponentVariation(ped, 7, 2, 0, 2)
								elseif currentHoldster == 1 then
									SetPedComponentVariation(ped, 7, 3, 0, 2)
								elseif currentHoldster == 6 then
									SetPedComponentVariation(ped, 7, 5, 0, 2)
								end
							end

							Citizen.Wait(500)
							currWeapon = newWeap
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						else
							canFire = false
							TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "outro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1600)
							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1000)
							SetCurrentPedWeapon(ped, newWeap, true)
							currWeapon = newWeap
							Citizen.Wait(1400)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						end
					else
						if QBCore.Functions.GetPlayerData().job.name == "police" then
							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							currentHoldster = GetPedDrawableVariation(ped, 7)
							TaskPlayAnimAdvanced(ped, "rcmjosh4", "josh_leadout_cop2", GetEntityCoords(ped, true), 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(300)
							SetCurrentPedWeapon(ped, newWeap, true)

							if IsWeaponHolsterable(newWeap) then
								if currentHoldster == 8 then
									SetPedComponentVariation(ped, 7, 2, 0, 2)
								elseif currentHoldster == 1 then
									SetPedComponentVariation(ped, 7, 3, 0, 2)
								elseif currentHoldster == 6 then
									SetPedComponentVariation(ped, 7, 5, 0, 2)
								end
							end

							currWeapon = newWeap
							Citizen.Wait(300)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						else
							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1000)
							SetCurrentPedWeapon(ped, newWeap, true)
							currWeapon = newWeap
							Citizen.Wait(1400)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						end
					end
				else
					if not holstered and CheckWeapon(currWeapon) then
						if QBCore.Functions.GetPlayerData().job.name == "police" then
							canFire = false
							TaskPlayAnimAdvanced(ped, "reaction@intimidation@cop@unarmed", "intro", GetEntityCoords(ped, true), 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(500)
							
							if IsWeaponHolsterable(currWeapon) then
								SetPedComponentVariation(ped, 7, currentHoldster, 0, 2)
							end

							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							ClearPedTasks(ped)
							SetCurrentPedWeapon(ped, newWeap, true)
							holstered = true
							canFire = true
							currWeapon = newWeap
						else
							canFire = false
							TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "outro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Citizen.Wait(1400)
							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							ClearPedTasks(ped)
							SetCurrentPedWeapon(ped, newWeap, true)
							holstered = true
							canFire = true
							currWeapon = newWeap
						end
					else
						SetCurrentPedWeapon(ped, newWeap, true)
						holstered = false
						canFire = true
						currWeapon = newWeap
					end
				end
			end
		else
			Citizen.Wait(1000)
		end

		Citizen.Wait(5)
	end
end)


Citizen.CreateThread(function()
	while true do
		if not canFire then
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 68, true)
			DisableControlAction(0, 91, true)
			DisablePlayerFiring(PlayerPedId(), true)
		else
			Citizen.Wait(750)
		end

		Citizen.Wait(3)
	end
end)

function CheckWeapon(newWeap)
	for i = 1, #weapons do
		if GetHashKey(weapons[i]) == newWeap then
			return true
		end
	end
	return false
end

function IsWeaponHolsterable(weap)
	for i = 1, #holsterableWeapons do
		if GetHashKey(holsterableWeapons[i]) == weap then
			return true
		end
	end
	return false
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end