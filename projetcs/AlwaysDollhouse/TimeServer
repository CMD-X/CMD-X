local Announce = Instance.new("ImageLabel")
local Shadow = Instance.new("ImageLabel")
local Header = Instance.new("ImageLabel")
local Pattern = Instance.new("ImageLabel")
local Container = Instance.new("ImageLabel")
local UIListLayout = Instance.new("UIListLayout")
local header = Instance.new("TextLabel")
local ScrollComplex = Instance.new("ImageLabel")
local UIPadding = Instance.new("UIPadding")
local header_2 = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UICorner2 = Instance.new("UICorner")
local UICorner3 = Instance.new("UICorner")

Announce.Name = "TimeServer"
Announce.Parent = game:GetService("CoreGui").RobloxGui
Announce.AnchorPoint = Vector2.new(0.5, 0.5)
Announce.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
Announce.BorderSizePixel = 0
Announce.Position = UDim2.new(0.92, 0, 1.2, 0)
Announce.Size = UDim2.new(0, 200, 0, 200)
Announce.Visible = true
Announce.ImageColor3 = Color3.fromRGB(0, 0, 0)
Announce.ImageTransparency = 1.000

UICorner.Parent = Announce
UICorner.CornerRadius = UDim.new(0, 8)

UICorner2.Parent = Header
UICorner2.CornerRadius = UDim.new(0, 8)

UICorner3.Parent = Pattern
UICorner3.CornerRadius = UDim.new(0, 8)

Shadow.Name = "Shadow"
Shadow.Parent = Announce
Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shadow.BackgroundTransparency = 1.000
Shadow.BorderSizePixel = 0
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.ZIndex = 0
Shadow.Image = "rbxassetid://2577985667"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(20, 20, 50, 50)

Header.Name = "Header"
Header.Parent = Announce
Header.AnchorPoint = Vector2.new(0.5, 0.00999999978)
Header.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Header.BackgroundTransparency = 0.500
Header.BorderColor3 = Color3.fromRGB(27, 42, 53)
Header.BorderSizePixel = 0
Header.ClipsDescendants = true
Header.Position = UDim2.new(0.50000006, 0, 0.000318818929, 0)
Header.Size = UDim2.new(1, 0, 0.163665587, 0)
Header.ImageTransparency = 1.000

Pattern.Name = "Pattern"
Pattern.Parent = Header
Pattern.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Pattern.BackgroundTransparency = 1.000
Pattern.BorderSizePixel = 0
Pattern.Size = UDim2.new(1, 0, 1, 0)
Pattern.SizeConstraint = Enum.SizeConstraint.RelativeXX
Pattern.ZIndex = 2
Pattern.Image = "rbxassetid://922275274"
Pattern.ImageTransparency = 0.900
Pattern.ScaleType = Enum.ScaleType.Tile
Pattern.TileSize = UDim2.new(0, 50, 0, 50)

Container.Name = "Container"
Container.Parent = Header
Container.AnchorPoint = Vector2.new(0.5, 1)
Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Container.BackgroundTransparency = 1.000
Container.BorderSizePixel = 0
Container.ClipsDescendants = true
Container.Position = UDim2.new(0.50000006, 0, 1, 0)
Container.Size = UDim2.new(1, 0, 1, 0)
Container.ImageTransparency = 1.000

UIListLayout.Parent = Container
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.Padding = UDim.new(0.00999999978, 0)

header.Name = "header"
header.Parent = Container
header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
header.BackgroundTransparency = 1.000
header.BorderSizePixel = 0
header.Size = UDim2.new(1, 0, 0, 30)
header.ZIndex = 2
header.Font = Enum.Font.Gotham
header.Text = "Time till new server (m)"
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.TextSize = 17.000
header.TextWrapped = true

ScrollComplex.Name = "ScrollComplex"
ScrollComplex.Parent = Announce
ScrollComplex.AnchorPoint = Vector2.new(0.5, 1)
ScrollComplex.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollComplex.BackgroundTransparency = 1.000
ScrollComplex.BorderSizePixel = 0
ScrollComplex.Position = UDim2.new(0.5, 0, 0.99999994, 0)
ScrollComplex.Size = UDim2.new(1, 0, 0.797475994, 0)
ScrollComplex.ImageTransparency = 1.000

UIPadding.Parent = ScrollComplex
UIPadding.PaddingBottom = UDim.new(0, 15)
UIPadding.PaddingLeft = UDim.new(0, 15)
UIPadding.PaddingRight = UDim.new(0, 15)
UIPadding.PaddingTop = UDim.new(0, 15)

header_2.Name = "header"
header_2.Parent = ScrollComplex
header_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
header_2.BackgroundTransparency = 1.000
header_2.BorderSizePixel = 0
header_2.Position = UDim2.new(-0.0185185075, 0, -0.278116472, 0)
header_2.Size = UDim2.new(1.03999996, 0, 1.54999995, 0)
header_2.ZIndex = 2
header_2.Font = Enum.Font.Gotham
header_2.Text = "60"
header_2.TextColor3 = Color3.fromRGB(255, 255, 255)
header_2.TextSize = 90.000
header_2.TextWrapped = true

local v2 = Instance.new("BoolValue")
v2.Name = "PatternMoving"
v2.Value = true
v2.Parent = Pattern
local l__Position__3 = Pattern.Position
Pattern.Size = UDim2.new(Pattern.Size.X.Scale, Pattern.AbsoluteSize.X * 3, Pattern.Size.Y.Scale, Pattern.AbsoluteSize.Y * 3)
while v2 do
	wait()
	Pattern.Position = UDim2.new(Pattern.Position.X.Scale, Pattern.Position.X.Offset - 1, Pattern.Position.Y.Scale, Pattern.Position.Y.Offset - 1)
	if Pattern.AbsoluteSize.X / 2 <= -Pattern.Position.X.Offset then
		Pattern.Position = l__Position__3
	end
end
