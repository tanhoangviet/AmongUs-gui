local TopbarLibrary = {}
TopbarLibrary.__index = TopbarLibrary

function TopbarLibrary:CreateToggle(options)
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    local topbarStandard = playerGui:WaitForChild("TopbarStandard")
    local holders = topbarStandard:WaitForChild("Holders")
    local leftHolder = holders:WaitForChild("Left")

    local existingToggle = leftHolder:FindFirstChild("Toggle")
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
    Toggle.Text = "+"
    Toggle.TextSize = 25
    Toggle.BackgroundTransparency = 0.4
    Toggle.TextColor3 = Color3.new(1, 1, 1)
    Toggle.Font = Enum.Font.Code
    Toggle.Parent = leftHolder

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 9)
    UICorner.Parent = Toggle

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
