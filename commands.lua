print("it works!")
local activeBillboards = {}
local highest = 0
local p = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")
local join = game:GetService("Players").PlayerAdded
local leave = game:GetService("Players").PlayerRemoving
local screen = Instance.new("ScreenGui", p.PlayerGui)
local frame = Instance.new("Frame", screen)
local button = Instance.new("TextButton", frame)
local drag = Instance.new("UIDragDetector", frame)
frame.Position = UDim2.fromScale(0.83,0.748)
frame.Size = UDim2.fromScale(0.037,0.07)
frame.Transparency = 0.75
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
button.Position = UDim2.fromScale(0.5, 0.5)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.Size = UDim2.fromScale(0.75, 0.75)
button.BackgroundColor3 = Color3.fromRGB(127.5,0,0)
button.BackgroundTransparency = 0.75
button.Text = "DESTROY"
button.MouseButton1Click:Connect(function()
	for _, v in ipairs(activeBillboards[p.Name]) do
		v:Destroy()
	end	
	activeBillboards = nil
	p = nil
	join = nil
	leave = nil
	screen:Destroy()
	tweenService:Destroy()
	highest = nil
end)
if join then
	join:Connect(function(player)
		timeSpent = os.clock()
		local bill = Instance.new("BillboardGui", p.Character.Head)
		local text = Instance.new("TextLabel", bill)
		local text2 = Instance.new("TextLabel", bill)
		local image = Instance.new("ImageLabel", bill)
		local text3 = Instance.new("TextLabel", image)
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
		strokeIM.Thickness = 2

		Instance.new("UIStroke", text2).Thickness = 3
		local gradient2 = Instance.new("UIGradient", text2)
		gradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient2.Rotation = 90

		Instance.new("UIStroke", text3).Thickness = 3
		local gradient3 = Instance.new("UIGradient", text3)
		gradient3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient3.Rotation = 90

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


		text3.BackgroundTransparency = 1
		text3.Position = UDim2.fromScale(0,0)
		text3.Size = UDim2.fromScale(1,0.125)
		text3.Font = Enum.Font.Arimo
		text3.TextScaled = true
		text3.TextColor3 = Color3.fromRGB(255,255,255)
		local function daysToYMD(days)
			local years = math.floor(days / 365)
			days = days % 365
			local months = math.floor(days / 30)
			local remainingDays = days % 30

			return string.format("%dy %dm %dd", years, months, remainingDays)
		end
		local accountAge = player.AccountAge
		local ageString = daysToYMD(accountAge)
		text3.Text = ageString

		local rand = 100 / (math.random()*100)
		if rand >= 1000 and rand < 10000 then
			local audio = Instance.new("Sound", workspace)
			audio.SoundId = "rbxassetid://6783209805"
			audio:Play()
			audio.Ended:Connect(function()audio:Destroy()end)
		elseif rand >= 10000 then
			local audio = Instance.new("Sound", workspace)
			audio.SoundId = "rbxassetid://243702801"
			audio:Play()
			audio.Ended:Connect(function()audio:Destroy()end)
		end
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
		local text3 = Instance.new("TextLabel", image)
		local text4 = Instance.new("TextLabel", image)
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
		strokeIM.Thickness = 2

		local gradient = Instance.new("UIGradient", text)
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient.Rotation = 90

		Instance.new("UIStroke", text2).Thickness = 3

		local gradient2 = Instance.new("UIGradient", text2)
		gradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient2.Rotation = 90

		Instance.new("UIStroke", text3).Thickness = 2

		local gradient3 = Instance.new("UIGradient", text3)
		gradient3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient3.Rotation = 90

		Instance.new("UIStroke", text4).Thickness = 2

		local gradient4 = Instance.new("UIGradient", text4)
		gradient4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient4.Rotation = 90

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

		text3.BackgroundTransparency = 1
		text3.Position = UDim2.fromScale(0,0)
		text3.Size = UDim2.fromScale(1,0.125)
		text3.Font = Enum.Font.Arimo
		text3.TextColor3 = Color3.fromRGB(255,255,255)
		text3.TextScaled = true
		local function daysToYMD(days)
			local years = math.floor(days / 365)
			days = days % 365
			local months = math.floor(days / 30)
			local remainingDays = days % 30

			return string.format("%dy %dm %dd", years, months, remainingDays)
		end
		local accountAge = player.AccountAge
		local ageString = daysToYMD(accountAge)
		text3.Text = ageString

		text4.BackgroundTransparency = 1
		text4.Position = UDim2.fromScale(0,1)
		text4.AnchorPoint = Vector2.new(0,1)
		text4.Size = UDim2.fromScale(1,0.125)
		text4.Font = Enum.Font.Arimo
		text4.TextColor3 = Color3.fromRGB(255,255,255)
		text4.TextScaled = true

		if timeSpent then
			local seconds = os.clock() - timeSpent
		else
			text4.Text = "This player was joined to the server before this user did."
		end

		local rand = 100 / (math.random()*100)
		if rand >= 1000 and rand < 10000 then
			local audio = Instance.new("Sound", workspace)
			audio.SoundId = "rbxassetid://6783209805"
			audio:Play()
			audio.Ended:Connect(function()audio:Destroy()end)
		elseif rand >= 10000 then
			local audio = Instance.new("Sound", workspace)
			audio.SoundId = "rbxassetid://243702801"
			audio:Play()
			audio.Ended:Connect(function()audio:Destroy()end)
		end
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
			local scroll = TweenInfo.new(5,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out)
			local propertiesSC = {StudsOffset = Vector3.new(0,0.5 + (index * 1.25), 0)}
			tweenService:Create(gui,scroll,propertiesSC):Play()
		end
	end
end
