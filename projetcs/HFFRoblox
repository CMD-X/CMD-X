-- // pigeon#8951 // HFF in Roblox

local Player = game.Players.LocalPlayer

function MError(MessageTXT)
    local Message = Instance.new("Message", workspace)
    Message.Text = MessageTXT
    wait(7)
    Message:Destroy()
end

if _G.HFFScript then
    MError("HFF Script is already running.")
    return
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
    MError("HFF Script will not work as intended in R15 character rig.")    
end

for i,v in pairs(workspace:GetDescendants()) do
	if v:IsA("Seat") or v:IsA("VehicleSeat") then
		v:Destroy()
	end
end

function Initiate()
    for _,v in pairs(Player.Character:GetDescendants()) do
    	if v:IsA("Motor6D") and v.Name ~= "Neck" then
    		local Socket = Instance.new("BallSocketConstraint")
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
    		Socket.TwistLimitsEnabled = true
    		v:Destroy()
    	end
    end
    wait(1)
    local mt = getrawmetatable(game)
    local oind = mt.__index
    local hrp = Player.Character.HumanoidRootPart
    local selves = {
        [hrp.Parent] = true,
        [Player.Character] = true
    }
    local inds = {
        [hrp.Name] = true,
        ["HumanoidRootPart"] = true,
        ["PrimaryPart"] = true
    }
    setreadonly(mt, false)
    mt.__index = newcclosure(function(self,ind,...)
        if not checkcaller() and selves[self] and inds[ind] then
            return hrp
        end
        return oind(self,ind,...)
    end)
    setreadonly(mt, true)
    Player.Character.HumanoidRootPart.Parent = workspace
end
Initiate()

Player.CharacterAdded:Connect(function()
    wait(2)
    Initiate()
end)

_G.HFFScript = true
