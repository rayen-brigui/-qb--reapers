fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'config.lua',
}

client_scripts {
	'client/main.lua',
	'client/garage.lua',
	'client/menus.lua'
}

server_script {
	'server/*.lua',
	'@oxmysql/lib/MySQL.lua'
}
