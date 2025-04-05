local pipe = require("pipe")

local cards = {"fire", "freeze", "cannon"}
local cardRects = {}

function love.load()
    love.window.setTitle("Card Picker")
    love.window.setMode(200, 300)

    for i, card in ipairs(cards) do
        table.insert(cardRects, {x = 20, y = 50 * i, w = 160, h = 40, name = card})
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        for _, rect in ipairs(cardRects) do
            if x > rect.x and x < rect.x + rect.w and y > rect.y and y < rect.y + rect.h then
                pipe.write(rect.name)
            end
        end
    end
end

function love.draw()
    love.graphics.print("Select a card:", 20, 20)
    for _, rect in ipairs(cardRects) do
        love.graphics.rectangle("line", rect.x, rect.y, rect.w, rect.h)
        love.graphics.print(rect.name, rect.x + 10, rect.y + 10)
    end
end
