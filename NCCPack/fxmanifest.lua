-- Define the FX Server version and game type
fx_version "adamant"
game "gta5"

-- Manifest
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

-- Resource Info
name 'KyleLee15 | NCCPack'
description 'FiveM Standalone Chat With Changeable Name & Department'
author 'KyleLee15 (https://github.com/KyleLee15)'
version '1.0.0'
url 'https://github.com/KyleLee15/NCCPack'

-- Script
shared_script 'config.lua'

client_scripts {
	'ncc-c.lua'
}
server_script {
	'ncc-s.lua'
}