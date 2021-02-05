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
    for i = 2, 16 do
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

function init_mining ()
    for i = 0, 4 do
        move_front_3x3()
    end
    half_turn()
    turtle.forward()
    turtle.placeDown()
    turtle.turnRight()
    turtle.forward()
end

if turtle.getFuelLevel() < 132 then
    print("Not enought fuel")
else
    while (turtle.forward()) do
    end
    init_mining()
    mining(30)
    for i = 1, 3 do
        turtle.forward()
    end
    mining(30)
    turtle.forward()
    turtle.turnLeft()
    unload_inventory()
end