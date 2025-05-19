function love.load()
    camera = require 'libraries/camera'
    cam = camera()

    love.graphics.setDefaultFilter("nearest", "nearest")

    sti = require 'libraries/sti'
    gameMap = sti('maps/testMap.lua')

    player = {}
    player.x = 400
    player.y = 200
    player.speed = 5
    background = love.graphics.newImage('sprites/background.png')
end

function love.update(dt)
    local isMoving = false

    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed
        isMoving = true
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed
        isMoving = true
    end

    if love.keyboard.isDown("s") then
        player.y = player.y + player.speed
        isMoving = true
    end

    if love.keyboard.isDown("w") then
        player.y = player.y - player.speed
        isMoving = true
    end
    -- Update camera position
    cam:lookAt(player.x, player.y)

    -- This section prevents the camera from viewing outside the background
    -- First, get width/height of the game window
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    -- Left border
    if cam.x < w / 2 then
        cam.x = w / 2
    end

    -- Right border
    if cam.y < h / 2 then
        cam.y = h / 2
    end

    -- Get width/height of background
    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight

    -- Right border
    if cam.x > (mapW - w / 2) then
        cam.x = (mapW - w / 2)
    end
    -- Bottom border
    if cam.y > (mapH - h / 2) then
        cam.y = (mapH - h / 2)
    end
end

function love.draw()
    cam:attach()
    gameMap:drawLayer(gameMap.layers["Ground"])
    gameMap:drawLayer(gameMap.layers["Trees"])
    local carImage = love.graphics.newImage('sprites/cowboy1.png')
    local carScale = gameMap.tilewidth / carImage:getWidth()
    love.graphics.draw(carImage, player.x, player.y, 0, carScale, carScale)
    cam:detach()
end
