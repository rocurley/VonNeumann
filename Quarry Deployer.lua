--[[
The turtle has 16 inventory slots.
They should be used as follows:

01: Recharge Station
02: Blank HDD  (blue)
03: Full  HDD  (yellow)
04: Quarry
05: LV Solar (20)
06: ME Controller
07: ME Drive
08: ME Interface
09: Quartz Conductive Pipe (23)
10: Wood Conductive Pipe   (24)
11: Electric Engine (24)
12: Redstone Torch (12)
13: Cobblestone (12)
14: Copper Cable (insulation optional) (36)
15:
16: Kept clear for inventory purification

--]]
function go()
    while true do
        runOnce()
    end
end
function runOnce()
    deploy()
    qu=peripheral.wrap("front")
    while (qu.isActive()=="true") do
        os.sleep(1)
    end
    reploy()
end
function reploy()
    stackUp()
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
    forwardI(4)
    turtle.turnRight()
    forwardI(10)--1 more then the quarry length because it looks cool
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
        forwardI(2)
    end
end
function stackUp()
    --The problem is that all inventory slots (pretty much) are empty at this
    --point. Need to dump into the ME Interface before picking up ANYTHING.
    upI()
    for k,v in pairs({1,4,5,6,7,8,9,10,11,12,13,14,14,15,16}) do
        turtle.select(v)
        while turtle.getItemCount(v)>0 do
            turtle.drop()
            os.sleep(.1)
            turtle.suck()
        end
    end
    upI(3)
    turtle.select(5)
    turtle.dig()
    downI()
    turtle.select(6)
    turtle.dig()
    downI()
    --Drop the extra quarry items back into the ME system 
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
    turtle.turnRight()
    turtle.turnRight()
    turtle.select(1)
    turtle.dig()
    forwardI()
    turtle.select(5)
    turtle.dig()
    forwardI()
    turtle.turnLeft()
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
    turtle.turnLeft()
    turtle.turnLeft()
    placeI(5)
    backI()
    placeI(1)
    turtle.turnLeft()
    turtle.turnLeft()
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
function load(id,meta,num,slot)
    sort=peripheral.wrap("back")
    while turtle.getItemCount(slot)<num do
        sort.extract(3,getUUID(id,meta),2,num-turtle.getItemCount(slot))
        os.sleep(.1)
    end
end
function loadUp()
    load( 2671,   0, 1, 1)
    load(  252,2723, 1, 2)
    load(  252,2724, 1, 3)
    load( 1503,   0, 1, 4)
    load(  650,   0,20, 5)
    load(  900,   2, 1, 6)
    load(  900,   3, 1, 7)
    load(  900,   8, 1, 8)
    load(19464,   0,23, 9)
    load(19456,   0,24,10)
    load( 1404,   0,24,11)
    load(   76,   0,12,12)
    load(    4,   0,12,13)
    load(30184,   1,36,14)
    load(  263,   0, 5,15)
    turtle.select(15)
    turtle.refuel()
end
function getID(uuid)
  if uuid > 32768 then
    id = uuid % bit.blshift(1,15) -- this line, originally done wrong by Nevercast, was corrected by JateZero
    meta = bit.blogic_rshift(uuid-id,15) -- this line was corrected by JateZero
  else
    id = uuid
    meta = 0
  end
  -- return id, meta
end
function getUUID(id, meta)
   uuid = id + meta * 32768
   return uuid
 end
 --[[
 Seturp Turtle:
 01:Charge Station
 02:LV Solar
 03:Disk Drive
 04:Disk
 05:Supply Chest (Green)
 06:Interactive Sorter
 
 ]]--
function makeMiner()
    turtle.turnRight()
    placeI(1)
    upI()
    placeI(2)
    turtle.turnLeft()
    placeI(3)
    turtle.select(4)
    turtle.drop()
    downI()
    forwardI()
    turtle.turnRight()
    forwardI()
    placeI(5)
    backI()
    placeI(6)
    turtle.turnRight()
    turtle.turnRight()
    load(1228,0,1,1)
    turtle.turnRight()
    backI()
    placeI(1)
    while turtle.detect() do
        os.sleep(1)
    end
    forwardI(10)
end
    
    
    


