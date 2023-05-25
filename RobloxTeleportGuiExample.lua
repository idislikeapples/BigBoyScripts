-- Teleportation GUI Script
local players = game.Players:GetPlayers()

local gui = Instance.new("ScreenGui")
gui.Name = "TeleportationGUI"
gui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 20)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundTransparency = 0.5
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = gui

local function createButton(player)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 180, 0, 20)
    button.Position = UDim2.new(0, 10, 0, 10 + (20 * (#frame:GetChildren() - 1)))
    button.BackgroundTransparency = 0.8
    button.BackgroundColor3 = Color3.new(1, 1, 1)
    button.TextColor3 = Color3.new(0, 0, 0)
    button.TextSize = 14
    button.Text = player.Name
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
    end)
end

for _, player in ipairs(players) do
    createButton(player)
end
