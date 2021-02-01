-- // pigeon#8951 // AngularWalk Roblox

local Player = game:GetService("Players").LocalPlayer
local DoNoclip = true
local DesiredAngle = {-180 --[[Lower]], -180 --[[Upper]]}

function MError(MessageTXT)
    local Message = Instance.new("Message", workspace)
    Message.Text = MessageTXT
    wait(7)
    Message:Destroy()
end

if setsimulationradius then
	setsimulationradius(1e308, 1/0)
elseif sethiddenproperty then
	sethiddenproperty(Player, "MaximumSimulationRadius" ,1/0)
	sethiddenproperty(Player, "SimulationRadius", 1e308)
else
    MError("Your exploit does not support setsimulationradius or sethiddenproperty.")
    return
end

if Player.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
    MError("AngularWalk will not work on R15 character rig.")
    return
end

for i,v in pairs(workspace:GetDescendants()) do
	if v:IsA("Seat") or v:IsA("VehicleSeat") then
		v:Destroy()
	end
end

function Noclip()
	function NoclipLoop()
		if Player.Character ~= nil then
			for _,v in pairs(Player.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanCollide == true then
					v.CanCollide = false
				end
			end
		end
	end
	Noclipping = game:GetService('RunService').Stepped:connect(NoclipLoop)
end

if DesiredAngle[1] > 180 then DesiredAngle[1] = 180 elseif DesiredAngle[1] < -180 then DesiredAngle[1] = -180 end
if DesiredAngle[2] > 180 then DesiredAngle[2] = 180 elseif DesiredAngle[2] < -180 then DesiredAngle[2] = -180 end

function Initiate()
    local v = Player.Character.HumanoidRootPart.RootJoint
    local Socket = Instance.new("HingeConstraint")
    local a1 = Instance.new("Attachment")
    local a2 = Instance.new("Attachment")
    a1.Parent = v.Part0
    a2.Parent = v.Part1
    Socket.Parent = v.Parent
    Socket.Attachment0 = a1
    Socket.Attachment1 = a2
    a1.CFrame = v.C0
    a2.CFrame = v.C1
    Socket.LimitsEnabled = true
    Socket.LowerAngle = 0
    Socket.UpperAngle = 0
    v:Destroy()
    for i = 1, 180 do
        game:GetService("RunService").Stepped:Wait()
        if DesiredAngle[1] > 0 and i < math.abs(DesiredAngle[1]) then
            Socket.LowerAngle = Socket.LowerAngle + 1
        else
            Socket.LowerAngle = Socket.LowerAngle - 1
        end
        if DesiredAngle[2] > 0 and i < math.abs(DesiredAngle[2]) then
            Socket.UpperAngle = Socket.UpperAngle + 1
        else
            Socket.UpperAngle = Socket.UpperAngle - 1
        end
    end
end
Initiate()
if DoNoclip then Noclip() end
