local back = {}
local TweenService = game:GetService("TweenService")

local function checkForClass(Items,Class)
    if Items:IsA(Class) then
        return true
    else
        return false
    end
end
local function recursiveCheck(GuiItem,Class,Table)
    for _, items in pairs(GuiItem:GetChildren()) do
        if checkForClass(items,Class) then
            table.insert(Table,items)
        elseif items:GetChildren() ~= nil then
            recursiveCheck(items,Class,Table)
        end
    end
    return Table
end
function back.changeBackgroundColor(guiItem,newColor, transitionTime,easingStyle)
    local goal = {}
    goal.BackgroundColor3 = newColor
    local twInfo = TweenInfo.new(transitionTime,easingStyle)
    local tween = TweenService:Create(guiItem,twInfo,goal)
    tween:Play()
end

function back.changeTextColor(guiItem,newColor,transitionTime,easingStyle)
    local temp = {}
    temp = recursiveCheck(guiItem,"TextLabel",temp)
    print(temp)
    for _,textlabel in pairs(temp) do
        local goal = {}
        goal.TextColor3 = newColor
        local twInfo = TweenInfo.new(transitionTime,easingStyle)
        local tween = TweenService:Create(textlabel,twInfo,goal)
        tween:Play()
    end
end

function back.button_setColor(item : Instance,colorScheme : table)
    item.BackgroundColor3 = colorScheme.bg
    item.TextColor3 = colorScheme.tx
end

function back.button_init(button : Instance,colPaletteButton : table, priceOf : number, money : number)
    local par = button.Parent
    local ID = par:GetAttribute("ID")
    if money >= priceOf[ID].upgradePrice then
        back.button_setColor(button,colPaletteButton.inactive_canAfford)
    else
        back.button_setColor(button,colPaletteButton.inactive_canNotAfford)
    end
end

function back.button_initAllColor(buttons : table,colPaletteButton : table, money : number, upgradePrices : table)
    for _,btns in pairs(buttons) do
        back.button_init(btns,colPaletteButton,upgradePrices,money)
    end
end
function back.buttonPurchaseAnimationSuccess(purchaseButton,colorT : table,transitionTime : number,easingStyle,easingDirection)
    local goal1 = {}
    goal1.BackgroundColor3 = colorT.activated.bg
    goal1.TextColor3 = colorT.activated.tx
    local twInfo = TweenInfo.new(transitionTime,easingStyle,easingDirection,0,true)
    local tween = TweenService:Create(purchaseButton,twInfo,goal1)
    tween:Play()
    task.wait(transitionTime)
    --[[
        TEMPORARY. WILL NEED TO UPDATE TO THE NEW PRICE TO BE PROPERLY ADJUSTED
    ]]
    back.button_setColor(purchaseButton,colorT.inactive_canAfford)
end
function back.buttonPurchaseAnimationFailure(purchaseButton,colorT : table,transitionTime : number,easingStyle,easingDirection)
    local goal1 = {}
    goal1.BackgroundColor3 = colorT.failure.bg
    goal1.TextColor3 = colorT.failure.tx
    local twInfo = TweenInfo.new(transitionTime,easingStyle,easingDirection,0,true)
    local tween = TweenService:Create(purchaseButton,twInfo,goal1)
    tween:Play()
    task.wait(transitionTime)
    back.button_setColor(purchaseButton,colorT.inactive_canNotAfford)
end
function back.changeModelColorSize(part,color,transitionTime : number,size)
    local goal = {}
    goal.Color = color
    goal.Size = size
    local twinfo = TweenInfo.new(transitionTime,Enum.EasingStyle.Linear)
    local tween = TweenService:Create(part,twinfo,goal)
    tween:Play()
end
return back