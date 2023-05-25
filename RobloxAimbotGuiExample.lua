-- Aimbot Script
local target = nil
local lockOn = false

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Q then
        lockOn = not lockOn
        if lockOn then
            target = game.Workspace.Target
        else
            target = nil
        end
    end
end)

local function aimAtTarget()
    local player = game.Players.LocalPlayer
    local character = player.Character

    if character and character:FindFirstChild("HumanoidRootPart") and target and target:IsDescendantOf(game.Workspace) then
        local rootPart = character.HumanoidRootPart
        local direction = (target.Position - rootPart.Position).Unit

        rootPart.CFrame = CFrame.lookAt(rootPart.Position, rootPart.Position + direction)
    end
end

while true do
    if lockOn then
        aimAtTarget()
    end
    wait()
end

-- ESP Script
local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui

local function createESP(player)
    local espBox = Instance.new("BoxHandleAdornment")
    espBox.Name = "ESPBox"
    espBox.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
    espBox.Size = player.Character:FindFirstChild("HumanoidRootPart").Size + Vector3.new(0, 0.5, 0)
    espBox.Color3 = Color3.new(1, 0, 0) -- Red color
    espBox.Transparency = 0.5
    espBox.ZIndex = 0
    espBox.AlwaysOnTop = true
    espBox.Parent = playerGui
end

game.Players.PlayerAdded:Connect(function(newPlayer)
    createESP(newPlayer)
end)

for _, existingPlayer in ipairs(game.Players:GetPlayers()) do
    createESP(existingPlayer)
end
