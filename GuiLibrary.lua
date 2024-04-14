local GuiLibrary = {}

local TweenService = game:GetService("TweenService")

function GuiLibrary.CreateWindow()
    local windowFrame = Instance.new("ScreenGui")
    windowFrame.Name = "MyWindow"

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 300, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -150, -0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(43, 48, 59)
    mainFrame.BorderSizePixel = 4
    mainFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
    mainFrame.BackgroundTransparency = 0.5
    mainFrame.Parent = windowFrame

    -- Create title bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    titleBar.BorderSizePixel = 1
    titleBar.BorderColor3 = Color3.new(1, 1, 1)
    titleBar.Parent = mainFrame

    -- Create title label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.Text = "My Window ⟩⟩"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 18
    titleLabel.Parent = titleBar

    -- Rainbow colors for title bar
    local rainbowColors = {
        Color3.fromRGB(255, 0, 0),   -- Red
        Color3.fromRGB(255, 127, 0), -- Orange
        Color3.fromRGB(255, 255, 0), -- Yellow
        Color3.fromRGB(0, 255, 0),   -- Green
        Color3.fromRGB(0, 0, 255),   -- Blue
        Color3.fromRGB(75, 0, 130),  -- Indigo
        Color3.fromRGB(148, 0, 211)  -- Violet
    }

    local currentIndex = 1

    -- Function to animate rainbow colors for title bar
    local function animateRainbow()
        while true do
            titleBar.BackgroundColor3 = rainbowColors[currentIndex]
            currentIndex = (currentIndex % #rainbowColors) + 1
            wait(0.1) -- Change color every 0.1 seconds
        end
    end

    -- Start rainbow animation
    coroutine.wrap(animateRainbow)()

    -- Create button container
    local buttonContainer = Instance.new("Frame")
    buttonContainer.Name = "ButtonContainer"
    buttonContainer.Size = UDim2.new(1, 0, 0.9, 0)
    buttonContainer.Position = UDim2.new(0, 0, 0, 30)
    buttonContainer.BackgroundTransparency = 1
    buttonContainer.Parent = mainFrame

    -- Function to add a button
    function addButton(text, position, callback)
        local button = Instance.new("TextButton")
        button.Text = text
        button.Size = UDim2.new(0, 100, 0, 30)
        button.Position = position
        button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.BorderSizePixel = 0
        button.Font = Enum.Font.SourceSansBold
        button.TextSize = 18
        button.Parent = buttonContainer

        -- Connect button click event
        button.MouseButton1Click:Connect(function()
            callback()
        end)
    end

    -- Create the toggle button
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(0, 100, 0, 30)
    toggleButton.Position = UDim2.new(1, -110, 1, -3)
    toggleButton.AnchorPoint = Vector2.new(1, 1)
    toggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.BorderSizePixel = 0
    toggleButton.Font = Enum.Font.SourceSansBold
    toggleButton.TextSize = 18
    toggleButton.Text = "↓"
    toggleButton.Parent = mainFrame

    -- Function to toggle the window up and down
    local isWindowUp = true
    local function toggleWindow()
        isWindowUp = not isWindowUp
        if isWindowUp then
            TweenService:Create(mainFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, -0.5, 0)}):Play()
            titleLabel.Text = "My Window ⟩⟩"
            toggleButton.Text = "↓"
        else
            TweenService:Create(mainFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 0.5, 0)}):Play()
            titleLabel.Text = "👑🇵🇭Tester Hub"
            toggleButton.Text = "↑"
        end
    end

    -- Connect toggle function to toggle button click event
    toggleButton.MouseButton1Click:Connect(toggleWindow)

    -- Add other GUI elements and functions as needed

    return windowFrame
end

return GuiLibrary
