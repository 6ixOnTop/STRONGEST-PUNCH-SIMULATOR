local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "Orb Teleporter",
	LoadingTitle = "Orb TP GUI",
	LoadingSubtitle = "by 6ix",
	ShowText = "Open GUI",
	ConfigurationSaving = {
		Enabled = false
	},
	KeySystem = false
})

local Tab = Window:CreateTab("Main", 4483362458) -- icon id (can change)

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local teleporting = false

local function getNextOrb()
	local world = player.leaderstats.WORLD.Value
	local OrbFolder = workspace.Map.Stages.Boosts:FindFirstChild(world)
	if not OrbFolder then return nil end

	local orbs = OrbFolder:GetChildren()
	if #orbs == 0 then return nil end

	return orbs[math.random(1, #orbs)]
end

local function main()
	local orbToTele = getNextOrb()
	if not orbToTele then return end

	local part = orbToTele.PrimaryPart or orbToTele:FindFirstChildWhichIsA("BasePart")
	if part then
		char.HumanoidRootPart.CFrame = part.CFrame
	end
end

local Toggle = Tab:CreateToggle({
	Name = "Auto Teleport Orbs",
	CurrentValue = false,
	Flag = "AutoTP",
	Callback = function(Value)
		teleporting = Value
		if teleporting then
			Rayfield:Notify({
				Title = "Started",
				Content = "Auto teleporting to random orbs.",
				Duration = 3
			})
			while teleporting do
				main()
				task.wait(0.5)
			end
		else
			Rayfield:Notify({
				Title = "Stopped",
				Content = "Auto teleport disabled.",
				Duration = 3
			})
		end
	end,
})

Tab:CreateButton({
	Name = "Teleport to One Random Orb",
	Callback = function()
		main()
	end,
})

Rayfield:Notify({
	Title = "Orb Teleporter Loaded",
	Content = "Made by 6ix",
	Duration = 5
})
