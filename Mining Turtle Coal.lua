--[[
The turtle has 16 inventory slots.
They should be used as follows:

01: Coal
02: Minerals Chest (white)
03: Fuel Chest     (orange)
04: Miner
05: Generator
06: Cobble
07: Mining Pipe
08: Mining Pipe
09: Drill
10: Scanner
11: 

--]]
function clear(n)
    for i=1,n,1 do
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.digDown()
    end
end
function deploy ()
    -- Drops the mining equipment
    -- First, we need to dig out the
    -- area for the mining equipment
    clear(1)
    turtle.turnLeft()
    clear(1)
    turtle.turnRight()
    clear(2)
    turtle.turnRight()
    clear(2)
    turtle.turnRight()
    clear(2)
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
    clear(1)
    turtle.back()
    --Now we deploy the miner
    --and put its parts in it
    turtle.select(4)
    turtle.place()
    turtle.select(9)
    turtle.drop()
    turtle.up()
    turtle.forward()
    turtle.select(7)
    turtle.dropDown()
    turtle.forward()
    turtle.down()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.select(10)
    turtle.drop()
    --Now we place other blocks
    turtle.down()
    turtle.select(5)
    turtle.placeUp()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.placeUp()
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
    turtle.select(2)
    turtle.placeUp()
    turtle.turnLeft()
    turtle.forward()
    turtle.select(3)
    turtle.placeUp()
    turtle.back()
    turtle.back()
    turtle.turnLeft()
    turtle.forward()
    turtle.select(5)
    turtle.placeUp()
    turtle.turnRight()
end
function fuelGenerators(n)
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
    turtle.select(1)
    turtle.dropUp()
    while(turtle.getItemCount(1)<3*n)
    do
        turtle.suckUp()
    end
    turtle.dropUp(
        turtle.getItemCount(1)-3*n)
    turtle.turnLeft()
    turtle.forward()
    turtle.dropUp(n)
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.dropUp(n)
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.dropUp(n)
    turtle.turnLeft()
end
--[[
The turtle has 16 inventory slots.
They should be used as follows:

01: Coal
02: Minerals Chest (white)
03: Fuel Chest     (orange)
04: Miner
05: Generator
06: Cobble
07: Mining Pipe
08: Mining Pipe
09: Drill
10: Scanner
11: 

--]]