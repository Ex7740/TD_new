local window = {}

window.blockSize = 50
window.columns = 10
window.rows = 10

function window.init()
    -- Nothing for now
end

function window.drawGrid()
    local mouseX, mouseY = love.mouse.getPosition()
    local hoverCol = math.floor(mouseX / window.blockSize)
    local hoverRow = math.floor(mouseY / window.blockSize)

    for row = 0, window.rows - 1 do
        for col = 0, window.columns - 1 do
            local x = col * window.blockSize
            local y = row * window.blockSize

            if col == hoverCol and row == hoverRow then
                love.graphics.setColor(0.6, 0.6, 0.6)
            else
                love.graphics.setColor(0.8, 0.8, 0.8)
            end

            love.graphics.rectangle("fill", x, y, window.blockSize - 1, window.blockSize - 1)
        end
    end
end

return window
