fx_version 'cerulean'
game 'gta5'


client_scripts {
    '@PolyZone/client.lua',
	'config.lua',
	'functions/functions_client.lua',
	'source/fuel_client.lua'
}

server_scripts {
	'config.lua',
	'source/fuel_server.lua'
}

exports {
	'GetFuel',
	'SetFuel'
}


lua54 'yes'
escrow_ignore {
   'html/*',
   'config.lua'	 
}