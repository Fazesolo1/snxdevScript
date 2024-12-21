local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "snxdevScripts"  -- Changed the name
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui


local snxdevButton = Instance.new("TextButton")
snxdevButton.Name = "snxdevScriptsButton"  -- Changed the button name
snxdevButton.Size = UDim2.new(0.1, 0, 0.05, 0)
snxdevButton.Position = UDim2.new(0.85, 0, 0.05, 0)
snxdevButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Changed background color
snxdevButton.Text = "snxdevScripts"  -- Changed text
snxdevButton.TextColor3 = Color3.fromRGB(255, 255, 255)
snxdevButton.Font = Enum.Font.SourceSansBold
snxdevButton.TextScaled = true
snxdevButton.Parent = screenGui


local snxdevCorner = Instance.new("UICorner")
snxdevCorner.CornerRadius = UDim.new(0, 5)
snxdevCorner.Parent = snxdevButton


local function makeDraggable(frame)
    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - mousePos
            frame.Position = UDim2.new(
                framePos.X.Scale,
                framePos.X.Offset + delta.X,
                framePos.Y.Scale,
                framePos.Y.Offset + delta.Y
            )
        end
    end)
end

makeDraggable(snxdevButton)


local menuFrame = Instance.new("Frame")
menuFrame.Name = "MenuFrame"
menuFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
menuFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
menuFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)  -- Changed background color
menuFrame.BorderSizePixel = 0
menuFrame.Visible = false -- Initially hidden
menuFrame.Parent = screenGui


local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 10)
menuCorner.Parent = menuFrame


local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, 0, 0.15, 0)
tabContainer.BackgroundColor3 = Color3.fromRGB(80, 80, 80)  -- Changed tab color
tabContainer.Parent = menuFrame

local movesetsTab = Instance.new("TextButton")
movesetsTab.Text = "Movesets"
movesetsTab.Size = UDim2.new(0.25, -5, 1, -5)
movesetsTab.Position = UDim2.new(0, 5, 0, 5)
movesetsTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)  -- Changed color
movesetsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
movesetsTab.Font = Enum.Font.SourceSansBold
movesetsTab.TextScaled = true
movesetsTab.Parent = tabContainer

local settingsTab = Instance.new("TextButton")
settingsTab.Text = "Settings"
settingsTab.Size = UDim2.new(0.25, -5, 1, -5)
settingsTab.Position = UDim2.new(0.25, 5, 0, 5)
settingsTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)  -- Changed color
settingsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsTab.Font = Enum.Font.SourceSansBold
settingsTab.TextScaled = true
settingsTab.Parent = tabContainer

local helpTab = Instance.new("TextButton")
helpTab.Text = "Help"
helpTab.Size = UDim2.new(0.25, -5, 1, -5)
helpTab.Position = UDim2.new(0.5, 5, 0, 5)
helpTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)  -- Changed color
helpTab.TextColor3 = Color3.fromRGB(255, 255, 255)
helpTab.Font = Enum.Font.SourceSansBold
helpTab.TextScaled = true
helpTab.Parent = tabContainer

local tsbToolsTab = Instance.new("TextButton")
tsbToolsTab.Text = "TSB Tools"
tsbToolsTab.Size = UDim2.new(0.25, -5, 1, -5)
tsbToolsTab.Position = UDim2.new(0.75, 5, 0, 5)
tsbToolsTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)  -- Changed color
tsbToolsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
tsbToolsTab.Font = Enum.Font.SourceSansBold
tsbToolsTab.TextScaled = true
tsbToolsTab.Parent = tabContainer


local function applyHoverEffect(button)
    local originalColor = button.BackgroundColor3
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)  -- Lighter hover color
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = originalColor
    end)
end

applyHoverEffect(movesetsTab)
applyHoverEffect(settingsTab)
applyHoverEffect(helpTab)
applyHoverEffect(tsbToolsTab)


snxdevButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
end)

movesetContainer.Visible = true
tsbToolsMenu.Visible = false  -- Hide TSB Tools menu initially
