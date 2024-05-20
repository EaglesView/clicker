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

function back.buttonPurchaseAnimationSuccess(purchaseButton,successColor,transitionTime,easingStyle,easingDirection)
    local goal1 = {}
    goal1.Rotation = 5
    goal1.BackgroundColor3 = successColor
    local twInfo = TweenInfo.new(transitionTime,easingStyle,easingDirection)
    local tween = TweenService:Create(purchaseButton,twInfo,goal1)
    tween:Play()
end
function back.buttonPurchaseAnimationFailure(purchaseButton,failureColor,shakeAmt,transitionTime,easingStyle,easingDirection)
    local goal1 = {}
    local goal2 = {}
    goal1.Rotation = 5
    goal2.Rotation = -5
    goal1.BackgroundColor3 = failureColor
    local twInfo = TweenInfo.new(transitionTime,easingStyle,easingDirection)
    local tween = TweenService:Create(purchaseButton,twInfo,goal1)
    local tweenBack = TweenService:Create(purchaseButton,twInfo,goal2)
    local shakeCount = 1
    while shakeCount > shakeAmt do
        tween:Play()
        task.wait()
        tweenBack:Play()
        task.wait()
        shakeCount = shakeCount + 1
    end
end
function back.changeModelColorSize(part,color,transitionTime,size)
    local goal = {}
    goal.Color = color
    goal.Size = size
    local twinfo = TweenInfo.new(transitionTime,Enum.EasingStyle.Linear)
    local tween = TweenService:Create(part,twinfo,goal)
    tween:Play()
end
return back