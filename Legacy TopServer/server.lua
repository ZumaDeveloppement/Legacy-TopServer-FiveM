AddEventHandler('onPlayerVote', function (id)

    local _source = source
    local _id    = id
    local id = id
    local point = 500
    local newbanking = {}
    local isonline = false
    local kPlayer 

-- si joueur en ligne = argent cash
-- si joueur offline = argent en banque


    local xPlayers = ESX.GetExtendedPlayers() -- Returns all xPlayers
        
        MySQL.query('SELECT * FROM users WHERE idboutique=@id', {
            ['@id'] = _id},
            
            function(data)
                if json.encode(data) == "[]" then
                    print("NOT A VALID NAME")
                else
                    --check si joueur en ligne
                    for _, xPlayer in pairs(xPlayers) do
                        Wait(1)
                        if xPlayer.getIdentifier() == data[1].identifier then
                            isonline = true
                            kPlayer = xPlayer
                        end
                    end
                    Wait(1)
                    if isonline then 
                        kPlayer.addMoney(point)
                        PerformHttpRequest("YOURWEBHOOK HERE", function(err, text, headers) end, 'POST', json.encode({username = "GIVE POINT VOTE", content = "[Give ID Vote]\n Give de "..point.." points sur l'id boutique >> "..id}), { ['Content-Type'] = 'application/json' })
                        print('^4Give Argent via vote ')
                        print('^4Give Argent via vote ' .. _id .. ' points '..point)
                    else
                    local banking = json.decode(data[1].accounts)
                    local argent = banking.bank
                    local nargent = argent + point
                    local formoney = banking.money
                    local forbm = banking.black_money

                   
                    Wait(1)
                    newbanking = {bank = nargent, money = formoney, black_money = forbm}
                    Wait(10)
                    MySQL.Async.execute( 'UPDATE `users` SET `users`.`accounts` = @account WHERE `idboutique` = @id', {
                        ['@id'] = _id,
                        ['@account'] = json.encode(newbanking) 
                    }, function(rowsChange)
                    end)
                    PerformHttpRequest("YOURWEBHOOK HERE", function(err, text, headers) end, 'POST', json.encode({username = "GIVE POINT VOTE", content = "[Give ID Vote]\n Give de "..point.." points sur l'id boutique >> "..id}), { ['Content-Type'] = 'application/json' })
                    print('^4Give Argent via vote ')
                    print('^4Give Argent via vote ' .. _id .. ' points '..point)
                end
            end
        end)

end)
