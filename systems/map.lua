local sti = require 'libraries.sti'
local map = {}

function map.load()
    map.data = sti('maps/testMap.lua')
    map.tilewidth = map.data.tilewidth
    map.tileheight = map.data.tileheight
end

function map.draw()
    map.data:drawLayer(map.data.layers["Ground"])
    map.data:drawLayer(map.data.layers["Trees"])
end

return map
