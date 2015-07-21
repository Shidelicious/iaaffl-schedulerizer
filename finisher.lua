require "framework"
require "utils"
require "math"

math.randomseed(os.time())

schedule_file = arg[1]

fd = assert(io.open(schedule_file, "r"))

contents = fd:read("*all")

order = 1

for divs=1,3 do
    rand_div = math.random( 4-divs )
    for teams=1,4 do
        rand_team = math.random( 5-teams )
        position = rand_team + 4*(rand_div-1)
        contents = string.gsub(contents, div_interface[order].x, div_names[position].name)
        table.remove(div_names,position)
        order = order + 1
    end
end

print(contents)

fd:close()

os.exit(1)
