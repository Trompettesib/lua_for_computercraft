local args = {...}
local home_pos = {gps.locate()}
local main_line_pos = {gps.locate()}
local instant_pos = {gps.locate()}

function move_front ()
    turtle.dig()
    while (not turtle.forward()) do
        turtle.dig()
    end
    turtle.digDown()
    turtle.digUp()
end

function half_turn ()
    turtle.turnRight()
    turtle.turnRight()
end

function move_front_3x3 ()
    move_front()
    turtle.turnLeft()
    move_front()
    half_turn()
    turtle.forward()
    move_front()
    half_turn()
    turtle.forward()
    turtle.turnRight()
end

function unload_inventory ()
    while (turtle.forward()) do
    end
    for i = 1, 16 do
        turtle.select(i)
        turtle.drop(64)
    end
    turtle.select(1)
    half_turn()
end

function mining (distance)
    for i = 1, distance do
        move_front_3x3()
        if i%10 == 0 then
            turtle.placeDown()
        end
    end
    half_turn()
    for j = 1, distance do
        turtle.forward()
    end
    return (true);
end

function search_line ()
    i = tonumber(args[1])
    j = 0
    while (j ~= i) do
        turtle.forward()
        if (turtle.detectDown()) then
            j = j + 1
        end
    end
    main_line_pos = {gps.locate()}
end

function refill ()
    turtle.turnLeft()
    turtle.suck(64)
    turtle.refuel()
    turtle.turnLeft()
    turtle.drop(64)
    turtle.turnLeft()
    turtle.suck(64)
    turtle.turnLeft()
end

refill()
search_line()
turtle.turnLeft()
while (turtle.forward()) do
end
mining(30)
instant_pos = {gps.locate()}
while ((instant_pos[1] ~= main_line_pos[1]) or (instant_pos[3] ~= main_line_pos[3])) do
    print("x = ", instant_pos[1], " == ", main_line_pos[1])
    print("z = ", instant_pos[3], " == ", main_line_pos[3])
    turtle.forward()
    instant_pos = {gps.locate()}
end
while (turtle.forward()) do
end
mining(30)
instant_pos = {gps.locate()}
while ((instant_pos[1] ~= main_line_pos[1]) or (instant_pos[3] ~= main_line_pos[3])) do
    --print("x = ", instant_pos[1], " == ", main_line_pos[1])
    --print("z = ", instant_pos[3], " == ", main_line_pos[3])
    turtle.forward()
    instant_pos = {gps.locate()}
end
turtle.turnLeft()
unload_inventory()