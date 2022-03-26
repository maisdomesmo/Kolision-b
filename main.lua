circle = {}
mouse = {}
ball = {}
bal = {n}
n = {}
edge = {}
Class = require 'class'
require 'Ball'
WINDOW_HEIGHT = 600
WINDOW_WIDTH = 800
gameState = 'start'

function love.load()
	Score = 0
	HighScore = 0
	ball = Ball(500, 500, 15)
	circle.x = 300
	circle.y = 300
	circle.speed = 300
	n=0
end

function love.keypressed(key)
	if key == 'enter' or key == 'return'  then
		gameState = 'play'
		local state = not love.mouse.isVisible() 
		love.mouse.setVisible(state)
	elseif key == 'escape'  then
		love.event.quit()
	end

end

function love.update(dt)

	mouse.x, mouse.y = love.mouse.getPosition()
	circle.x = mouse.x
	circle.y = mouse.y

	if Lose() == true then	
		gameState = 'start'
		n = 0 
		Score = 0
	end

	Borda()
	Borda2()

	if (ball.x >= WINDOW_WIDTH-15) or (ball.x <= 15) or (ball.y >= WINDOW_HEIGHT-15) or (ball.y <= 15) then
		n = n+1 
		Ball: newball() 
	end
	
	ball:update(dt)
	
	if n>0 then
		for i = 1, n do
			bal[i]:update(dt)
		end
	end	

	Score = Score + (1 * n) * dt
	if Score > HighScore then
		HighScore = Score
	end
end

function Lose()
    if Colisao(circle,ball) == true then
        return true
    end
	for i = 1, n do
		if (math.sqrt((circle.y - bal[i].y)^2 + (circle.x - bal[i].x)^2)) <= 30 then
		return true
		end
	end
end

function Ball:newball()
	bal[n] = Ball( ball.x, ball.y, 15)
end

if gameState == 'start' then
	function love.draw()
		love.graphics.setColor(255, 255, 255)
		love.graphics.printf("BEM VINDO AO KOLISION!", 300, 200, 200, 'center')
		love.graphics.printf("PRESSIONE ENTER PARA COMEÇAR!", 300, 300, 200, 'center')
		love.graphics.printf("PRESSIONE ESC PARA SAIR", 300, 400, 200, 'center')
		if gameState == 'play' then
			love.graphics.clear(40/255, 45/255, 52/255, 255/255)
			love.graphics.setColor(255, 255, 255)
			love.graphics.circle('fill', ball.x, ball.y, 15)
			love.graphics.setColor(255, 255, 255)
			love.graphics.print(math.floor(Score) , 30, 35, 0)
			if HighScore > 0 then
				love.graphics.print("Seu recorde é de: " .. math.floor(HighScore), 650, 35, 0)
			end
			love.graphics.setColor(255, 0, 0)
    		love.graphics.circle("fill", circle.x, circle.y, 15)
			if n>0 then
				for i = 1, n do
				love.graphics.setColor(255, 255, 255)
				love.graphics.circle('fill', bal[i].x, bal[i].y, 15)
				end
			end
		end	
	end
end



