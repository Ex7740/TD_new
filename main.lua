function love.load()
    if not arg or not arg[2] then
        os.execute("start love . main")
        os.execute("start love . cards")
        love.event.quit()
    else
        if arg[2] == "main" then
            require("main_window")
        elseif arg[2] == "cards" then
            require("card_window")
        end
    end
end
