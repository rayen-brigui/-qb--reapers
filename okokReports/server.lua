local oneSync = false
local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	if GetConvar("onesync") ~= 'off' then
		oneSync = true
	end
	
end)

-------------------------- VARS

local Webhook = 'https://discord.com/api/webhooks/1100158329155752057/zgABenHTWPdRPcYLosgjFu4i_0jQz9BWsuv-MmlhSeXj69l3j2LK8JC8RTHsKnkFxRRu'
local staffs = {}
local FeedbackTable = {}

-------------------------- NEW FEEDBACK

RegisterNetEvent("okokReports:NewFeedback")
AddEventHandler("okokReports:NewFeedback", function(data)
	local identifierlist = ExtractIdentifiers(source)
	local newFeedback = {
		feedbackid = #FeedbackTable+1,
		playerid = source,
		identifier = GetPlayerName(source),
		subject = data.subject,
		information = data.information,
		category = data.category,
		concluded = false,
		discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"
	}

	FeedbackTable[#FeedbackTable+1] = newFeedback

	TriggerClientEvent("okokReports:NewFeedback", -1, newFeedback)

	if Webhook ~= '' then
		newFeedbackWebhook(newFeedback)
	end
end)

-------------------------- FETCH FEEDBACK

RegisterNetEvent("okokReports:FetchFeedbackTable")
AddEventHandler("okokReports:FetchFeedbackTable", function()
	local staff = hasPermission(source)
	if staff then
		staffs[source] = true
		TriggerClientEvent("okokReports:FetchFeedbackTable", source, FeedbackTable, staff, oneSync)
	end
end)

-------------------------- ASSIST FEEDBACK

RegisterNetEvent("okokReports:AssistFeedback")
AddEventHandler("okokReports:AssistFeedback", function(feedbackId, canAssist)
	if staffs[source] then
		if canAssist then
			local id = FeedbackTable[feedbackId].playerid
			if GetPlayerPing(id) > 0 then
				local ped = GetPlayerPed(id)
				local playerCoords = GetEntityCoords(ped)
				local pedSource = GetPlayerPed(source)
				local identifierlist = ExtractIdentifiers(source)
				local assistFeedback = {
					feedbackid = feedbackId,
					discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"
				}

				SetEntityCoords(pedSource, playerCoords.x, playerCoords.y, playerCoords.z)
				TriggerClientEvent('okokNotify:Alert', source, "REPORT", "You are assisting FEEDBACK #"..feedbackId.."!", 20000, 'info')
				TriggerClientEvent('okokNotify:Alert', id, "REPORT", "An admin arrived!", 20000, 'info')

				if Webhook ~= '' then
					assistFeedbackWebhook(assistFeedback)
				end
			else	
				TriggerClientEvent('okokNotify:Alert', id, "REPORT", "That player is no longer in the server!", 20000, 'error')
			end
			if not FeedbackTable[feedbackId].concluded then
				FeedbackTable[feedbackId].concluded = "assisting"
			end
			TriggerClientEvent("okokReports:FeedbackConclude", -1, feedbackId, FeedbackTable[feedbackId].concluded)
		end
	end
end)

-------------------------- CONCLUDE FEEDBACK

RegisterNetEvent("okokReports:FeedbackConclude")
AddEventHandler("okokReports:FeedbackConclude", function(feedbackId, canConclude)
	if staffs[source] then
		local feedback = FeedbackTable[feedbackId]
		local identifierlist = ExtractIdentifiers(source)
		local concludeFeedback = {
			feedbackid = feedbackId,
			discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"
		}

		if feedback then
			if feedback.concluded ~= true or canConclude then
				if canConclude then
					if FeedbackTable[feedbackId].concluded == true then
						FeedbackTable[feedbackId].concluded = false
					else
						FeedbackTable[feedbackId].concluded = true
					end
				else
					FeedbackTable[feedbackId].concluded = true
				end
				TriggerClientEvent("okokReports:FeedbackConclude", -1, feedbackId, FeedbackTable[feedbackId].concluded)

				if Webhook ~= '' then
					concludeFeedbackWebhook(concludeFeedback)
				end
			end
		end
	end
end)

-------------------------- HAS PERMISSION

function hasPermission(id)
	local staff = false
	if QBCore.Functions.HasPermission(source, 'god') or QBCore.Functions.HasPermission(source, 'admin') or IsPlayerAceAllowed(source, 'command') then
		staff = true
	end
	return staff
end

-------------------------- IDENTIFIERS

function ExtractIdentifiers(id)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(id) - 1 do
        local playerID = GetPlayerIdentifier(id, i)

        if string.find(playerID, "steam") then
            identifiers.steam = playerID
        elseif string.find(playerID, "ip") then
            identifiers.ip = playerID
        elseif string.find(playerID, "discord") then
            identifiers.discord = playerID
        elseif string.find(playerID, "license") then
            identifiers.license = playerID
        elseif string.find(playerID, "xbl") then
            identifiers.xbl = playerID
        elseif string.find(playerID, "live") then
            identifiers.live = playerID
        end
    end

    return identifiers
end

-------------------------- NEW FEEDBACK WEBHOOK

function newFeedbackWebhook(data)
	if data.category == 'player_report' then
		category = 'Player Report'
	elseif data.category == 'question' then
		category = 'Question'
	else
		category = 'Bug'
	end

	local information = {
		{
			["color"] = Config.NewFeedbackWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Logs',
			},
			["title"] = 'NEW FEEDBACK #'..data.feedbackid,
			["description"] = '**Category:** '..category..'\n**Subject:** '..data.subject..'\n**Information:** '..data.information..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end

-------------------------- ASSIST FEEDBACK WEBHOOK

function assistFeedbackWebhook(data)
	local information = {
		{
			["color"] = Config.AssistFeedbackWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Logs',
			},
			["description"] = '**FEEDBACK #'..data.feedbackid..'** is being assisted by '..data.discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end

-------------------------- CONCLUDE FEEDBACK WEBHOOK

function concludeFeedbackWebhook(data)
	local information = {
		{
			["color"] = Config.ConcludeFeedbackWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Logs',
			},
			["description"] = '**FEEDBACK #'..data.feedbackid..'** has been concluded by '..data.discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end