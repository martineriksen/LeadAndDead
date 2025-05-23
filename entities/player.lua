local player = {}

function player.load(map)
    player.x = 400
    player.y = 200
    player.speed = 5
    player.image = love.graphics.newImage('sprites/cowboy1.png')
    player.scale = map.tilewidth / player.image:getWidth()
end

function player.update(dt)
    if love.keyboard.isDown("d") then player.x = player.x + player.speed end
    if love.keyboard.isDown("a") then player.x = player.x - player.speed end
    if love.keyboard.isDown("s") then player.y = player.y + player.speed end
    if love.keyboard.isDown("w") then player.y = player.y - player.speed end
end

function player.draw()
    love.graphics.draw(player.image, player.x, player.y, 0, player.scale, player.scale)
end

return player
