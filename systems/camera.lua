local camera = require 'libraries.camera'
local cam = {}

function cam.load(player, map)
    cam.instance = camera()
    cam.player = player
    cam.map = map
end

function cam.update()
    local w, h = love.graphics.getWidth(), love.graphics.getHeight()
    cam.instance:lookAt(cam.player.x, cam.player.y)
    -- Clamp camera to map bounds
    local mapW = cam.map.data.width * cam.map.data.tilewidth
    local mapH = cam.map.data.height * cam.map.data.tileheight
    if cam.instance.x < w / 2 then cam.instance.x = w / 2 end
    if cam.instance.y < h / 2 then cam.instance.y = h / 2 end
    if cam.instance.x > (mapW - w / 2) then cam.instance.x = (mapW - w / 2) end
    if cam.instance.y > (mapH - h / 2) then cam.instance.y = (mapH - h / 2) end
end

function cam.attach()
    cam.instance:attach()
end

function cam.detach()
    cam.instance:detach()
end

return cam
