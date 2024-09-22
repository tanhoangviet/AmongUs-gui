local TopbarLibrary = {}
TopbarLibrary.__index = TopbarLibrary

function TopbarLibrary:CreateToggle(options)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
        local TopbarStandard = game.CoreGui:WaitForChild("TopBarApp"):WaitForChild("TopBarFrame"):WaitForChild("LeftFrame")
        local Left = TopbarStandard:WaitForChild("LeftFrame")
    

    local existingToggle = Left:FindFirstChild("Toggle")
    if existingToggle then
        existingToggle:Destroy()
    end
    
    local Toggle = Instance.new("TextButton")
    Toggle.Name = "Toggle"
    Toggle.Size = UDim2.new(0, 33, 0, 32)
    Toggle.Position = UDim2.new(0.5, 97, 0.5, -239)
    Toggle.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    Toggle.BorderColor3 = Color3.new(0, 0, 0)
    Toggle.BorderSizePixel = 1
    Toggle.BackgroundTransparency = 0.4
    Toggle.TextSize = 25
    Toggle.TextColor3 = Color3.new(1, 1, 1)
    Toggle.Font = Enum.Font.Code
    Toggle.Parent = Left

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 9)
    UICorner.Parent = Toggle

    if options.ImageId then
        local ToggleImage = Instance.new("ImageLabel")
        ToggleImage.Size = UDim2.new(0, 25, 0, 25)
        ToggleImage.Position = UDim2.new(0.5, -12, 0.5, -12)
        ToggleImage.BackgroundTransparency = 1
        ToggleImage.Image = "rbxassetid://" .. tostring(options.ImageId)
        ToggleImage.Parent = Toggle
        Toggle.Text = ""
    elseif options.Name then
        Toggle.Text = tostring(options.Name)
    else
        Toggle.Text = "Default"
    end

    local isToggled = false
    local originalTransparency = 0.4

    Toggle.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        if isToggled then
            Toggle.BackgroundTransparency = 0.2
        else
            Toggle.BackgroundTransparency = originalTransparency
        end
        if options.Callback then
            options.Callback(isToggled)
        end
    end)
end

return TopbarLibrary
