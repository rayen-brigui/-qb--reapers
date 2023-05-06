-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686

CreateThread(function()
    while true do
        -- This is the Application ID (Replace this with you own)
        SetDiscordAppId(1087461798032187432)
        --SetDiscordAppId(1087461798032187432)

        -- Here you will have to put the image name for the "large" icon.
	SetDiscordRichPresenceAsset('logo_reper')
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Join the party!')
       
        -- Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('logo_reper')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('Hurry up an press join')

        QBCore.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
            SetRichPresence('Players: '..result..'/128')
        end)

        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "TEST!!", "")
        SetDiscordRichPresenceAction(1, "SOON", "")

        -- It updates every minute just in case.
	Wait(60000)
    end
end)