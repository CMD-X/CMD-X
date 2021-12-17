if _G.PartMovement then _G.PartMovement:Disconnect() end
wait(2)

local VRPart = Instance.new("Part", workspace)
VRPart.Size = Vector3.new(.1, 1.35, 1.89)
VRPart.CanCollide = false
VRPart.Anchored = true
VRPart.Transparency = 1

for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("SurfaceGui") then
        v:Destroy()
    end
end

_G.PartMovement = game:GetService("RunService").RenderStepped:Connect(function()
    VRPart.CFrame = workspace.CurrentCamera.CFrame * game:GetService("VRService"):GetUserCFrame(Enum.UserCFrame.LeftHand)
end)

local GuiHolder = Instance.new("SurfaceGui", game:GetService("CoreGui"))
GuiHolder.Adornee = VRPart
GuiHolder.ClipsDescendants = false
GuiHolder.AlwaysOnTop = true
GuiHolder.Face = Enum.NormalId.Right
holder.Parent = GuiHolder

holder.Position = UDim2.new(0, 450, 0, 0)
holder.Size = UDim2.new(0, 525, 0, 277)
output.Size = UDim2.new(0, 800, 0, 400)
for i,v in pairs(output:GetChildren()) do
    v.Size = UDim2.new(0, 800, 0, 27)
    v.TextSize = 27
end
entry.Position = UDim2.new(0, -9, 0, 400)
entry.Size = UDim2.new(0, 800, 0, 60)
user.Position = UDim2.new(0, 170, 0, 11)
user.Size = UDim2.new(0, 137, 0, 20)
user.TextSize = 40
cmdsu.Position = UDim2.new(0, 350, 0, 4)
cmdsu.Size = UDim2.new(0, 341, 0, 50)
cmdsu.TextSize = 30
cmd.Position = UDim2.new(0, 0, 0, 4)
cmd.Size = UDim2.new(0, 341, 0, 50)
cmd.TextSize = 30
