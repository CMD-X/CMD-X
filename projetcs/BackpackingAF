local Players = game:GetService("Players"); local Player = Players.LocalPlayer

local meta = debug.getmetatable(game)
local newindex = meta.__newindex
local namecall = meta.__namecall
setreadonly(meta,false)
meta.__namecall = newcclosure(function(self,...)
	local args = {...}
	local t = getnamecallmethod()
	if t == "Kick" then
		return wait(9e9)
	end
	return namecall(self,...)
end)

Clip = false
function NoclipLoop()
	if Clip == false and Player.Character ~= nil then
		for _, child in pairs(Player.Character:GetDescendants()) do
			if child:IsA("BasePart") and child.CanCollide == true then
				child.CanCollide = false
			end
		end
	end
end
Noclipping = game:GetService('RunService').Stepped:connect(NoclipLoop)

function GrabCampervan()
    for i,v in pairs(workspace.Vehicles:GetChildren()) do
        if v.OwnerName.Value == Player.Name then
            return v
        end
    end
end

function TeleportToChest(Part)
    game:GetService("ReplicatedStorage").Events.Vehicles.VehicleSpawn:FireServer("BasicRedCampervan", workspace.VehicleSpawns.VehicleSpawn)
    Player.Character.Humanoid.Jump = true
    wait(.3)
    Player.Character.Humanoid.Jump = true
    game:GetService("ReplicatedStorage").Events.Vehicles.WheelReplication:FireServer("sit", Player.Character.Humanoid, GrabCampervan().Seats.DriverSeat)
    wait(.1)
    if Player.Character.Humanoid.Sit and Player.Character.Humanoid.SeatPart ~= nil then
        Player.Character.Humanoid.SeatPart.Parent.Parent:MoveTo(Part.Position)
        wait(.1)
        game:GetService("ReplicatedStorage").Events.Vehicles.WheelReplication:FireServer("sit", Player.Character.Humanoid, GrabCampervan().Seats.DriverSeat)
        wait(.1)
        Player.Character.Humanoid.Jump = true
        local xCount = 0
        local Tweens = {}
        repeat wait(.1)
            xCount = xCount + 1
            Player.Character.Humanoid.Jump = true
            local Tween = game:GetService("TweenService"):Create(Player.Character.HumanoidRootPart, TweenInfo.new(2, Enum.EasingStyle.Linear), {CFrame = Part.CFrame})
            Tween:Play()
            table.insert(Tweens, Tween)
            wait(1)
        until Part.Parent.Open.Value or xCount == 2
        for i,v in pairs(Tweens) do
            v:Cancel()
        end
    end
end

local x = 0
repeat wait(.1)
    for i,v in pairs(workspace.Scenery.Chests.ChestObjects:GetChildren()) do
        if v:FindFirstChild("Hitbox") ~= nil then
            x = x + 1
            TeleportToChest(v.Hitbox)
            if x == 3 then
                wait(60)
                x = 0
            end
        end
    end
until nil
