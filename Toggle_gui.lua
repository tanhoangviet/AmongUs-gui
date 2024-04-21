local guiEnabled = false

-- Create the toggle GUI circle
local toggleGui = Instance.new("ScreenGui")
toggleGui.Name = "ToggleGui"
toggleGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local circle = Instance.new("ImageButton") -- Change to ImageButton for touch support
circle.Name = "Circle"
circle.Size = UDim2.new(0, 50, 0, 50)
circle.Position = UDim2.new(0.5, 0, 0.5, 0)
circle.AnchorPoint = Vector2.new(0.5, 0.5)
circle.BackgroundTransparency = 1
circle.Image = "rbxassetid://17187525990" -- Change to your desired circle image
circle.Parent = toggleGui

-- Enable active and draggable properties
circle.Active = true
circle.Draggable = true

-- Function to toggle the GUI visibility
local function toggleGuiVisibility()
    guiEnabled = not guiEnabled
    toggleGui.Enabled = guiEnabled
end

-- Function to toggle the GUI visibility with the left control key
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftControl then
        toggleGuiVisibility()
    end
end)
