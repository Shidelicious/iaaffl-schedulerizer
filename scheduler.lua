require "framework"
require "utils"
require "math"

home = " at "

math.randomseed(os.time())

num_weeks = 11
num_games = 6

size = table.getn(div1_games)
print(size)

-- first 11 weeks, mix in div games
for week=1,num_weeks do
    --  1    2    3    4    5    6    7    8    9    10   11
    -- 4/2       2/4  4/2       2/4       4/2       2/4
    -- MIX, NON, MIX, MIX, NON, MIX, NON, MIX, NON, MIX, NON
    if (week == 1 or week == 3 or week == 4 or week == 6 or week == 8 or week == 10) then
        print("====> Week " .. week)
        -- div mix week
        if (week == 1 or week == 4 or week == 8) then
            week_picker( div2_games, 3, non_games, 3 )
        else
            week_picker( div2_games, 3, non_games, 3 )
        end
    else
        -- skip for now
    end
end

for week=1,num_weeks do
    if (week == 2 or week == 5 or week == 7 or week == 9 or week == 11) then
        print("====> Week " .. week)
        -- full slate of non-div games
        week_picker( nil, 0, non_games, 6 )
        num_non = num_non + 1
    else
        -- already did them earlier
    end
end

-- now the last 3 weeks, all div games
for week=12,14 do
    print("====> Week " .. week)

    week_picker( div1_games, 6, nil, 0 )
end

print("FINAL FINISHED")
os.exit(1)
