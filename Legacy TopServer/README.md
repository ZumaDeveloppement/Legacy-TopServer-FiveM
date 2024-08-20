# LegacyPluginTopServer

Veuillez utilise oxmysql afin de pouvoir faire les query mysql sinon, changer le MySQL.query en MySQL.Async.fetchAll

ajouter dans vote fxmanifest ces 2 lignes 

server_script '@oxmysql/lib/MySQL.lua'
shared_script '@es_extended/imports.lua'


Les joueurs devront voter avec leurs ID boutique, sur top server il n'est pas possible de voter avec un pseudo de moins de 4 caracteres il me semble, donc pour l'idboutique, présent commence à 10000


N'utilisez pas le server.lua et versionpoitnboutique.lua ensemble :) 



