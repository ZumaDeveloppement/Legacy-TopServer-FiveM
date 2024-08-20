fx_version 'cerulean'
game 'common'


author "'Kotonier#6301"
url 'https://github.com/Top-Serveurs/cfx-vote-plugin'

server_script 'vote.js'
server_script 'server.lua'


shared_script '@es_extended/imports.lua'
server_script '@oxmysql/lib/MySQL.lua'
-- si vous n'utilisez pas oxmysql commentez la ligne au dessus et décommenter en dessous
--server_script '@async/async.lua'
--server_script '@mysql-async/lib/MySQL.lua'
