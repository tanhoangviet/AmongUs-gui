local NotificationLibrary = {}

local function checkForExistingNotification(title, subtitle, description)
    for _, gui in pairs(game.CoreGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("MainFrame") then
            local existingTitle = gui.MainFrame:FindFirstChild("Title")
            local existingSubtitle = gui.MainFrame:FindFirstChild("SubTitle")
            local existingDescription = gui.MainFrame:FindFirstChild("Description")
            if existingTitle and existingSubtitle and existingDescription then
                if existingTitle.Text == title and existingSubtitle.Text == subtitle and existingDescription.Text == description then
                    return gui
                end
            end
        end
    end
    return nil
end

local function moveNotificationsUp()
    for _, gui in pairs(game.CoreGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("MainFrame") then
            local mainFrame = gui.MainFrame
            mainFrame:TweenPosition(
                UDim2.new(1, -320, mainFrame.Position.Y.Scale - 0.15, mainFrame.Position.Y.Offset), 
                Enum.EasingDirection.Out, 
                Enum.EasingStyle.Sine, 
                0.5, 
                true
            )
        end
    end
end

function NotificationLibrary:makenotify(config)
    local existingNotification = checkForExistingNotification(config.title, config.Subtitle, config.Description)
    if existingNotification then
        existingNotification.MainFrame.ZIndex = existingNotification.MainFrame.ZIndex + 1
        return
    end

    moveNotificationsUp()

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 300, 0, 150)
    MainFrame.Position = UDim2.new(1, 300, 1, -160)
    MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    MainFrame.BorderSizePixel = 0
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.Visible = true
    MainFrame.ZIndex = 1

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame

    MainFrame:TweenPosition(UDim2.new(1, -320, 1, -160), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.5)

    local Title = Instance.new("TextLabel")
    Title.Parent = MainFrame
    Title.Name = "Title"
    Title.Size = UDim2.new(1, 0, 0.2, 0)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = config.title or "Title"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 20
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)

    local SubTitle = Instance.new("TextLabel")
    SubTitle.Parent = MainFrame
    SubTitle.Name = "SubTitle"
    SubTitle.Size = UDim2.new(1, 0, 0.2, 0)
    SubTitle.Position = UDim2.new(0, 0, 0.2, 0)
    SubTitle.BackgroundTransparency = 1
    SubTitle.Text = config.Subtitle or "Subtitle"
    SubTitle.Font = Enum.Font.Gotham
    SubTitle.TextSize = 18
    SubTitle.TextColor3 = Color3.fromRGB(180, 180, 180)

    local Description = Instance.new("TextLabel")
    Description.Parent = MainFrame
    Description.Name = "Description"
    Description.Size = UDim2.new(1, 0, 0.4, 0)
    Description.Position = UDim2.new(0, 0, 0.4, 0)
    Description.BackgroundTransparency = 1
    Description.Text = config.Description or "Description goes here."
    Description.Font = Enum.Font.Gotham
    Description.TextSize = 16
    Description.TextColor3 = Color3.fromRGB(180, 180, 180)
    Description.TextWrapped = true

    local Button
    if config.Button and config.Button[1] == "true" then
        Button = Instance.new("TextButton")
        Button.Parent = MainFrame
        Button.Size = UDim2.new(0.4, 0, 0.15, 0)
        Button.Position = UDim2.new(0.3, 0, 0.85, -10)
        Button.Text = config.Button[2].name or "Button"
        Button.Font = Enum.Font.GothamBold
        Button.TextSize = 16
        Button.TextColor3 = Color3.new(1, 1, 1)
        Button.BackgroundColor3 = Color3.new(0.2, 0.7, 0.2)

        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 8)
        ButtonCorner.Parent = Button

        Button.MouseButton1Click:Connect(function()
            if config.Button[2].Callback then
                config.Button[2].Callback()
            end
            MainFrame:TweenPosition(UDim2.new(1, 320, 1, -160), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.5, true, function()
                ScreenGui:Destroy()
            end)
        end)
    end

    local TimeBar = Instance.new("Frame")
    TimeBar.Parent = MainFrame
    TimeBar.Size = UDim2.new(0, 300, 0, 5)
    TimeBar.Position = UDim2.new(0, 0, 1, -5)
    TimeBar.BackgroundColor3 = Color3.new(0.2, 0.7, 0.2)
    TimeBar.BorderSizePixel = 0

    local TweenService = game:GetService("TweenService")
    local goal = {Size = UDim2.new(0, 0, 0, 5)}
    local tweenInfo = TweenInfo.new(config.Duration or 5, Enum.EasingStyle.Linear)
    local timeTween = TweenService:Create(TimeBar, tweenInfo, goal)
    timeTween:Play()

    if config.Duration then
        wait(config.Duration)
        if Button and Button.Visible then
            Button.Visible = false
        end
        MainFrame:TweenPosition(UDim2.new(1, 320, 1, -160), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.5, true, function()
            ScreenGui:Destroy()
        end)
    end
end

return NotificationLibrary
