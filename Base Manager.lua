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
if inventory[getUUID(4,0)]>=1009 then
    print("Compressing " .. 9*math.floor(inventory[getUUID(4,0)]-1000/9) " cobblestone.")
    ae.craft(getUUID(2506,0),math.floor(inventory[getUUID(4,0)]-1000/9))
end
for i=0, 6 do
    toCompress=math.floor(inventory[getUUID(2506,i)]/9)
    if toCompress>0 then
        print("Compressing " .. 9*toCompress .." ".. (i+1) .."x compressed cobblestone.")
        ae.craft(getUUID(2506,i+1),toCompress)
    end
end

