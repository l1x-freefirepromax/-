shared.config = {
	["Run Service"] = game:GetService('RunService'),
	["Players"] = game:GetService('Players'),
	["Hitbox Value"] = Vector3.new(18.5, 18.5, 18.5),
	["Brick Color"] = BrickColor.new("Really blue"),
	["Transparency"] = 0.9,
	["Material"] = Enum.Material.ForceField,
	["Can Collide"] = false,
	["Enabled"] = true
}

if not LPH_OBFUSCATED then
	function LPH_JIT(...) return ... end
	function LPH_JIT_MAX(...) return ... end
	function LPH_JIT_ULTRA(...) return ... end
	function LPH_NO_VIRTUALIZE(...) return ... end
	function LPH_NO_UPVALUES(f) return function(...) return f(...) end end
	function LPH_ENCSTR(...) return ... end
	function LPH_HOOK_FIX(...) return ... end
	function LPH_CRASH() return print(debug.traceback()) end
end

LPH_NO_UPVALUES(function()
	shared.config["Run Service"].RenderStepped:Connect(function()
		if shared.config["Enabled"] then
			for _, v1 in next, shared.config["Players"]:GetPlayers() do
				if v1.Name ~= shared.config["Players"].LocalPlayer.Name then
					local success, _ = pcall(function()
						local v2 = v1.Character.HumanoidRootPart
						v2.Size = shared.config["Hitbox Value"]
						v2.Transparency = shared.config["Transparency"]
						v2.BrickColor = shared.config["Brick Color"]
						v2.Material = shared.config["Material"]
						v2.CanCollide = shared.config["Can Collide"]
					end)
				end
			end
		end
	end)
end)('gg/normalhub')
