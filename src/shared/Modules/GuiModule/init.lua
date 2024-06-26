local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local plrgui = plr.PlayerGui:WaitForChild("SGUI_Main")
local guiGame = plrgui.SGUI_Game
local Source = game.ReplicatedStorage.Source
local bindMoney = Source.Events:FindFirstChild("bindMoneyGui")
local bindClick = Source.Events:FindFirstChild("bindClick")
local gui = {}
local backEnd = require(script.guiBackbone)
local colors = require(script.colors)
local transitions = require(script.tweenInfo)
local shakeAmt = 3
--fonctions utiles pour les boutons upgrade
function gui.updateButton() -- Mettre a jour les infos du bouton
    
end
function gui.purchaseButtonClicked(button :TextButton,enoughMoney : boolean, clicked : boolean)

    if enoughMoney then
        backEnd.buttonPurchaseAnimationSuccess(button,colors.button_upgrade,transitions.transitions.buttonClick,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
    else
        backEnd.buttonPurchaseAnimationFailure(button,colors.button_upgrade,transitions.transitions.buttonFailure,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
    end
end
    

function gui.createClickGuiFrames(template : table)
    print(template)
    for upID, upgrades in pairs(template.click.upgrades) do
        local newFrame = game.ReplicatedStorage.guiElements.upgradeFrame:Clone()
        local guim = plr.PlayerGui:WaitForChild("SGUI_Main"):WaitForChild("SGUI_Game").gameUpgradeBar
        local description = newFrame.Frame.tx_upgradeDescription
        local title = newFrame.Frame.tx_upgradeName
        local btn = newFrame.purchaseButton
        btn.Text = upgrades.upgradePrice.."$"
        title.TextColor3 = colors.largeColorPalette1.color3
        description.Text = upgrades.description
        title.Text = upgrades.title.." (x"..upgrades.upgradeAmt..")"
        newFrame.LayoutOrder = upgrades.order
        newFrame:SetAttribute("ID",upID)
        newFrame.Parent = guim.ScrollingFrame
        backEnd.button_init(btn,colors.button_upgrade,template.click.upgrades,template.money.amount)
    end
    
end
function gui.clickReaction(waitTime)
    local mainGarden = CollectionService:GetTagged("gardenRoot")
    for _,garden in pairs(mainGarden) do
        print("in function")
        local size = garden.Size
        backEnd.changeModelColorSize(garden,colors.colorPalette1.col3,waitTime,size*1.1)
        task.wait(waitTime)
        backEnd.changeModelColorSize(garden,colors.colorPalette1.col4,0.1,size)
    end
end
function gui.updateMoneyOnScreen(label,newAmt)
    label.Text = newAmt.." $"
end
















return gui