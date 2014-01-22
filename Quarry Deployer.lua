--[[
The turtle has 16 inventory slots.
They should be used as follows:

01: Recharge Station
02: Blank HDD  (blue)
03: Full  HDD  (yellow)
04: Quarry
05: LV Solar (17)
06: ME Controller
07: ME Drive
08: ME Interface
09: Quartz Conductive Pipe (16)
10: Wood Conductive Pipe   (16)
11: Electric Engine (16)
12: Redstone Torch (8)
13: Cobblestone (8)
14: Copper Cable (insulation optional)
15:
16: Kept clear for inventory purification

--]]
function reploy()
    stackUp()
    backI(2)
    turtle.turnRight()
    solarRowUp()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
    engineRowUp()
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
    turtle.select(10)
    for i=1,12 do
        turtle.dig()
        forwardI(2)
    end
    turtle.turnLeft()
    forwardI()
    turtle.turnLeft()
    turtle.select(9)
    for i=1,23 do
        turtle.dig()
        forwardI()
    end
    forwardI()
    turtle.turnRight()
    forwardI()
    turtle.turnRight()
    turtle.select(10)
    for i=1,12 do
        turtle.dig()
        forwardI(2)
    end
    turtle.turnLeft()
    forwardI()
    turtle.turnLeft()
    engineRowUp()
    turtle.turnRight()
    forwardI()
    turtle.turnRight()
    solarRowUp()
    turtle.turnRight()
    for i=1,4 do
        forwardI()
    end
    turtle.turnRight()
    for i=1,9 do
        forwardI()
    end
end
function engineRowUp()
    for i=1,6,1 do
        turtle.select(11)
        turtle.dig()
        forwardI()
        turtle.select(12)
        turtle.dig()
        forwardI()
        turtle.select(13)
        turtle.digDown()
        turtle.select(11)
        turtle.dig()
        forwardI(2)
    end
end
function solarRowUp()
    for i=1,3,1 do
        turtle.select(14)
        turtle.dig()
        forwardI()
        turtle.dig()
        forwardI()
        turtle.dig()
        turtle.select(5)
        turtle.digUp()
        forwardI()
        turtle.dig()
        turtle.select(14)
        for j=1,3,1 do
            forwardI()
            turtle.dig()
        end
        turtle.select(5)
        turtle.digUp()
        forwardI()
    end
end
function stackUp()
    turtle.select(1)
    turtle.dig()
    upI()
    turtle.select(5)
    turtle.dig()
    forwardI()
    turtle.dig()
    downI()
    turtle.select(6)
    turtle.dig()
    downI()
    turtle.turnRight()
    placeI(3)
    turtle.turnLeft()
    turtle.suck()
    turtle.turnRight()
    turtle.drop()
    turtle.dig()
    turtle.turnLeft()
    turtle.select(7)
    turtle.dig()
    downI()
    turtle.select(8)
    turtle.dig()
    downI()
    turtle.select(4)
    turtle.dig()
end
function deploy()
    turtle.turnLeft()
    turtle.turnLeft()
    --Placing the left wooden pipes
    for i=1,12,1 do
        backI(2)
        placeI(10)
    end
    turtle.turnLeft()
    forwardI()
    turtle.turnLeft()
    backI()
    --Placing the Quarry and ME stack
    placeI(4) --WARNING: QUARRIES WILL ALWAYS FACE NORTH
    for k,v in pairs({8,7,6,5}) do
        upI()
        placeI(v)
    end
    downI(2)
    --Pulling the HDD from hammerspace
    turtle.turnRight()
    placeI(2)
    turtle.suck()
    turtle.turnLeft()
    turtle.drop()
    turtle.turnRight()
    turtle.dig()
    turtle.turnLeft()
    downI(2)
    --placing the quartz pipes
    for i=1,23,1 do
        backI()
        placeI(9)
    end
    turtle.turnRight()
    forwardI()
    turtle.turnRight()
    --placing the right wooden pipes
    for i=1,12,1 do
        backI(2)
        placeI(10)
    end
    turtle.turnLeft()
    forwardI()
    turtle.turnLeft()
    engineRowDown()
    turtle.turnRight()
    forwardI()
    turtle.turnRight()
    solarRowDown()
    downI()
    turtle.turnRight()
    for i=1,5,1 do
        forwardI()
    end
    upI()
    turtle.turnRight()
    engineRowDown()
    turtle.turnLeft()
    forwardI()
    turtle.turnLeft()
    solarRowDown()
    turtle.turnLeft()
    forwardI()
    upI(4)
    placeI(5)
    downI()
    placeI(1)
end
function solarRowDown()
    for i=1,3,1 do
        backI(2)
        placeUpI(5)
        for j=1,3,1 do
            placeI(14)
            backI()
        end
        placeI(5)
        backI()
        placeI(14)
        placeUpI(5)
        backI()
        placeI(14)
        backI()
        placeI(14)
    end
end
function engineRowDown()
    for i=1,6,1 do
        backI(2)
        placeI(11)
        placeDownI(13)
        backI()
        placeI(12)
        backI()
        placeI(11)
    end
end
function clear(n)
    for i=1,n,1 do
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.digDown()
    end
end
function placeUpI(slot)
    turtle.select(slot)
    while not turtle.placeUp() do
        clearUp()
        turtle.select(slot)
    end
end
function placeDownI(slot)
    turtle.select(slot)
    while not turtle.placeDown() do
        clearDown()
        turtle.select(slot)
    end
end
function placeI(slot)
    turtle.select(slot)
    while not turtle.place() do
        clearFront()
        turtle.select(slot)
    end
end
function upI(n)
    n = (n or 1)
    for i=1,n do
        while not turtle.up() do
            clearUp()
        end
    end
end
function clearUp()
    turtle.select(16)
    turtle.drop()
    if turtle.detectUp() then
        turtle.digUp()
    else
        turtle.attackUp()
    end
    turtle.drop()
end
function downI(n)
    n = (n or 1)
    for i=1,n do
        while not turtle.down() do
            clearDown()
        end
    end
end
function clearDown()
    turtle.select(16)
    turtle.drop()
    if turtle.detectDown() then
        turtle.digDown()
    else
        turtle.attackDown()
    end
    turtle.drop()
end
function forwardI(n)
    n = (n or 1)
    for i=1,n do
        while not turtle.forward() do
            clearFront()
        end
    end
end
function clearFront()
    turtle.select(16)
    turtle.drop()
    if turtle.detect() then
        turtle.dig()
    else
        turtle.attack()
    end
    turtle.drop()
end
function backI(n)
    n = (n or 1)
    for i=1,n do
        if not turtle.back() then
            turtle.turnRight()
            turtle.turnRight()
            forwardI()
            turtle.turnRight()
            turtle.turnRight()
        end
    end
end
    



