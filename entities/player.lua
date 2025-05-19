local scene = require 'libraries.scene'

local player = {}

function player.new(x, y, image, scale)
    local node = scene.newLayer(x, y) -- Use a generic node/layer for player
    node.x = x
    node.y = y
    node.speed = 5
    -- Attach a sprite as a child for rendering
    local sprite = scene.newSprite(0, 0)
    sprite.image = image
    sprite.scale = scale or 1
    function sprite:draw()
        love.graphics.draw(self.image, 0, 0, 0, self.scale, self.scale)
    end

    node:insertChild(sprite)
    -- Movement and logic on the player node
    function node:update(dt)
        if love.keyboard.isDown("d") then node.x = node.x + node.speed end
        if love.keyboard.isDown("a") then node.x = node.x - node.speed end
        if love.keyboard.isDown("s") then node.y = node.y + node.speed end
        if love.keyboard.isDown("w") then node.y = node.y - node.speed end
        -- Update transform so children (sprite) move with the node
        if node.transform then
            node.transform:setTransformation(node.x, node.y, node.r or 0, node.sx or 1, node.sy or 1)
        end
    end

    return node
end

return player
