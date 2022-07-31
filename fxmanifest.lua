fx_version "cerulean"
game "gta5"

description 'Baspel'
version '1.0.0'

lua54 'yes'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

dependencies {
    'es_extended',
    'ox_lib',
    'xsound'
}