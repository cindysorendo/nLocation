fx_version 'adamant'
game 'gta5'

author 'Nasko'
description 'nLocation'
version '2.0.0'

client_scripts{
    "lib/RMenu.lua",
    "lib/menu/RageUI.lua",
    "lib/menu/Menu.lua",
    "lib/menu/MenuController.lua",
    "lib/components/*.lua",
    "lib/menu/elements/*.lua",
    "lib/menu/items/*.lua",
    "lib/menu/panels/*.lua",
    "lib/menu/windows/*.lua",

    "shared.lua",
    "cl_location.lua"
}

server_scripts{
    "sv_location.lua"
}