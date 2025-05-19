local scene = require 'libraries.scene'
local playerModule = require 'entities.player'
local sti = require 'libraries.sti'

local game = {}

local rootLayer, player, gameMap

function game.load()
    rootLayer = scene.newLayer()
    gameMap = sti('maps/testMap.lua')
    local playerImage = love.graphics.newImage('sprites/cowboy1.png')
    local scale = gameMap.tilewidth / playerImage:getWidth()
    player = playerModule.new(400, 200, playerImage, scale)
    rootLayer:insertChild(player)
end

function game.update(dt)
    player:update(dt)
end

function game.draw()
    if gameMap then
        gameMap:drawLayer(gameMap.layers["Ground"])
        gameMap:drawLayer(gameMap.layers["Trees"])
    end
    rootLayer:draw()
end

return game
