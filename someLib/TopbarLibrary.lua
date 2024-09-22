local T = {}
T.__index = T

function T:CT(options)
    local P = game:GetService("Players")
    local L = P.LocalPlayer
    local G = L:WaitForChild("PlayerGui")
    local T1 = G:FindFirstChild("TopbarStandard")
    if not T1 then
        local C = game:GetService("CoreGui")
        local A = C:WaitForChild("TopBarApp")
        local F = A:WaitForChild("TopBarFrame")
        T1 = F:WaitForChild("LeftFrame")
    end
    local H = T1:WaitForChild("Holders")
    local L1 = H:WaitForChild("Left")

    local existingToggle = L1:FindFirstChild("Toggle")
    if existingToggle then existingToggle:Destroy() end

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
    Toggle.Parent = L1

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 9)
    UICorner.Parent = Toggle

    if options.ImageId then
        local Image = Instance.new("ImageLabel")
        Image.Size = UDim2.new(0, 25, 0, 25)
        Image.Position = UDim2.new(0.5, -12, 0.5, -12)
        Image.BackgroundTransparency = 1
        Image.Image = "rbxassetid://" .. tostring(options.ImageId)
        Image.Parent = Toggle
        Toggle.Text = ""
    elseif options.Name then
        Toggle.Text = tostring(options.Name)
    else
        Toggle.Text = "Default"
    end

    local Toggled = false
    local originalTransparency = 0.4

    Toggle.MouseButton1Click:Connect(function()
        Toggled = not Toggled
        Toggle.BackgroundTransparency = Toggled and 0.2 or originalTransparency
        if options.Callback then options.Callback(Toggled) end
    end)
end

return T
