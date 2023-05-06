Citizen.CreateThread(function()
	while true do
	local count = 0

local text = {
"Reaper SRP",
"Best Server",
"Serious Staff"
}
		for _, __ in pairs(text) do 
			count = count + 1
		end
			
		local presence  = math.random(1, count)
		local player = GetPlayerPed(-1)

		SetDiscordAppId('1087461798032187432')
		SetDiscordRichPresenceAsset('logo_reper') -- Name of the image.
	        SetDiscordRichPresenceAssetText('') -- Text that pops up when you hover over the image.
                SetDiscordRichPresenceAssetSmall('logo_reper') -- Name of the small image.
		SetDiscordRichPresenceAssetSmallText('') -- Name of the small tsext.
        SetDiscordRichPresenceAction(0, "Discord!", "https://discord.gg/3CaNjdCDaD")
        SetDiscordRichPresenceAction(1, "instagram", "https://www.instagram.com/tunisian_reaper1/")

		while true do
        Citizen.Wait(1500)
        players = {}
        for i = 0, 128 do
            if NetworkIsPlayerActive( i ) then
                table.insert( players, i )
            end
        end
        SetRichPresence("ID: " ..GetPlayerServerId(PlayerId()).. 
		 " - " .. #players + 6 .. "/128 Players")

	end

	--	SetRichPresence((GetPlayerName(PlayerId())) .. " -") -- [Steam username] [text]
	--	SetRichPresence("".. text[presence] .."")  -- [text]
		SetDiscordRichPresenceAssetText('https://discord.gg/UWQTPbW')
		print('^5Discord rich presence mis a jour :D')
		Citizen.Wait(300000) -- 0 minutes 
	end
end)
