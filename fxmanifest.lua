fx_version 'adamant'
games { 'rdr3' }
version '0.0.1'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

server_scripts {
    'config.lua',
    'server/_helpers.lua',
    'server/players.lua',
    'server/bountyhunter.lua',
    'server/delivery.lua',
    'server/doctor.lua',
    'server/fisher.lua',
    'server/hunter.lua',
    'server/lawman.lua',
    'server/moonshiner.lua'    
}

client_scripts {
    'config.lua',
    'client/_helpers.lua',
    'client/localplayer.lua',
    'client/bountyhunter.lua',
    'client/delivery.lua',
    'client/doctor.lua',
    'client/fisher.lua',
    'client/hunter.lua',
    'client/lawman.lua',
    'client/moonshiner.lua'
}

ui_page 'client/ui/ui.html'
files {
    -- 3rd party
    'client/ui/js/3rdParty/radialprogress.js',

    -- redemrp_gameplay
    'client/ui/ui.html',

    -- css
    'client/ui/css/ui.css',

    -- javascript
    'client/ui/js/config.js',
    'client/ui/js/core.js',
    'client/ui/js/dialogs.js',
    'client/ui/js/bountyhunter.js',
    'client/ui/js/delivery.js',
    'client/ui/js/doctor.js',
    'client/ui/js/fisher.js',
    'client/ui/js/hunter.js',
    'client/ui/js/lawman.js',
    'client/ui/js/moonshiner.js',

    -- images
    'client/ui/images/wanted.jpg',
    'client/ui/images/woodpanels.jpg',
}
