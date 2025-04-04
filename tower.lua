local tower = {}
tower.list = {}

function tower.place(x, y, color)
    table.insert(tower.list, {
        x = x,
        y = y,
        color = color or {0.2, 0.4, 0.8},
    })
end

function tower.draw(blockSize)
    for _, t in ipairs(tower.list) do
        love.graphics.setColor(t.color)
        love.graphics.rectangle("fill", t.x, t.y, blockSize - 1, blockSize - 1)
    end
end

return tower
