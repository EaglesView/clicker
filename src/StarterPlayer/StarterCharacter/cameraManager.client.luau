local Players = game:GetService("Players")

local RunService = game:GetService("RunService")


--local player = Players.LocalPlayer
local player = workspace.targetItem --temp

local camera = workspace.CurrentCamera


local CAMERA_DEPTH = 128

local HEIGHT_OFFSET = 2
local CAM_OFFSET_TAB = 144

camera.FieldOfView = 10

local function updateCamera()
    local playerPosition = player.Position + Vector3.new(0, HEIGHT_OFFSET, 0)
    local cameraPosition = playerPosition + Vector3.new(CAMERA_DEPTH, CAMERA_DEPTH, CAMERA_DEPTH )
    camera.CFrame = CFrame.lookAt(cameraPosition, playerPosition)

end


RunService:BindToRenderStep("IsometricCamera", Enum.RenderPriority.Camera.Value + 1, updateCamera)