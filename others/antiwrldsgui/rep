local screenGui = game:GetObjects("rbxassetid://3546404827")[1]
  local mainFrame = screenGui.Frame
    local pages = mainFrame.Pages
      local pageLayout = pages.UIPageLayout
      local pageScripts = pages.Scripts
        local interactiveButton = pageScripts.Character.Elements.TextButton
        local utility = pageScripts.Utility
          local utilityElements = utility.Elements
      local pageOptions = pages.Options
    local titleFrame = mainFrame.Title
    local toolbar = mainFrame.Toolbar

screenGui.LocalScript:Destroy()
screenGui.Parent = game:GetService("CoreGui")
interactiveButton.Parent = nil
mainFrame.Visible = true

gripCenter = CFrame.new(0, 0, 1) * CFrame.Angles(math.rad(90), 0, 0)
offset = CFrame.Angles(0, 0, 0)

_player = {
	p = game:GetService("Players").LocalPlayer;
	b = function()
		return _player.p:FindFirstChild("Backpack")
	end;
	c = function()
		return _player.p.Character
	end;
}
_functions = {
	respawn = function()
		local c = _player.c()
		if workspace:FindFirstChild(_player.p.Name) then 
			spawn(function()
				wait(.5)
				if _player.c() ~= workspace:FindFirstChild(_player.p.Name) then
					workspace:FindFirstChild(_player.p.Name):BreakJoints()
				end
			end)
		end
		if c then
			c:BreakJoints()
			c:ClearAllChildren()
		end
		local newChar = Instance.new("Model", workspace)
		local hum = Instance.new("Humanoid", newChar)
		local torso = Instance.new("Part", newChar)
		newChar.Name = "respawn_"
		torso.Name = "Torso"
		torso.Transparency = 1
		_player.p.Character = newChar
		torso.Name = ""
		torso.CanCollide = false
		newChar:MoveTo(Vector3.new(999999, 999999, 999999))
	end;
	tools = function(int)
		local toolamount = int or 200
		
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local runservice = game:GetService("RunService")
		LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
		local currentamount = #LocalPlayer.Backpack:GetChildren()
		LocalPlayer.Character.Archivable = true
		local tempchar = LocalPlayer.Character:Clone()
		local lastchar = nil
		tempchar.Parent = workspace
		local savepos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
		local renderstepped = runservice.RenderStepped:Connect(function()
		    workspace.CurrentCamera.CameraSubject = tempchar:FindFirstChild("Humanoid")
		    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
			   	if tool:IsA("Tool") then
		            tool.Parent = LocalPlayer
		        end
		    end
			for _, char in pairs(workspace:GetChildren()) do
				if char.Name == LocalPlayer.Name and char:FindFirstChildWhichIsA("Humanoid") then
					char.Humanoid.Health = 0
				end
			end
		    LocalPlayer.Character:ClearAllChildren()
		    local char = Instance.new("Model", workspace)
		    Instance.new("Humanoid", char)
		    LocalPlayer.Character = char
		    if lastchar ~= nil then
		        lastchar:Destroy()
		    end
		    repeat runservice.RenderStepped:Wait() until LocalPlayer.Character ~= nil
		    lastchar = char
		end)
		repeat runservice.RenderStepped:Wait() until #LocalPlayer:GetChildren() - 3 - currentamount >= toolamount
		renderstepped:Disconnect()
		repeat runservice.RenderStepped:Wait() until LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil
		lastchar:Destroy()
		
		utilityElements.Tools.Text = "Done respawning?"
		repeat runservice.RenderStepped:Wait() until utilityElements.Tools.Text == "Load Tools"
		
		for _, tool in pairs(LocalPlayer:GetChildren()) do
		    if tool:IsA("Tool") then
		        tool.Parent = LocalPlayer.Backpack
		    end
		end
		LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = savepos
		tempchar:Destroy()
	end;
	load = function()
		local b = _player.b()
		local c = _player.c()
		local grip = function(tool, cf)
			local origin = CFrame.new(cf.p)
			local x, y, z = cf:toEulerAnglesXYZ()
			local new = CFrame.Angles(x, y, z)
			local grip = (origin * new):inverse()
			tool.Grip = grip
		end
		local model = c:WaitForChild("gay") -- stupid name choice from what a few months ago?? i have nothing against it i swear
		local parts = {}
		wait(1)
		
		for i, Model in pairs(c:GetChildren()) do
			if Model:IsA("Model") and Model.Name == "gay" then
				for i, v in pairs(Model:GetDescendants()) do
					if v:IsA("BasePart") then
						v.LocalTransparencyModifier = 1
						if v.Name ~= "Ignore" then
							table.insert(parts, v)
						end
					end
					if not v:IsA("BasePart") and not v:IsA("JointInstance") and not v:IsA("BodyMover") and not v:isA("Humanoid") and not v:IsA("Model") then
						v:Remove()
					end
				end
				Model.ChildAdded:Connect(function(c)
					c.Parent = nil
				end)
			end
		end
		
		for _, part in pairs(parts) do
			local m = Instance.new("BlockMesh", part)
			m.Scale = Vector3.new(0, 0, 0)
		end
		
		local tools = b:GetChildren()
		for i, tool in pairs(tools) do
			if tool.Parent then
				wrap(function()
					tool.Parent = c
					for i, v in pairs(tool:GetDescendants()) do
						if v:IsA("Sound") or v:IsA("TouchTransmitter") then
							v:Destroy()
						elseif v:IsA("BasePart") then
							v.Massless = true
							v.CanCollide = false
						elseif v:IsA("LocalScript") or v:IsA("Script") then
							v:Destroy()
						end
					end
					
					if tool:FindFirstChild("Handle") then
						local handle = tool.Handle
						local fakeHandle = handle:Clone()
						fakeHandle.Name = "FakeHandle"
						fakeHandle.Parent = tool
						local w = Instance.new("Weld", handle)
						w.Part0 = fakeHandle
						w.Part1 = handle
						handle.Size = Vector3.new(0, 0, 0)
					end
					
					tool.Parent = b
				end)
			end
			if (not parts[i]) then
				tools[i] = nil
				tool:Destroy()
			end
		end
		
		wait(.2)
		local amt = #tools
		
		wrap(function()
			local connection1
			
			connection1 = game:GetService("RunService").RenderStepped:Connect(function(step)
				for i = 1, amt do
					local tool = tools[i]
					if parts[i] then
						tool.Parent = b
						tool.Parent = c
					end
				end
				
				if _player.c() ~= c or c:FindFirstChildWhichIsA("Humanoid").Health == 0 then
					connection1:Disconnect()
				end
				
				utilityElements.Replicate.Text = ("Replicate (%dfps)"):format(1/step)
			end)
		end)
		
		local connection2
		connection2 = game:GetService("RunService").Heartbeat:Connect(function()
			for i = 1, amt do
				local tool = tools[i]
				if parts[i] then
					if parts[i].Transparency ~= 1 then
						local p = _cframe.toWorldPoint(parts[i].CFrame) * offset
						grip(tool, p)
					else
						local p = _cframe.toWorldPoint(CFrame.new(0, -250, 0))
						grip(tool, p)
					end
				end
			end
			if _player.c() ~= c or c:FindFirstChildWhichIsA("Humanoid").Health == 0 then
				connection2:Disconnect()
			end
		end)
	end;
}
_cframe = {
	diff = function(a, b)
		return (a:Inverse() * b)
	end;
	toWorldPoint = function(a)
		local arm = _player.c():FindFirstChild('Right Arm') or _player.c():FindFirstChild('RightHand')
		local off = arm.CFrame * gripCenter:Inverse()
		if arm.Name == "RightHand" then
			off = arm.CFrame * CFrame.Angles(math.rad(-90), 0, 0)
		end
		return _cframe.diff(off, a)
	end;
	tween = function(object,style,direction,t,goal)
	    local tweenservice = game:GetService("TweenService")
	    local tweenInfo = TweenInfo.new(t,Enum.EasingStyle[style],Enum.EasingDirection[direction])
	    local tween = tweenservice:Create(object,tweenInfo,goal)
	    tween:Play()
	    return tween
	end;
}
scriptList = {
	Character = {
		['Titan']			= {"rbxassetid://3600286284", "rbxassetid://3070358214"};
		['Winged Titan']	= {"rbxassetid://3593786550", "rbxassetid://3070358214"};
		['Part Surround']	= {"rbxassetid://3546680077", "rbxassetid://3546673786"};
	},
	Mechanical = {
		['Spiderbot']		= {"rbxassetid://3040869607", "rbxassetid://3070355648"};
		['Drone']			= {"rbxassetid://3074236927", "rbxassetid://3074245958"};
		['Noise']			= {"rbxassetid://3193712297", "rbxassetid://3070358314"};
	},
	Aesthetic = {
		['Wings']			= {"rbxassetid://3040946714", "rbxassetid://3070358381"};
		['Tail']			= {"rbxassetid://3041387168", "rbxassetid://3070358314"};
		['Star Glitcher']	= {"rbxassetid://3074734519", "rbxassetid://3074751071"};
		['Tentacles']		= {"rbxassetid://3074817074", "rbxassetid://3074820325"};
	},
	Weapon = {
		['Master Hand']		= {"rbxassetid://3040943596", "rbxassetid://3070358267"};
		['Ravenger']		= {"rbxassetid://3040945482", "rbxassetid://3070358154"};
	},
}
wrap = function(f)
	return coroutine.wrap(f)()
end

if game:GetService("RunService"):IsStudio() then
	guiLib = require(screenGui.GuiLib)
else
	guiLib = loadstring(screenGui.GuiLib.Source)()
end

for title, tbl in pairs(scriptList) do
	local frame = pageScripts[title]
	for name, info in pairs(tbl) do
		local btn = interactiveButton:Clone()
		btn.Name = name
		btn.Text = name
		btn.Parent = frame.Elements
		btn.Icon.Image = info[2]
		
		guiLib.circleInteractive(btn)
		guiLib.colorInteractive(btn)
		
		btn.MouseButton1Click:Connect(function()
			local scr = game:GetObjects(info[1])[1]
			local source = scr.Source
			
			if game:GetService("RunService"):IsStudio() == false then
				for i, v in pairs(scr:GetChildren()) do
					v.Parent = script
				end
				wrap(function()
					local func = loadstring(source)
					spawn(func)
				end)
			else
				scr.Disabled = true
				scr.Parent = _player.c()
				wait(.1)
				scr.Disabled = false
			end
		end)
	end
end

repeat wait() until pageLayout.CurrentPage

guiLib.draggable(mainFrame, titleFrame)
for i, v in pairs(toolbar:GetChildren()) do
	if v:IsA("TextButton") then
		guiLib.circleInteractive(v, 2, 1)
		v.MouseButton1Click:Connect(function()
			pageLayout:JumpTo(pages[v.Name])
		end)
		pageLayout.Changed:Connect(function(p)
			if pageLayout.CurrentPage.Name == v.Name then
				guiLib.tween(v, "Sine", "Out", .5, {BackgroundColor3 = Color3.fromRGB(255, 118, 26)})
			else
				guiLib.tween(v, "Sine", "Out", .5, {BackgroundColor3 = Color3.fromRGB(236, 109, 17)})
			end
		end)
	end
end

for i, v in pairs(utilityElements:GetChildren()) do
	if v:IsA("TextButton") then
		guiLib.circleInteractive(v)
		guiLib.colorInteractive(v)
	end
end

utilityElements.Reset.MouseButton1Click:Connect(function()
	local c = _player.c()
	c.Humanoid.Health = 0
	wait(.55)
	for i, v in pairs(c:GetChildren()) do
		if v:IsA("BackpackItem") then
			v.Parent = _player.b()
			v.Parent = _player.p
		end
	end
	repeat wait() until _player.c() ~= c
	_player.c():WaitForChild("Right Arm")
	wait(.25)
	for i, v in pairs(_player.p:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = _player.b()
		end
	end
end)

utilityElements.Block.MouseButton1Click:Connect(function()
	local c = _player.c()
	for _, v in pairs(c:GetChildren()) do
		if v:IsA("BackpackItem") then
			for _, m in pairs(v:GetDescendants()) do
				if m:IsA("DataModelMesh") then
					m:Destroy()
				end
			end
		end
	end
end)

local noclip = false
utilityElements.Noclip.MouseButton1Click:Connect(function()
	noclip = not noclip
end)

utilityElements.Tools.MouseButton1Click:Connect(function()
	if utilityElements.Tools.Text == "Load Tools" then
		_functions.tools(120)
	else
		utilityElements.Tools.Text = "Load Tools"
	end
end)

utilityElements.Replicate.MouseButton1Click:Connect(function()
	_functions.load()
end)

local flipped = 0
utilityElements.Flip.MouseButton1Click:Connect(function()
	flipped = (flipped + 1) % 4
	if flipped == 0 then
		offset = CFrame.Angles(0, 0, 0)
	elseif flipped == 1 then
		offset = CFrame.Angles(math.rad(90), 0, 0)
	elseif flipped == 2 then
		offset = CFrame.Angles(0, math.rad(90), 0)
	elseif flipped == 3 then
		offset = CFrame.Angles(0, 0, math.rad(90))
	end
end)

game:GetService("RunService").Stepped:Connect(function()
	local c = _player.c()
	if noclip then
		local descendants = c:GetDescendants()
		for i = 1, #descendants do
			local v = descendants[i]
			if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
				v.CanCollide = false
			end
		end
	end
end)

workspace:WaitForChild("S")
