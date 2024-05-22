--[[
    Fichier de Logique du Jeu
    Effectue tout les calculs requis pour le IDLE
]]
local logic = {}
local template = script.template:Clone()
template.Parent = game.Players.LocalPlayer.PlayerScripts.Player
local Template = require(template)
local bindClick = game.ReplicatedStorage.Source.Events:FindFirstChild("bindClick")
local bindEarly = game.ReplicatedStorage.Source.Events:FindFirstChild("bindEarlyClick")

--Variables
local bindMoney = game.ReplicatedStorage.Source.Events:WaitForChild("bindMoneyGui")
logic.cash = 10 -- will follow along
function logic.clickAmt()
    local ans = (Template.money.mainmultiplier * (Template.account.prestigeLVL * (math.pow((Template.click.clickpower + Template.click.upgrades.u1.Value),(Template.click.upgrades.u4.Value+1))*(1 + Template.click.upgrades.u5.Value)*Template.click.upgrades.u3.Value+1))*(1+Template.account.beeBonus))
    print(ans.."is the answer of clickAmt")
    return ans
end
function logic.returnUpgradePrice(ID,typeOf)  --Returns back the Proper Upgrade from the Template
    return Template[typeOf].upgrades[ID].upgradePrice
end
function logic.newUpgradePrice()
    
end
function logic.buyUpgrade(typeOf,ID)
    --price has already been checked
    Template.money.amount = Template.money.amount - Template[typeOf].upgrades[ID].upgradePrice
    Template[typeOf].upgrades[ID].upgradePrice = 
end
function logic.round(amt)
    if amt%1 == 0 then
        amt = amt..".00"
    else
        amt = amt.."0"
    end
    return amt
end
function logic.addMoney(amount)
    logic.cash = logic.cash + amount
    print("newAmt is "..logic.cash)
    return logic.cash
end
local function click()
    bindEarly:Fire(Template.click.clickrate)
    local moneyPlus = logic.clickAmt()
    task.wait(Template.click.clickrate)
    local newMoney = logic.addMoney(moneyPlus)
    bindMoney:Fire(newMoney)
end
function logic.enoughMoney(amt)
    if logic.cash >= amt then
        return true
    else
        return false
    end
end
function logic.clickUpgrade()
    
end
function logic.returnClickRate()
    return Template.click.clickrate
end
function logic.returnTemplate()
    return Template
end

bindClick.Event:Connect(function()
    click()
end)

return logic