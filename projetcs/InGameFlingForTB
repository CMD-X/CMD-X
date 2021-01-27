local paste = "https://raw.githubusercontent.com/CMD-X/CMD-X/master/projetcs/InGameFlingForTB"
local message = "ur message"
if not game:IsLoaded() then game.Loaded:wait() end

local rand = Random.new()
local plr = game:GetService("Players").LocalPlayer
local cmdlp = plr
local event = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")

local function newserver()
    syn.queue_on_teleport("loadstring(game:HttpGetAsync(\""..paste.."\"))()")

    local servers = {}
    for _ = 1,100 do
        for _ = 1,3 do
            local decode = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="))
            if decode.nextPageCursor ~= nil then
                decode = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..decode.nextPageCursor))
                for _,server in pairs(decode.data) do
                    if server.maxPlayers ~= server.playing then
                        servers[#servers+1] = server.id
                    end
                end
            else
                for _,server in pairs(decode.data) do
                    if server.maxPlayers ~= server.playing then
                        servers[#servers+1] = server.id
                    end
                end
                break
            end
        end
        coroutine.wrap(function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[rand:NextInteger(1,#servers)], plr)
        end)()
        wait(6.66)
    end
end
wait(2)

pcall(function()
    function noclip()
    	Clip = false
    	function NoclipLoop()
    		if Clip == false and game:GetService("Players").LocalPlayer.Character ~= nil then
    			for _, child in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
    				if child:IsA("BasePart") and child.CanCollide == true then
    					child.CanCollide = false
    				end
    			end
    		end
    	end
    	Noclipping = game:GetService('RunService').Stepped:connect(NoclipLoop)
    end

    noclip()
    workspace.CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
    local BT = Instance.new("BodyAngularVelocity")
    BT.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
    BT.AngularVelocity = Vector3.new(0,0,0)
	BT.MaxTorque = Vector3.new(0,311111,0)
	BT.P = math.huge
	for _, child in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
		if child:IsA("BasePart") then
			child.CustomPhysicalProperties = PhysicalProperties.new(2, 0.3, 0.5)
		end
	end
end)

for _ = 1,7 do
    event:FireServer(message, "All")
end

pcall(function()
    for _,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Character.Humanoid.SeatPart == nil and v.Character:FindFirstChild("HumanoidRootPart") then
            BT.AngularVelocity = Vector3.new(0,9e9,0)
            cmdlp.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
            wait(.5)
            BT.AngularVelocity = Vector3.new(0,0,0)
            wait(.5)
        end
    end
end)

for _,p in pairs(game:GetService("Players"):GetPlayers()) do
    if p ~= plr then
        for _ = 1,7 do
            event:FireServer("/w "..p.Name.." "..message, "All")
        end
    end
end

pcall(function() cmdlp.Character.HumanoidRootPart.CFrame = game:GetService("Players"):GetPlayers()[math.random(1,#game:GetService("Players"):GetPlayers())].Character.HumanoidRootPart.CFrame end)
wait(2)
pcall(function() cmdlp.Character.HumanoidRootPart.CFrame = game:GetService("Players"):GetPlayers()[math.random(1,#game:GetService("Players"):GetPlayers())].Character.HumanoidRootPart.CFrame end)
wait(2)

newserver()
