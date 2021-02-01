function move_front ()
    turtle.dig()
    while (not turtle.forward()) do
        turtle.dig()
    end
    turtle.digDown()
    turtle.digUp()
end

function unload_inventory ()
    turtle.turnRight()
    turtle.turnRight()
    while (turtle.forward()) do
    end
    for i = 2, 16 do
        turtle.select(i)
        turtle.drop(64)
    end
    turtle.select(1)
    turtle.turnRight()
    turtle.turnRight()
    while (turtle.forward()) do
    end
end

function mining (distance)
    for i = 1, distance do
        move_front()
        if i%10 == 0 then
            turtle.placeDown()
        end
    end
    turtle.turnRight()
    move_front()
    turtle.turnRight()
    for j = 1, distance do
        move_front()
    end
end

function init_mining ()
    move_front()
    turtle.turnRight()
    move_front()
    turtle.turnLeft()
    move_front()
    turtle.turnLeft()
    move_front()
    turtle.turnRight()
    move_front()
    turtle.turnRight()
    move_front()
    turtle.turnRight()
    turtle.turnRight()
    move_front()
    turtle.turnRight()
end

if turtle.getFuelLevel() < 132 then
    print("Not enought fuel")
else
    init_mining()
    turtle.placeDown()
    turtle.turnLeft()
    mining(30)
    move_front()
    mining(30)
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
    unload_inventory()
end