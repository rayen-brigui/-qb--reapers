local QBCore = exports['qb-core']:GetCoreObject()
local wearing = false

RegisterNetEvent('chains:client:chain_V', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 1, 0)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_V1', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 1, 1)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_V2', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 1, 2)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_bdb', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 2, 0)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_cp1', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 3, 0)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_cp2', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 3, 1)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_skull', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 4, 0)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_skull2', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 4, 1)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_skull3', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 4, 2)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_skull4', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 4, 3)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_skull5', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 4, 4)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_skull6', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 4, 5)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_skull7', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 4, 6)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_nocap', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 5, 0)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_snake', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 7, 0)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_link', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 8, 0)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au1', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 0)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au2', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 1)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au3', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 2)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au4', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 3)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au5', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 4)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au6', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 5)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au7', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 6)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au8', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 7)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au9', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 8)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au10', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 9)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au11', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 10)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au12', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 11)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au13', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 12)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au14', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 13)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au15', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 14)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)
RegisterNetEvent('chains:client:chain_au16', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 10, 15)
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 7, 0)
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)

RegisterNetEvent('chains:client:gsf', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("XP:attachItem","gsf")
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("XP:removeall")
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)

RegisterNetEvent('chains:client:mdm', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("XP:attachItem","mdm")
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("XP:removeall")
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)

RegisterNetEvent('chains:client:cerb', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("XP:attachItem","cerb")
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("XP:removeall")
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)


RegisterNetEvent('chains:client:koil', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("XP:attachItem","koil")
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("XP:removeall")
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)


RegisterNetEvent('chains:client:esv', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("XP:attachItem","esv")
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("XP:removeall")
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)


RegisterNetEvent('chains:client:cg', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Putting on chain..", 3000, false, true, {
        
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("XP:attachItem","cg")
            wearing = true
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    elseif wearing then
        TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
        QBCore.Functions.Progressbar("chain_misc", "Taking off chain..", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("XP:removeall")
            wearing = false
            
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end
end)

