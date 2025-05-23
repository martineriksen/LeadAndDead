local player = require 'entities.player'
local map = require 'systems.map'
local cam = require 'systems.camera'

local game = {}

function game.load()
    map.load()
    player.load(map)
    cam.load(player, map)
end

function game.update(dt)
    player.update(dt)
    cam.update()
end

function game.draw()
    cam.attach()
    map.draw()
    player.draw()
    cam.detach()
end

return game
