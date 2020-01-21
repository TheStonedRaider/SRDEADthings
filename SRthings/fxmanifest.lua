fx_version "adamant"
games {"rdr3"}

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/server.lua'
}

client_scripts {
	--'config.lua',
	'client/client.lua'
}