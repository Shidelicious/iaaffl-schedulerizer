MAX_RETRIES = 500000

function contains_team(table, team)
    for _,value in pairs(table) do
        if (value.x == team) then
            return true
        end
        if (value.y == team) then
            return true
        end
    end
    return false
end

function week_picker(div_pool, num_div, nondiv_pool, num_non)
    week_games = {}
                
    mod = 0
    factor = 0

    for game=1,num_games do
        override = 0
        if (game <= num_div) then
            remaining = table.getn(div_pool)

            if ( (game == 1) and (num_div < 6) ) then
                mod = remaining / 3
                factor = mod
            elseif ( num_div == 6 ) then
                mod = remaining
                factor = 0
            end

            done = false
            while not done do
                rand = math.random(mod);
                rand = rand + ( (3 - game) * factor )
                if (contains_team(week_games,div_pool[rand].x) == false) and 
                   (contains_team(week_games,div_pool[rand].y) == false) then
                    done = true
                    temp_game = table.remove(div_pool,rand)
                    table.insert(week_games,temp_game)
                    print("  Game " .. game .. ": " .. temp_game.x .. home .. temp_game.y .. "  ")
                end
                override = override + 1
                if (override >= MAX_RETRIES) then
                    print("ERROR: INVALID ORIENTATION REACHED")
                    print("   Run program again until complete result achieved.")
                    os.exit(0)
                end
            end
        elseif (game <= (num_div + num_non)) then
            remaining = table.getn(nondiv_pool)

            if ( (game == (1 + num_div) ) and (num_non < 6) ) then
                mod = remaining / 3
                factor = mod
            elseif ( num_non == 6 ) then
                mod = remaining
                factor = 0
            end
            
            done = false
            while not done do
                rand = math.random(mod)
                rand = rand + ( (3 - (game-num_div)) * factor )
                if (contains_team(week_games,nondiv_pool[rand].x) == false) and 
                   (contains_team(week_games,nondiv_pool[rand].y) == false) then
                    done = true
                    temp_game = table.remove(nondiv_pool,rand)
                    table.insert(week_games,temp_game)
                    print("  Game " .. game .. ": " .. temp_game.x .. home .. temp_game.y .. "  ")
                end
                override = override + 1
                if (override >= MAX_RETRIES) then
                    print("ERROR: INVALID ORIENTATION REACHED")
                    print("   Run program again until complete result achieved.")
                    os.exit(0)
                end
            end
        else
            print("ERROR: " .. game .. " IS INVALID GAME NUMBER")
        end
    end
end
