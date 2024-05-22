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

local clicked = false
for _,btn in pairs(CollectionService:GetTagged("guiButtons")) do
    btn.Activated:Connect(function()
        if not clicked then
            clicked = true
            local par = btn.Parent
            local ID = par:GetAttribute("ID")
            local typeOf = par:GetAttribute("TypeOfUpgrade")
            local priceOf = logic.returnUpgradePrice(ID,typeOf)
            if logic.enoughMoney(priceOf) then
                GuiModule.purchaseButtonClicked(btn,true)
                --spend money here
            else
                GuiModule.purchaseButtonClicked(btn,false)
                --not enough money
            end
            task.wait(0.126) --temporary
            clicked = false
        end
        

    end)
end



bindEarly.Event:Connect(function(waitTime)
    print("in event")
    GuiModule.clickReaction(waitTime)
end)

bindMoney.Event:Connect(function(amount)
    GuiModule.updateMoneyOnScreen(moneyLabel,amount)
end)


