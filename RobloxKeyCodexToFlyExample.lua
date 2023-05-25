-- Flying Exploit Script
local flyEnabled = false

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.X then
        flyEnabled = not flyEnabled
        if flyEnabled then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            
            local flyPart = Instance.new("Part")
            flyPart.Anchored = true
            flyPart.Size = Vector3.new(10, 1, 10)
            flyPart.Position = character.HumanoidRootPart.Position + Vector3.new(0, 3, 0)
            flyPart.CanCollide = false
            flyPart.Transparency = 1
            flyPart.Parent = character
            
            local flyBodyVelocity = Instance.new("BodyVelocity")
            flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
            flyBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            flyBodyVelocity.Parent = flyPart
            
            local flyGyro = Instance.new("BodyGyro")
            flyGyro.CFrame = character.HumanoidRootPart.CFrame
            flyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            flyGyro.P = 9e4
            flyGyro.Parent = flyPart
            
            humanoid.PlatformStand = true
            
            repeat
                flyBodyVelocity.Velocity = character.HumanoidRootPart.CFrame.LookVector * 50
                flyGyro.CFrame = character.HumanoidRootPart.CFrame
                wait()
            until not flyEnabled
            
            flyPart:Destroy()
            humanoid.PlatformStand = false
        end
    end
end)
