local CollectionService = game:GetService("CollectionService")
local UserInputService = game:GetService("UserInputService")
local logic = require(game.ReplicatedStorage.Source.Modules.LogicModule)

local players = game.Players
local player = players.LocalPlayer
local garden = CollectionService:GetTagged("gardenClick")
local template = require(player.PlayerScripts.Player:WaitForChild("template"))
local bindClick = game.ReplicatedStorage.Source.Events:FindFirstChild("bindClick")
local returnClickRate = game.ReplicatedStorage.Source.Events:FindFirstChild("returnClickRate")


for _,v in pairs(garden) do
    v.MaxActivationDistance = 500
    v.MouseClick:Connect(function()
        print("Clicked")
        v.MaxActivationDistance = 0.1
        bindClick:Fire()
        task.wait(logic.returnClickRate())
        v.MaxActivationDistance = 500
    end)
end--