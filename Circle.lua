Circle = Class{}

function Create(dt)
mouse.x, mouse.y = love.mouse.getPosition()

    if circle.x < mouse.x then
        circle.x = circle.x + (circle.speed * 2.5 * dt)
    end
    if circle.x > mouse.x then
        circle.x = circle.x - (circle.speed * 2.5 * dt)
    end
    if circle.y < mouse.y then
        circle.y = circle.y + (circle.speed * 2.5 * dt)
    end
    if circle.y > mouse.y then
        circle.y = circle.y - (circle.speed * 2.5 * dt)
    end

    function love.draw() 
    love.graphics.setColor(255, 0, 0)
    love.graphics.circle("fill", circle.x, circle.y, 15)
    end
end