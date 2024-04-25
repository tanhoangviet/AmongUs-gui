-- Define the ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Define the Toggle button
local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundTransparency = 1
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0, 90, 0, 38)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = ""
Toggle.Draggable = true

-- Add a UICorner to the Toggle button
local Corner = Instance.new("UICorner")
Corner.Name = "Corner"
Corner.Parent = Toggle

-- Function to handle the Toggle button click event
Toggle.MouseButton1Click:Connect(function()
    -- Toggle the visibility of the GUI
    ScreenGui.Enabled = not ScreenGui.Enabled
end)

-- Connect the LeftControl key press event
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftControl then
        -- Toggle the visibility of the GUI
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)
