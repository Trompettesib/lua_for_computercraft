local bloc = {}
local item = {}
local bool = false
bool, bloc = turtle.inspect()

function selectItem (name)
    local i = 1
    turtle.select(i)
    item = turtle.getItemDetail()
    while (item.name ~= "wheat-seed" and item.name ~= "beetroot-seed" and item.name ~= "potato" and item.name ~= "carrot") do
        i = i + 1
        turtle.select(i)
        item = turtle.getItemDetail()
    end
end

function harvest ()
    turtle.digDown()
    turtle.placeDown()
end