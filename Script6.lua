local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(i,g)
if i.KeyCode == Enum.KeyCode.RightShift then
local Centers = workspace:GetDescendants()

for i,v in pairs(Centers) do

if v.Name == "Center" or v.Name == "Glass" and v:IsA("BasePart") then

v.CanCollide = false

end

end

print("Doors fixed")

    end
end)

print("No Doors On")
print("Press RightShift to fix doors. Make sure to execute this after spawning")