AddEventHandler('onPlayerVote', function (id)

    local _source = source
    local _id    = id
    local point = 5  -- nombre de point a give
    
    -- lk_points = colonne point boutique

        
        MySQL.query('SELECT * FROM users WHERE idboutique=@id', {
            ['@id'] = _id}, 
            
            function(data)

                if json.encode(data) == "[]" then
                    print("NOT A VALID NAME")
                else
                    local poi = data[1].lk_points
                    npoint = poi + point
            
                    MySQL.Async.execute('UPDATE `users` SET `lk_points`=@point  WHERE idboutique=@id', {  
                        ['@id'] = id,
                        ['@point'] = npoint 
                    }, function(rowsChange)
                    end)
                    PerformHttpRequest("YOUR WEBHOOK HERE", function(err, text, headers) end, 'POST', json.encode({username = "GIVE POINT VOTE", content = "[Give ID Vote]\n Give de "..point.." points sur l'id boutique >> "..id}), { ['Content-Type'] = 'application/json' })
                    print('^4Give Point boutique via vote ')
                    print('^4Give Point boutique via vote ' .. id .. ' points '..point)
            end
        end)

end)
