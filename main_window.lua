local pipe = require("pipe")
local selectedCard = nil

function love.load()
    love.window.setTitle("Main Window - Grid")
    love.window.setMode(600, 400)
end

function love.update(dt)
    local card = pipe.read()
    if card then
        selectedCard = card
    end
end

function love.mousepressed(x, y, button)
    if selectedCard and button == 1 then
        print("Placed " .. selectedCard .. " at (" .. x .. "," .. y .. ")")
        selectedCard = nil
    end
end

function love.draw()
    love.graphics.print("Click to place selected card.", 20, 20)
    if selectedCard then
        love.graphics.print("Selected: " .. selectedCard, 20, 40)
    else
        love.graphics.print("No card selected.", 20, 40)
    end
end
