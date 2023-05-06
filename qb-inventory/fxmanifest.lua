fx_version 'cerulean'

game 'gta5'

description 'QBinvenotry NoPixel reskin by </dojwun>#2103'

shared_scripts {
	'config.lua',
	'@qb-weapons/config.lua' 
}

server_script {
 'server/main.lua',
 '@oxmysql/lib/MySQL.lua'
}

client_scripts {
	'client/*.lua'
} 

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/main.css',
	'html/js/app.js',
	'html/images/*.png',
	'html/images/*.jpg',
	'html/extra_images/*.png',
	'html/ammo_images/*.png',
	'html/attachment_images/*.png',
	'html/*.ttf',
	'html/*.png',
	'html/cloth/*.png',
	'html/cloth/*.svg',
}

dependency 'qb-weapons' 
