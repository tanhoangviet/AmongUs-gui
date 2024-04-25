-- Define the ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Define the Toggle button
local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0, 90, 0, 38)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = "Tutorial"
Toggle.TextColor3 = Color3.fromRGB(248, 248, 248)
Toggle.TextSize = 28.000
Toggle.Draggable = true

-- Add a UICorner to the Toggle button
local Corner = Instance.new("UICorner")
Corner.Name = "Corner"
Corner.Parent = Toggle

-- Function to handle LeftControl key press event
local function HandleLeftControlKeyPress(input)
    if input.KeyCode == Enum.KeyCode.LeftControl then
        -- Toggle the visibility of the GUI
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end

-- Connect LeftControl key press event
game:GetService("UserInputService").InputBegan:Connect(HandleLeftControlKeyPress)

-- Function to handle the Toggle button click event
Toggle.MouseButton1Click:Connect(function()
    -- Toggle the visibility of the GUI
    ScreenGui.Enabled = not ScreenGui.Enabled
end)
