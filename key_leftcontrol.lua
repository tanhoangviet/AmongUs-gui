local GuiService = game:GetService("GuiService")

-- Create the GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeyboardGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Button = Instance.new("TextButton")
Button.Name = "LeftControlButton"
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 50, 0, 50)
Button.Position = UDim2.new(0.5, -25, 0.5, -25)
Button.Text = "Left Ctrl"
Button.TextSize = 18
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.BorderSizePixel = 0

-- Handle Left Control key press event
local function HandleLeftControlKeyPress(input)
    if input.KeyCode == Enum.KeyCode.LeftControl then
        -- Do something when Left Control is pressed
        print("Left Control pressed!")
    end
end

-- Connect the input event
GuiService.InputBegan:Connect(HandleLeftControlKeyPress)
