for _, file in ipairs(fs.list("cc-shuffler/api")) do
os.loadAPI("cc-shuffler/api/" .. file)
end

-- TODO Restart an FSM if it was left running before