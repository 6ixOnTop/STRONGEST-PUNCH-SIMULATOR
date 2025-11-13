local player = game.Players.LocalPlayer
local char = player.Character

local world = player.leaderstats.WORLD.value

local OrbFolder = game.workspace.Map.Stages.Boosts:FindFirstChild(world)



local function getNextOrb()
	local orbs = OrbFolder:GetChildren()
	return orbs[math.random(1, #orbs)]
end

local function main()
	local orbToTele = getNextOrb()
	
	char.HumanoidRootPart.CFrame = orbToTele.PrimaryPart.CFrame

end

while world == player.leaderstats.WORLD.value do
	main()
	wait(0.5)
end
