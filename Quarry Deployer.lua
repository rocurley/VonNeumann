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

--]]
function reploy()
    stackUp()
    turtle.back()
    turtle.back()
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
        turtle.forward()
        turtle.forward()
    end
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
    turtle.select(9)
    for i=1,23 do
        turtle.dig()
        turtle.forward()
    end
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
    turtle.select(10)
    for i=1,12 do
        turtle.dig()
        turtle.forward()
        turtle.forward()
    end
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
    engineRowUp()
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
    solarRowUp()
    turtle.turnRight()
    for i=1,4 do
        turtle.forward()
    end
    turtle.turnRight()
    for i=1,9 do
        turtle.forward()
    end
end
function engineRowUp()
    for i=1,6,1 do
        turtle.select(11)
        turtle.dig()
        turtle.forward()
        turtle.select(12)
        turtle.dig()
        turtle.forward()
        turtle.select(13)
        turtle.digDown()
        turtle.select(11)
        turtle.dig()
        turtle.forward()
        turtle.forward()
    end
end
function solarRowUp()
    for i=1,3,1 do
        turtle.select(14)
        turtle.dig()
        turtle.forward()
        turtle.dig()
        turtle.forward()
        turtle.dig()
        turtle.select(5)
        turtle.digUp()
        turtle.forward()
        turtle.dig()
        turtle.select(14)
        for j=1,3,1 do
            turtle.forward()
            turtle.dig()
        end
        turtle.select(5)
        turtle.digUp()
        turtle.forward()
        turtle.forward()
    end
end
function stackUp()
    turtle.select(1)
    turtle.dig()
    turtle.up()
    turtle.select(5)
    turtle.dig()
    turtle.forward()
    turtle.dig()
    turtle.down()
    turtle.select(6)
    turtle.dig()
    turtle.down()
    turtle.turnRight()
    turtle.select(3)
    turtle.place()
    turtle.turnLeft()
    turtle.suck()
    turtle.turnRight()
    turtle.drop()
    turtle.dig()
    turtle.turnLeft()
    turtle.select(7)
    turtle.dig()
    turtle.down()
    turtle.select(8)
    turtle.dig()
    turtle.down()
    turtle.select(4)
    turtle.dig()
end
function deploy()
    turtle.select(10)
    turtle.turnLeft()
    turtle.turnLeft()
    --Placing the left wooden pipes
    for i=1,12,1 do
        turtle.back()
        turtle.back()
        turtle.place()
    end
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
    turtle.back()
    turtle.select(4)
    --Placing the Quarry and ME stack
    turtle.place() --WARNING: QUARRIES WILL ALWAYS FACE NORTH
    for k,v in pairs({8,7,6,5}) do
        turtle.up()
        turtle.select(v)
        turtle.place()
    end
    turtle.down()
    turtle.down()
    --Pulling the HDD from hammerspace
    turtle.turnRight()
    turtle.select(2)
    turtle.place()
    turtle.suck()
    turtle.turnLeft()
    turtle.drop()
    turtle.turnRight()
    turtle.dig()
    turtle.turnLeft()
    turtle.down()
    turtle.down()
    turtle.select(9)
    --placing the quartz pipes
    for i=1,23,1 do
        turtle.back()
        turtle.place()
    end
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
    turtle.select(10)
    --placing the right wooden pipes
    for i=1,12,1 do
        turtle.back()
        turtle.back()
        turtle.place()
    end
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
    engineRowDown()
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
    solarRowDown()
    turtle.down()
    turtle.turnRight()
    for i=1,5,1 do
        turtle.forward()
    end
    turtle.up()
    turtle.turnRight()
    engineRowDown()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
    solarRowDown()
    turtle.turnLeft()
    turtle.forward()
    for i=1,4,1 do
        turtle.up()
    end
    turtle.select(5)
    turtle.place()
    turtle.down()
    turtle.select(1)
    turtle.place()
end
function solarRowDown()
    for i=1,3,1 do
        turtle.back()
        turtle.back()
        turtle.select(5)
        turtle.placeUp()
        turtle.select(14)
        for j=1,3,1 do
            turtle.place()
            turtle.back()
        end
        turtle.select(5)
        turtle.place()
        turtle.select(14)
        turtle.back()
        turtle.place()
        turtle.select(5)
        turtle.placeUp()
        turtle.select(14)
        turtle.back()
        turtle.place()
        turtle.back()
        turtle.place()
    end
end
function engineRowDown()
    for i=1,6,1 do
        turtle.back()
        turtle.back()
        turtle.select(11)
        turtle.place()
        turtle.select(13)
        turtle.placeDown()
        turtle.back()
        turtle.select(12)
        turtle.place()
        turtle.back()
        turtle.select(11)
        turtle.place()
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
function clearArea()
    clear(18)
    turtle.turnLeft()
    clear(1)
    turtle.turnLeft()
    clear(17)
    turtle.turnRight()
    clear(1)
    turtle.turnRight()
    clear(17)
    turtle.turnLeft()
    clear(1)
    turtle.turnLeft()
    clear(17)
    turtle.turnRight()
    clear(1)
    turtle.turnRight()
    clear(17)
    turtle.turnLeft()
    clear(1)
    turtle.turnLeft()
    clear(17)
    turtle.turnRight()
    clear(1)
    turtle.turnRight()
    clear(17)
end
function upI()
    while not turtle.up() do
        if turtle.detectUp() then
            turtle.digUp()
        else
            turtle.attackUp()
        end
    end
end
function downI()
    while not turtle.down() do
        if turtle.detectDown() then
            turtle.digDown()
        else
            turtle.attackDown()
        end
    end
end
function forwardI()
    while not turtle.forward() do
        if turtle.detect() then
            turtle.dig()
        else
            turtle.attack()
        end
    end
end
function backI()
    if not turtle.back() then
        turtle.turnRight()
        turtle.turnRight()
        forwardI()
        turtle.turnRight()
        turtle.turnRight()
    end
end
    



