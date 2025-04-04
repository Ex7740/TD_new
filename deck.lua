local deck = {}

deck.cards = {
    { name = "Basic Tower", color = {0.2, 0.4, 0.8}, cost = 0 },
    { name = "Sniper Tower", color = {0.5, 0.1, 0.7}, cost = 0 },
}

deck.selectedCard = nil
deck.cardWidth = 80
deck.cardHeight = 100
deck.spacing = 10

function deck.draw()
    local screenWidth = love.graphics.getWidth()
    local y = love.graphics.getHeight() - deck.cardHeight - 10

    for i, card in ipairs(deck.cards) do
        local x = (i - 1) * (deck.cardWidth + deck.spacing) + 10

        -- Highlight selected card
        if deck.selectedCard == i then
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("line", x - 2, y - 2, deck.cardWidth + 4, deck.cardHeight + 4)
        end

        love.graphics.setColor(card.color)
        love.graphics.rectangle("fill", x, y, deck.cardWidth, deck.cardHeight)

        love.graphics.setColor(1, 1, 1)
        love.graphics.print(card.name, x + 5, y + 5)
    end
end

function deck.mousepressed(x, y)
    local yStart = love.graphics.getHeight() - deck.cardHeight - 10
    if y >= yStart then
        for i, _ in ipairs(deck.cards) do
            local xStart = (i - 1) * (deck.cardWidth + deck.spacing) + 10
            if x >= xStart and x <= xStart + deck.cardWidth then
                deck.selectedCard = i
                return true
            end
        end
    end
    return false
end

function deck.getSelectedCard()
    return deck.cards[deck.selectedCard]
end

return deck
