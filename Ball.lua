Ball = Class{}
function Ball:init(x, y, radius)
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.dy =  math.random(2) == 1 and -100 or 100
    self.dx =  math.random(2) == 1 and math.random(-80, -100) or math.random(80, 100)
end

function Ball:update(dt)
    self.x = self.x + self.dx * dt 
    self.y = self.y + self.dy * dt 
end

function Colisao(circle, ball)
    local dist = math.sqrt((circle.y - ball.y)^2 + (circle.x - ball.x)^2)
    return dist <= (15 + 15)
       --circle.radius + ball.radius
end

function Borda()

    if ball.y <= 15  then
		ball.dy = -ball.dy +15
    elseif ball.y >= (WINDOW_HEIGHT-15) then
        ball.dy = -ball.dy -15
	end

	if ball.x <= 15 then
		ball.dx = -ball.dx + 15
    elseif ball.x >= (WINDOW_WIDTH-15) then
        ball.dx = -ball.dx -15
	end
end

function Borda2()
    for i = 1, n do
        if bal[i].y <= 15  then
            bal[i].dy = -bal[i].dy + 15
        elseif  bal[i].y >= (WINDOW_HEIGHT-15) then
            bal[i].dy = -bal[i].dy - 15
        end      

        if bal[i].x <= 15 then
            bal[i].dx = -bal[i].dx +15
        elseif bal[i].x >= (WINDOW_WIDTH-15) then
            bal[i].dx = -bal[i].dx -15
        end
    end
end