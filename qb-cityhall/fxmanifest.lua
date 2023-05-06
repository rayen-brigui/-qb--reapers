fx_version 'cerulean'
game 'gta5'

description 'QB-CityHall'
version '1.0.0'

ui_page 'html/index.html'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_script 'client/main.lua'

files {
    'html/*.js',
    'html/*.html',
    'html/*.css',
    'html/images/*.png'
}

lua54 'yes'