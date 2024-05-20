local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game.ReplicatedStorage
local GuiModule = require(ReplicatedStorage.Source:WaitForChild("Modules").GuiModule)
--local template = ReplicatedStorage.Source.Modules.LogicModule.template:Clone()
--template.Parent = game.Players.LocalPlayer.PlayerScripts.Player
--local Template = require(template)
local Source = ReplicatedStorage.Source

local logic = require(Source.Modules.LogicModule)

GuiModule.createClickGuiFrames(logic.returnTemplate())
local bindMoney = Source.Events:FindFirstChild("bindMoneyGui")
local bindEarly = Source.Events:FindFirstChild("bindEarlyClick")

local player = game.Players.LocalPlayer
local gui = player.PlayerGui.SGUI_Main.SGUI_Game
local moneyLabel = gui.moneyFrame.moneyLabel


for buttonID,btn in pairs(CollectionService:GetTagged("guiButtons")) do
    btn.Activated:Connect(function()
        local par = btn.Parent
        local ID = par:GetAttribute("ID")
        local typeOf = par:GetAttribute("TypeOfUpgrade")
        
    end)
end




bindEarly.Event:Connect(function(waitTime)
    print("in event")
    GuiModule.clickReaction(waitTime)
end)

bindMoney.Event:Connect(function(amount)
    GuiModule.updateMoneyOnScreen(moneyLabel,amount)
end)


