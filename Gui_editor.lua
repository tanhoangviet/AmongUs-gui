-- Dịch vụ cần thiết
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Tạo Topbar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 50)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
topBar.Parent = screenGui

-- Tạo TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 300, 0, 30)
textBox.Position = UDim2.new(0.5, -150, 0.1, 0)
textBox.PlaceholderText = "Tọa độ và kích thước Frame"
textBox.TextEditable = false
textBox.Parent = screenGui

-- Tạo nút X
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0.1, 0)
closeButton.Text = "X"
closeButton.Parent = topBar

-- Tạo Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 200)
frame.Position = UDim2.new(0.5, -100, 0.5, -100)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 5)
uiCorner.Parent = frame

-- Tạo các nút nhỏ gọn
local function createButton(text, position, parent, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 30, 0, 30)
    button.Position = position
    button.Text = text
    button.Parent = parent
    button.MouseButton1Click:Connect(callback)
    return button
end

local buttons = {
    {text = "+", position = UDim2.new(0, 5, 0, 10), callback = function() frame.Size = frame.Size + UDim2.new(0, 10, 0, 10) end},
    {text = "-", position = UDim2.new(0, 40, 0, 10), callback = function() frame.Size = frame.Size - UDim2.new(0, 10, 0, 10) end},
    {text = "<->", position = UDim2.new(0, 75, 0, 10), callback = function() frame.Size = frame.Size + UDim2.new(0, 10, 0, 0) end},
    {text = "-><-", position = UDim2.new(0, 110, 0, 10), callback = function() frame.Size = frame.Size - UDim2.new(0, 10, 0, 0) end},
    {text = "<^>", position = UDim2.new(0, 145, 0, 10), callback = function() frame.Size = frame.Size + UDim2.new(0, 0, 0, 10) end},
    {text = "v^", position = UDim2.new(0, 180, 0, 10), callback = function() frame.Size = frame.Size - UDim2.new(0, 0, 0, 10) end},
    {text = "Copy", position = UDim2.new(0, 215, 0, 10), callback = function()
        local info = string.format("Position: (%d, %d) | Size: (%d, %d) | Corner: %d", frame.Position.X.Offset, frame.Position.Y.Offset, frame.Size.X.Offset, frame.Size.Y.Offset, uiCorner.CornerRadius.Offset)
        print(info)
        if setclipboard then
            setclipboard(info)
        end
    end}
}

for _, btn in pairs(buttons) do
    createButton(btn.text, btn.position, topBar, btn.callback)
end

-- Hàm cập nhật tọa độ và kích thước
local function updateTextBox()
    textBox.Text = string.format("Position: (%d, %d) | Size: (%d, %d) | Corner: %d", frame.Position.X.Offset, frame.Position.Y.Offset, frame.Size.X.Offset, frame.Size.Y.Offset, uiCorner.CornerRadius.Offset)
end

-- Kết nối sự kiện cập nhật khi vị trí hoặc kích thước của Frame thay đổi
frame:GetPropertyChangedSignal("Position"):Connect(updateTextBox)
frame:GetPropertyChangedSignal("Size"):Connect(updateTextBox)
updateTextBox()

-- Kết nối sự kiện bấm nút X để đóng GUI
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Tạo thuộc tính draggable cho Frame
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    updateTextBox()
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Tạo nút tăng giảm độ Corner của frame
local increaseCornerButton = createButton("Corner +", UDim2.new(0, 250, 0, 10), topBar, function()
    uiCorner.CornerRadius = UDim.new(0, uiCorner.CornerRadius.Offset + 5)
    updateTextBox()
end)

local decreaseCornerButton = createButton("Corner -", UDim2.new(0, 285, 0, 10), topBar, function()
    uiCorner.CornerRadius = UDim.new(0, uiCorner.CornerRadius.Offset - 5)
    updateTextBox()
end)

-- Thêm chức năng hide bằng tool ảo
local tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Hide GUI"
tool.Parent = player.Backpack

local function toggleHide()
    screenGui.Enabled = not screenGui.Enabled
end

tool.Activated:Connect(toggleHide)
