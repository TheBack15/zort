local activeBillboards = {}
local highest = 0
local p = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")
local join = game:GetService("Players").PlayerAdded
local leave = game:GetService("Players").PlayerRemoving
local friendService = game:GetService("FriendService")
if join then
	join:Connect(function(player)
		local bill = Instance.new("BillboardGui", p.Character.Head)
		local text = Instance.new("TextLabel", bill)
		local text2 = Instance.new("TextLabel", bill)
		local image = Instance.new("ImageLabel", bill)
		activeBillboards[p.Name] = activeBillboards[p.Name] or {}

		local offsetCount = #activeBillboards[p.Name]

		bill.Size = UDim2.fromScale(0,0)
		bill.AlwaysOnTop = true
		bill.Adornee = p.Character.Head
		bill.StudsOffset = Vector3.new(0,1.5 + offsetCount,0)

		image.BackgroundTransparency = 1
		image.Position = UDim2.fromScale(0.105,0.5)
		image.AnchorPoint = Vector2.new(0.5,0.5)
		image.Size = UDim2.fromScale(0.187,0.898)
		image.Image = game:GetService("Players"):GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		image.ScaleType = Enum.ScaleType.Fit

		table.insert(activeBillboards[p.Name], bill)

		local stroke = Instance.new("UIStroke", text)
		stroke.Thickness = 3
		local gradient = Instance.new("UIGradient", text) 
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient.Rotation = 90
		
		local strokeIM = Instance.new("UIStroke", image)
		strokeIM.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		strokeIM.Color = Color3.fromRGB(player.AccountAge * (255/6644),0,0)
		strokeIM.Thickness = 2
		
		Instance.new("UIStroke", text2).Thickness = 3
		local gradient2 = Instance.new("UIGradient", text2)
		gradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient2.Rotation = 90
		
		text.BackgroundTransparency = 1
		text.AnchorPoint = Vector2.new(1,1)
		text.Position = UDim2.fromScale(1,1)
		text.Size = UDim2.fromScale(0.7915,0.749)
		text.Font = Enum.Font.Arimo
		text.TextColor3 = Color3.fromRGB(255,255,255)
		text.TextScaled = true
		
		text2.BackgroundTransparency = 1
		text2.AnchorPoint = Vector2.new(0.5,0)
		text2.Position = UDim2.fromScale(0.5,0)
		text2.Size = UDim2.fromScale(0.5,0.25)
		text2.Font = Enum.Font.Arimo
		text2.TextColor3 = Color3.fromRGB(255,255,255)
		text2.TextScaled = true
		text2.Text = player.DisplayName .. " (" .. "@" .. player.Name .. ")"

		local rand = 100 / (math.random()*100)
		rand = string.format("%.3f", rand)
		text.Text = "1 in " .. rand

		local tweenStart = TweenInfo.new(3,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out)
		local properties1 = {Size = UDim2.fromScale(6,1.25)}
		tweenService:Create(bill,tweenStart, properties1):Play()

		wait(5)
		local tweenEnd = TweenInfo.new(3,Enum.EasingStyle.Quart,Enum.EasingDirection.In)
		local properties2 = {Size = UDim2.fromScale(0,0)}
		local play = tweenService:Create(bill,tweenEnd,properties2)
		play:Play()
		play.Completed:Connect(function()
			table.remove(activeBillboards[p.Name], table.find(activeBillboards[p.Name], bill))
			bill:Destroy() 
		end)
	end)
end
if leave then
	leave:Connect(function(player)
		local bill = Instance.new("BillboardGui", p.Character.Head)
		local text = Instance.new("TextLabel", bill)
		local text2 = Instance.new("TextLabel", bill)
		local image = Instance.new("ImageLabel", bill)
		activeBillboards[p.Name] = activeBillboards[p.Name] or {}

		local offsetCount = #activeBillboards[p.Name]

		bill.Size = UDim2.fromScale(0,0)
		bill.AlwaysOnTop = true
		bill.Adornee = p.Character.Head
		bill.StudsOffset = Vector3.new(0,1.5 + offsetCount,0)

		image.BackgroundTransparency = 1
		image.Position = UDim2.fromScale(0.105,0.5)
		image.AnchorPoint = Vector2.new(0.5,0.5)
		image.Size = UDim2.fromScale(0.187,0.898)
		image.Image = game:GetService("Players"):GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		image.ScaleType = Enum.ScaleType.Fit

		table.insert(activeBillboards[p.Name], bill)

		local stroke = Instance.new("UIStroke", text)
		stroke.Thickness = 3
		
		local strokeIM = Instance.new("UIStroke", image)
		strokeIM.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		strokeIM.Color = Color3.fromRGB(player.AccountAge * (255/6644),0,0)
		strokeIM.Thickness = 2
		
		local gradient = Instance.new("UIGradient", text)
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient.Rotation = 90
		
		Instance.new("UIStroke", text2).Thickness = 3
		
		local gradient2 = Instance.new("UIGradient", text2)
		gradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient2.Rotation = 90

		text.BackgroundTransparency = 1
		text.AnchorPoint = Vector2.new(1,1)
		text.Position = UDim2.fromScale(1,1)
		text.Size = UDim2.fromScale(0.7915,0.749)
		text.Font = Enum.Font.Arimo
		text.TextColor3 = Color3.fromRGB(255,255,255)
		text.TextScaled = true
		
		text2.BackgroundTransparency = 1
		text2.AnchorPoint = Vector2.new(0.5,0)
		text2.Position = UDim2.fromScale(0.5,0)
		text2.Size = UDim2.fromScale(0.5,0.25)
		text2.Font = Enum.Font.Arimo
		text2.TextColor3 = Color3.fromRGB(255,255,255)
		text2.TextScaled = true
		text2.Text = player.DisplayName .. " (" .. "@" .. player.Name .. ")"

		local rand = 100 / (math.random()*100)
		rand = string.format("%.3f", rand)
		text.Text = "1 in " .. rand

		local tweenStart = TweenInfo.new(3,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out)
		local properties1 = {Size = UDim2.fromScale(6,1.25)}
		tweenService:Create(bill,tweenStart, properties1):Play()

		wait(5)
		local tweenEnd = TweenInfo.new(3,Enum.EasingStyle.Quart,Enum.EasingDirection.In)
		local properties2 = {Size = UDim2.fromScale(0,0)}
		local play = tweenService:Create(bill,tweenEnd,properties2)
		play:Play()
		play.Completed:Connect(function()
			table.remove(activeBillboards[p.Name], table.find(activeBillboards[p.Name], bill))
			bill:Destroy() 
		end)
	end)
end
activeBillboards[p.Name] = activeBillboards[p.Name] or {}
while true do
	wait(0.1)
	if activeBillboards then
		for index, gui in ipairs(activeBillboards[p.Name]) do
			local scroll = TweenInfo.new(3,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out)
			local propertiesSC = {StudsOffset = Vector3.new(0,0.5 + (index * 1.25), 0)}
			tweenService:Create(gui,scroll,propertiesSC):Play()
		end
	end
end
