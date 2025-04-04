local window = require("window")
local tower = require("tower")
local deck = require("deck")

function love.load()
    window.init()
end

function love.draw()
    window.drawGrid()
    tower.draw(window.blockSize)
    deck.draw()
end

function love.mousepressed(x, y, button)
    if button == 1 then
        -- Clicked a card?
        if deck.mousepressed(x, y) then return end

        -- Otherwise, try to place a tower
        local selected = deck.getSelectedCard()
        if not selected then return end

        local col = math.floor(x / window.blockSize)
        local row = math.floor(y / window.blockSize)
        local gx = col * window.blockSize
        local gy = row * window.blockSize

        -- Avoid placing on same spot
        for _, t in ipairs(tower.list) do
            if t.x == gx and t.y == gy then return end
        end

        tower.place(gx, gy, selected.color)
    end
end
