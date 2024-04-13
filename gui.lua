-- GUI Library
local library = {}

-- Services
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- Constants
local DRAG_DISTANCE = 5

-- Functions

-- Create a new GUI
function library.new(title)
    -- Create the main frame
    local gui = Instance.new("ScreenGui")
    gui.Name = "GUI"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Create the main frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainFrame.BorderSizePixel = 0
    mainFrame.ZIndex = 2
    mainFrame.Parent = gui

    -- Create the title bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(255, 69, 0)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame

    -- Create the title label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Text = title or "GUI"
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 18
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Parent = titleBar

    -- Create the close button
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Text = "X"
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 69, 0)
    closeButton.BorderSizePixel = 0
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextSize = 18
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.Parent = titleBar

    -- Create the tab bar
    local tabBar = Instance.new("Frame")
    tabBar.Name = "TabBar"
    tabBar.Size = UDim2.new(1, 0, 0, 30)
    tabBar.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    tabBar.BorderSizePixel = 0
    tabBar.Position = UDim2.new(0, 0, 0, 30)
    tabBar.Parent = mainFrame

    -- Create the content frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, 0, 1, -60)
    contentFrame.Position = UDim2.new(0, 0, 0, 60)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame

    -- Close button functionality
    closeButton.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    -- Dragging functionality
    local dragging
    local dragStartPos
    local function updateDrag(input)
        local delta = input.Position - dragStartPos
        mainFrame.Position = UDim2.new(
            mainFrame.Position.X.Scale,
            mainFrame.Position.X.Offset + delta.X,
            mainFrame.Position.Y.Scale,
            mainFrame.Position.Y.Offset + delta.Y
        )
    end

    -- Mouse input events
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStartPos = input.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if dragging then
                updateDrag(input)
            end
        end
    end)

    -- Return the GUI
    return gui
end

-- Example usage:
local myGUI = library.new("Among Us Hub")
myGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Add a tab to the GUI
function library.addTab(gui, tabName)
    -- Get the content frame
    local contentFrame = gui.MainFrame.ContentFrame

    -- Create the tab button
    local tabButton = Instance.new("TextButton")
    tabButton.Name = "TabButton"
    tabButton.Text = tabName
    tabButton.Size = UDim2.new(0, 80, 0, 30)
    tabButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    tabButton.BorderSizePixel = 0
    tabButton.Parent = gui.MainFrame.TabBar

    -- Create the tab content
    local tabContent = Instance.new("Frame")
    tabContent.Name = tabName
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.BackgroundTransparency = 1
    tabContent.Visible = false
    tabContent.Parent = contentFrame

    -- Connect tab button click event
    tabButton.MouseButton1Click:Connect(function()
        -- Hide all other tabs
        for _, child in ipairs(contentFrame:GetChildren()) do
            if child:IsA("Frame") then
                child.Visible = false
            end
        end
        -- Show the clicked tab content
        tabContent.Visible = true
    end)

    -- Show the first tab content by default
    tabContent.Visible = true
end

-- Return the library
return library
