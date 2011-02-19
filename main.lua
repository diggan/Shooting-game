function love.load()
    local f = love.graphics.newFont(love._vera_ttf, 14)
    love.graphics.setBackgroundColor(4, 99, 128)
        bullethole = love.graphics.newImage("images/bullethole.png")
    sight = love.graphics.newImage("images/sight.png")
    love.graphics.setFont(f)
    love.mouse.setVisible(false)
    latesty = 0
    latestx = 0
    --love.graphics.setMode( 0, 0, true, true, 0 )
    shot = love.audio.newSource("audio/barret50.wav", "static")
    empty = love.audio.newSource("audio/empty.wav", "static")
    lastshot = 10
    ammo = 5
    score = 0;
end

function love.draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.circle("fill", 300, 300, 100, 32)
	love.graphics.setColor(255, 255, 255)
	love.graphics.circle("fill", 300, 300, 75, 32)
	love.graphics.setColor(255, 0, 0)
	love.graphics.circle("fill", 300, 300, 50, 32)
	love.graphics.setColor(255, 255, 255)
	love.graphics.circle("fill", 300, 300, 25, 32)
	love.graphics.setColor(255, 0, 0)
	love.graphics.circle("fill", 300, 300, 5, 32)
	love.graphics.setColor(255, 255, 255, 255)
	x = love.mouse.getX() - 125
	y = love.mouse.getY() - 125
	love.graphics.print("The mouse is at (" .. x .. "," .. y .. ")", 50, 50)
	love.graphics.print("Ammo: " .. ammo, 50, 75)
	love.graphics.print("Score: " .. score, 50, 125)
	love.graphics.draw(bullethole, -500, -500)
	love.graphics.draw(sight, x, y)
	love.graphics.print("The latest shoot was at (" .. latestx .. "," .. latesty .. ")", 50, 100)
	if love.mouse.isDown("l") then
		if ammo >= 1 then	
			if lastshot > 0.5 then
				latesty = love.mouse.getY() - 32
				latestx = love.mouse.getX() - 32
				bulletholeActive = "1"
				lastshot = 0
				shot:rewind()
				shot:play();
				love.audio.resume()
				love.audio.play(shot)
				ammo = ammo - 1
			end
		end
	end
	if love.keyboard.isDown("r") then
		ammo = 5
	end
	if bulletholeActive == "1" then
		love.graphics.draw(bullethole, latestx, latesty)
	end
end

function love.update(dt)
	lastshot = lastshot + dt;
end
