local plr = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

if not plr:WaitForChild("AntiDetection",0.01) then
	local setsimulation = setsimulationradius or set_simulation_radius
	simRadLoop = game:GetService('RunService').Stepped:Connect(function()
		setsimulation(1e308, 1/0)
	end)
	local w = Instance.new("BoolValue")
	w.Name = "AntiDetection"
	w.Parent = plr
end

local plrchar = plr.Character or plr.CharacterAdded:Wait()
local someValue = false

--Function
local function guardOnly()
	for _,part in pairs(workspace.Level.Actors:GetDescendants()) do
		if part:IsA("BasePart" or "UnionOperation" or "Model") and not part:IsDescendantOf(plrchar) and part.Name == "HumanoidRootPart" then
			local useless = part.Parent:WaitForChild("Interact"):WaitForChild("ObjectName")
			if (part.Parent.Interact.ObjectName.Value == "Guard" or part.Parent.Interact.ObjectName.Value == "Workshop Tech" or part.Parent.Interact.ObjectName.Value == "Programmers" or part.Parent.Interact.ObjectName.Value == "Employee" or part.Parent.Interact.ObjectName.Value == "Analyst" or part.Parent.Interact.ObjectName.Value == "Tech" or part.Parent.Interact.ObjectName.Value == "Base Security" or part.Parent.Interact.ObjectName.Value == "Elite Guard" or part.Parent.Interact.ObjectName.Value == "Security" or part.Parent.Interact.ObjectName.Value == "Bodyguard" or part.Parent.Interact.ObjectName.Value == "Police" or part.Parent.Interact.ObjectName.Value == "Detective" or part.Parent.Interact.ObjectName.Value == "SC Guard" or part.Parent.Interact.ObjectName.Value == "Phoenix Operative" or part.Parent.Interact.ObjectName.Value == "Halcyon Operative" or part.Parent.Interact.ObjectName.Value == "Janitor" or part.Parent.Interact.ObjectName.Value == "Elite Operative" or part.Parent.Interact.ObjectName.Value == "Falcon" or part.Parent.Interact.ObjectName.Value == "Evidence Custodian" or part.Parent.Interact.ObjectName.Value == "Police Captain") then
				for i,c in pairs(part:GetChildren()) do
					if c:IsA("BodyPosition") or c:IsA("BodyGyro") then
						c:Destroy()
					end
				end
				part.CFrame = CFrame.new(Vector3.new(-50.415, 17.535, -56.62))  
            end
        end
    end
    for i,c in pairs(Forces) do
        c.Position = Vector3.new(c.Parent.Position.X,c.Parent.Position.Y + 2000,c.Parent.Position.Z)
    end
end
local function enemyOnly(who)
	for _,part in pairs(who:WaitForChild("Character"):GetDescendants()) do
		if part:IsA("BasePart" or "UnionOperation" or "Model") and not part:IsDescendantOf(plrchar) and part.Name == "HumanoidRootPart" then
			local useless = part.Parent:WaitForChild("Interact"):WaitForChild("ObjectName")
			if (part.Parent.Interact.ObjectName.Value == "SWAT" or part.Parent.Interact.ObjectName.Value == "Aegis Unit" or part.Parent.Interact.ObjectName.Value == "ETF" or part.Parent.Interact.ObjectName.Value == "TRU" or part.Parent.Interact.ObjectName.Value == "SC Soldier" or part.Parent.Interact.ObjectName.Value == "SC Shredder" or part.Parent.Interact.ObjectName.Value == "Halcyon Operative" or part.Parent.Interact.ObjectName.Value == "Juggernaut" or part.Parent.Interact.ObjectName.Value == "Police") then
				for i,c in pairs(part:GetChildren()) do
					if c:IsA("BodyPosition") or c:IsA("BodyGyro") then
						c:Destroy()
					end
				end
				local ForceInstance = Instance.new("BodyPosition")
				ForceInstance.Parent = part
				ForceInstance.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				ForceInstance.P = 25000
				ForceInstance.D = 300
				ForceInstance.Position = Vector3.new(part.Position.X,part.Position.Y + 2000,part.Position.Z)
			end
		end
	end
end
local function unfreeze()
	for _,part in pairs(workspace.Level.Actors:GetDescendants()) do
		if part:IsA("BasePart" or "UnionOperation" or "Model") and not part:IsDescendantOf(plrchar) and part.Name == "HumanoidRootPart" then
			for i,c in pairs(part:GetChildren()) do
				if c:IsA("BodyPosition") or c:IsA("BodyGyro") then
					c:Destroy()
				end
			end
		end
	end
end

--Keybinds
local resetInput
resetInput = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		if input.KeyCode == Enum.KeyCode.Y then
			guardOnly()
		end
	end
end)
local resetInput2
resetInput2 = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		if input.KeyCode == Enum.KeyCode.L then
			someValue = true
			for i,v in pairs(game.Workspace.Level.Actors:GetChildren()) do
                enemyOnly(v)
            end
		end
	end
end)
local resetInput5
resetInput5 = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		if input.KeyCode == Enum.KeyCode.O then
			unfreeze()
		end
	end
end)

--More Functions
game.Workspace.Level.Actors.ChildAdded:Connect(function(a)
	if someValue == true then
		enemyOnly(a)
	end
end)
print("Script Executed: \"FINANCIERNPCDIE.LUA EXECUTED\"")