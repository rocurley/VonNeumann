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

ae=peripheral.wrap("bottom")
inventory=ae.listItems()
while true do
    jobsCount=0
    if inventory[getUUID(4,0)]~=nil and inventory[getUUID(4,0)]>=1009 then
        toCompress=math.floor((inventory[getUUID(4,0)]-1000)/9)
        print("Compressing " .. 9*toCompress .. " cobblestone.")
        ae.craft(getUUID(2506,0),toCompress)
        jobsCount+=toCompress
    end
    for i=0, 6 do
        if inventory[getUUID(2506,i)]~=nil then 
            toCompress=math.floor(inventory[getUUID(2506,i)]/9)
            if toCompress>0 then
                print("Compressing " .. 9*toCompress .." ".. (i+1) .."x compressed cobblestone.")
                ae.craft(getUUID(2506,i+1),toCompress)
                jobsCount+=toCompress
            end
        end
    end
    print("Executing ".. jobsCount .. "jobs")
    os.sleep(jobsCount/20)
end

