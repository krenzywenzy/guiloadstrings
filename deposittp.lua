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

local function guardOnly()
	for _,part in pairs(workspace.Level.Actors:GetDescendants()) do
		if part:IsA("BasePart" or "UnionOperation" or "Model") and not part:IsDescendantOf(plrchar) and part.Name == "HumanoidRootPart" then
			local useless = part.Parent:WaitForChild("Interact"):WaitForChild("ObjectName")
			if (part.Parent.Interact.ObjectName.Value == "Guard" or part.Parent.Interact.ObjectName.Value == "Base Security" or part.Parent.Interact.ObjectName.Value == "Elite Guard" or part.Parent.Interact.ObjectName.Value == "Security" or part.Parent.Interact.ObjectName.Value == "Bodyguard" or part.Parent.Interact.ObjectName.Value == "Police" or part.Parent.Interact.ObjectName.Value == "SC Guard" or part.Parent.Interact.ObjectName.Value == "Phoenix Operative" or part.Parent.Interact.ObjectName.Value == "Halcyon Operative" or part.Parent.Interact.ObjectName.Value == "Janitor" or part.Parent.Interact.ObjectName.Value == "Elite Operative" or part.Parent.Interact.ObjectName.Value == "Falcon" or part.Parent.Interact.ObjectName.Value == "Evidence Custodian" or part.Parent.Interact.ObjectName.Value == "Police Captain") then
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
				ForceInstance.Position = plrchar.HumanoidRootPart.Position
			end
		end
	end
end
local function civilianOnly()
	for _,part in pairs(workspace.Level.Actors:GetDescendants()) do
		if part:IsA("BasePart" or "UnionOperation" or "Model") and not part:IsDescendantOf(plrchar) and part.Name == "HumanoidRootPart" then
			local useless = part.Parent:WaitForChild("Interact"):WaitForChild("ObjectName")
			if (part.Parent.Interact.ObjectName.Value == "Civilian") then
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
				ForceInstance.Position = plrchar.HumanoidRootPart.Position
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

local resetInput
resetInput = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		if input.KeyCode == Enum.KeyCode.LeftAlt then
			guardOnly()
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
local resetInput6
resetInput6 = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent then
		if input.KeyCode == Enum.KeyCode.Y then
			civilianOnly()
		end
	end
end)
print("Script Executed: \"Deposit TP\"")