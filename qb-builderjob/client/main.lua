local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}

local BuilderData = {
    ShowDetails = false,
    CurrentTask = nil,
}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job
    GetCurrentProject()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    GetCurrentProject()
end)

CreateThread(function()
    Wait(1000)
    PlayerData = QBCore.Functions.GetPlayerData()
    GetCurrentProject()
end)

function GetCurrentProject()
    QBCore.Functions.TriggerCallback('qb-builderjob:server:GetCurrentProject', function(BuilderConfig)
        Config = BuilderConfig
    end)
end

function GetCompletedTasks()
    local retval = {
        completed = 0,
        total = #Config.Projects[Config.CurrentProject].ProjectLocations["tasks"]
    }
    for k, v in pairs(Config.Projects[Config.CurrentProject].ProjectLocations["tasks"]) do
        if v.completed then
            retval.completed = retval.completed + 1
        end
    end
    return retval
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inRange = false
        local OffsetZ = 0.2
        
        if Config.CurrentProject ~= 0 then
            local data = Config.Projects[Config.CurrentProject].ProjectLocations["main"]
            local MainDistance = #(pos - vector3(data.coords.x, data.coords.y, data.coords.z))

            if MainDistance < 10 then
                inRange = true
                DrawMarker(2, data.coords.x, data.coords.y, data.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 55, 155, 255, 255, 0, 0, 0, 1, 0, 0, 0)

                if MainDistance < 2 then
                    local TaskData = GetCompletedTasks()
                    if TaskData ~= nil then
                        if not BuilderData.ShowDetails then
                            DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.details_view'))
                            DrawText3Ds(data.coords.x, data.coords.y, data.coords.z + 0.2, Lang:t('info.exercises', {value = TaskData.completed, value2 = TaskData.total}))
                        else
                            DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.details_hide'))
                            for k, v in pairs(Config.Projects[Config.CurrentProject].ProjectLocations["tasks"]) do
                                if v.completed then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z + OffsetZ, Lang:t('info.project_completed', {value = v.label}))
                                else
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z + OffsetZ, Lang:t('info.project_notcompleted', {value = v.label}))
                                end
                                OffsetZ = OffsetZ + 0.2
                            end
                        end

                        if TaskData.completed == TaskData.total then
                            DrawText3Ds(data.coords.x, data.coords.y, data.coords.z - 0.2, Lang:t('info.project_end'))
                            if IsControlJustPressed(0, 47) then
                                TriggerServerEvent('qb-builderjob:server:FinishProject')
                            end
                        end

                        if IsControlJustPressed(0, 38) then
                            BuilderData.ShowDetails = not BuilderData.ShowDetails
                        end
                    end
                end
            end

            for k, v in pairs(Config.Projects[Config.CurrentProject].ProjectLocations["tasks"]) do
                if not v.completed or not v.IsBusy then
                    local TaskDistance = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
                    if TaskDistance < 10 then
                        inRange = true
                        DrawMarker(2, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 55, 155, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                        if TaskDistance < 1.5 then
                            DrawText3Ds(v.coords.x, v.coords.y, v.coords.z + 0.25, Lang:t('info.complete_task'))
                            if IsControlJustPressed(0, 38) then
                                BuilderData.CurrentTask = k
                                DoTask()
                            end
                        end
                    end
                end
            end
        end

        if not inRange then
            Wait(1000)
        end

        Wait(3)
    end
end)

function DoTask()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local TaskData = Config.Projects[Config.CurrentProject].ProjectLocations["tasks"][BuilderData.CurrentTask]
    local CountDown = 5
    TriggerServerEvent('qb-builderjob:server:SetTaskState', BuilderData.CurrentTask, true, false)

    if TaskData.type == "hammer" then
        while CountDown ~= 0 do
            CountDown = CountDown - 1
            Wait(1000)
        end
        TriggerServerEvent('qb-builderjob:server:SetTaskState', BuilderData.CurrentTask, true, true)
    end
end

RegisterNetEvent('qb-builderjob:client:SetTaskState', function(Task, IsBusy, IsCompleted)
    Config.Projects[Config.CurrentProject].ProjectLocations["tasks"][Task].IsBusy = IsBusy
    Config.Projects[Config.CurrentProject].ProjectLocations["tasks"][Task].completed = IsCompleted
end)

RegisterNetEvent('qb-builderjob:client:FinishProject', function(BuilderConfig)
    Config = BuilderConfig
end)