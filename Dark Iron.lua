while true do
    if turtle.getItemCount(1)>0 then
        turtle.select(1)
        turtle.place()
        turtle.select(2)
        os.sleep(0.5)
        turtle.dig()
        turtle.dropDown()
    end
end