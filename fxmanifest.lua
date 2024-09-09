fx_version 'cerulean'

game 'gta5'

author 'Lusty94'

name "lusty94_butcher"

description 'Butcher Job Script For QB Core'

version '2.0.1'

lua54 'yes'

client_script {
    'client/butcher_client.lua',
    'shared/targets.lua',
    'shared/menus.lua',
}


server_scripts { 
    'server/butcher_server.lua',
}


shared_scripts { 
	'shared/config.lua',
    '@ox_lib/init.lua'
}

escrow_ignore {
    'client/**.lua',
    'server/**.lua',
    'shared/**.lua',
}