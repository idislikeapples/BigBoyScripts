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
        local direction = (target.Position - rootPart.Position).unit

        rootPart.CFrame = CFrame.lookAt(rootPart.Position, rootPart.Position + direction)
    end
end

while true do
    if lockOn then
        aimAtTarget()
    end
    wait()
end
