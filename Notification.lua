
local NotificationLibrary = {}
NotificationLibrary.__index = NotificationLibrary

-- Services
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- Local Player
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Create Notification Center
local notificationCenter = Instance.new("Frame")
notificationCenter.Size = UDim2.new(0.3, 0, 1, 0)
notificationCenter.Position = UDim2.new(0.7, 0, 0, 0)
notificationCenter.BackgroundTransparency = 1
notificationCenter.Parent = screenGui

local notifications = {}

-- Function to update notification positions
local function updateNotificationPositions()
    for i, notification in ipairs(notifications) do
        local targetPos = UDim2.new(0, 0, 1, -(110 * i + 10 * (i - 1)) - 10)
        TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = targetPos}):Play()
    end
end

-- Function to create a notification
function NotificationLibrary.createNotification(config)
    local title = config.title or "Title"
    local subtitle = config.subtitle or "Subtitle"
    local description = config.description or "Description"
    local iconImage = config.iconImage or ""
    local cooldown = config.cooldown or 5

    -- Create Notification Frame
    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(1, -10, 0, 100)
    notification.Position = UDim2.new(0, 5, 1, 10)
    notification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
    notification.BorderSizePixel = 2
    notification.Parent = notificationCenter

    -- Add Corner Radius
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 10)
    uiCorner.Parent = notification

    table.insert(notifications, 1, notification)

    -- Create Icon
    if iconImage ~= "" then
        local icon = Instance.new("ImageLabel")
        icon.Size = UDim2.new(0, 50, 0, 50)
        icon.Position = UDim2.new(0, 5, 0, 10)
        icon.BackgroundTransparency = 1
        icon.Image = iconImage
        icon.Parent = notification
    end

    -- Create Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -60, 0.3, 0)
    titleLabel.Position = UDim2.new(0, 60, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Text = title
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 18
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notification

    -- Create Subtitle
    local subtitleLabel = Instance.new("TextLabel")
    subtitleLabel.Size = UDim2.new(1, -60, 0.2, 0)
    subtitleLabel.Position = UDim2.new(0, 60, 0.3, 0)
    subtitleLabel.BackgroundTransparency = 1
    subtitleLabel.TextColor3 = Color3.fromRGB(105, 105, 105)
    subtitleLabel.Text = subtitle
    subtitleLabel.Font = Enum.Font.SourceSans
    subtitleLabel.TextSize = 14
    subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    subtitleLabel.Parent = notification

    -- Create Description
    local descriptionLabel = Instance.new("TextLabel")
    descriptionLabel.Size = UDim2.new(1, -60, 0.3, 0)
    descriptionLabel.Position = UDim2.new(0, 60, 0.5, 0)
    descriptionLabel.BackgroundTransparency = 1
    descriptionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    descriptionLabel.Text = description
    descriptionLabel.Font = Enum.Font.SourceSans
    descriptionLabel.TextSize = 14
    descriptionLabel.TextWrapped = true
    descriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
    descriptionLabel.Parent = notification

    -- Create Time Bar
    local timeBar = Instance.new("Frame")
    timeBar.Size = UDim2.new(1, 0, 0, 5)
    timeBar.Position = UDim2.new(0, 0, 1, -5)
    timeBar.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
    timeBar.BorderSizePixel = 0
    timeBar.Parent = notification

    local showTween = TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0, 5, 1, -110)})
    showTween:Play()
    updateNotificationPositions()

    local startTime = tick()
    local cooldownEnded = false
    RunService.RenderStepped:Connect(function()
        if not cooldownEnded then
            local elapsedTime = tick() - startTime
            if elapsedTime < cooldown then
                timeBar.Size = UDim2.new(1 - elapsedTime / cooldown, 0, 0, 5)
                timeBar.BackgroundColor3 = Color3.fromRGB(255 - math.floor(elapsedTime / cooldown * 255), math.floor(elapsedTime / cooldown * 255), 0)
            else
                timeBar.Size = UDim2.new(0, 0, 0, 5)
                cooldownEnded = true
            end
        end
    end)

    local function endCooldown()
        cooldownEnded = true
        timeBar.Size = UDim2.new(0, 0, 0, 5)
    end

    notification.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            endCooldown()
        end
    end)

    notification.TouchTap:Connect(function()
        endCooldown()
    end)

    delay(cooldown, function()
        if notification then
            table.remove(notifications, table.find(notifications, notification))
            local hideTween = TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Position = UDim2.new(0, 5, 1, 10)})
            hideTween:Play()
            hideTween.Completed:Connect(function()
                notification:Destroy()
                updateNotificationPositions()
            end)
        end
    end)
end

return NotificationLibrary
