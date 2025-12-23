-- ❤️🖤 FULLSCREEN LOVE PROPOSAL (ACCEPT STATE)
-- Delta Mobile | Visual Only | Persistent Screen

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AcceptedLoveScreen"
gui.IgnoreGuiInset = true -- TRUE FULLSCREEN
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- BACKGROUND
local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.fromRGB(5,5,5)
bg.Parent = gui

-- RED-BLACK GRADIENT
local grad = Instance.new("UIGradient")
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(160,0,0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))
}
grad.Parent = bg

TweenService:Create(
	grad,
	TweenInfo.new(7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
	{Rotation = 180}
):Play()

-- MUSIC (instrumental)
local music = Instance.new("Sound")
music.SoundId = "rbxassetid://1837467057"
music.Volume = 0.45
music.Looped = true
music.Parent = gui
music:Play()

-- MAIN TEXT
local text = Instance.new("TextLabel")
text.Size = UDim2.fromScale(0.85,0.35)
text.Position = UDim2.fromScale(0.075,0.25)
text.BackgroundTransparency = 1
text.TextWrapped = true
text.TextScaled = true
text.Font = Enum.Font.FredokaOne
text.TextColor3 = Color3.fromRGB(180,0,0)
text.Text = ""
text.Parent = bg

local stroke = Instance.new("UIStroke", text)
stroke.Color = Color3.fromRGB(255,0,0)
stroke.Thickness = 2
stroke.Transparency = 0.4

-- MESSAGE
local proposal =
"QIN SHU HUANG ❤️🖤\n(@seyongji_yuk)\n\nI love u 🤭\nu are all mine 🤭❤️"

task.spawn(function()
	for i = 1, #proposal do
		text.Text = string.sub(proposal,1,i)
		task.wait(0.05)
	end
end)

-- FLOATING HEARTS (LOOP)
task.spawn(function()
	while true do
		task.wait(0.3)
		local h = Instance.new("TextLabel")
		h.Size = UDim2.fromScale(0.05,0.08)
		h.Position = UDim2.fromScale(math.random(),1)
		h.BackgroundTransparency = 1
		h.Text = "❤️"
		h.TextScaled = true
		h.Parent = bg

		TweenService:Create(h, TweenInfo.new(4), {
			Position = h.Position - UDim2.fromScale(0,1.2),
			TextTransparency = 1
		}):Play()

		Debris:AddItem(h,4)
	end
end)

-- BUTTON
local btn = Instance.new("TextButton")
btn.Size = UDim2.fromScale(0.4,0.13)
btn.Position = UDim2.fromScale(0.3,0.68)
btn.BackgroundColor3 = Color3.fromRGB(120,0,0)
btn.Text = "🖤 Tap To Accept 🖤"
btn.TextScaled = true
btn.Font = Enum.Font.GothamBold
btn.TextColor3 = Color3.new(1,1,1)
btn.Parent = bg

local corner = Instance.new("UICorner", btn)
corner.CornerRadius = UDim.new(0.3,0)

-- FIREWORK LOOP (AFTER ACCEPT)
local function firework()
	for i = 1, 25 do
		local p = Instance.new("Frame")
		p.Size = UDim2.fromScale(0.01,0.01)
		p.Position = UDim2.fromScale(0.5,0.5)
		p.BackgroundColor3 = Color3.fromRGB(200,0,0)
		p.Parent = bg

		local a = math.rad(math.random(0,360))
		local d = math.random(15,30)/100

		TweenService:Create(p, TweenInfo.new(1), {
			Position = p.Position + UDim2.fromScale(
				math.cos(a)*d,
				math.sin(a)*d
			),
			BackgroundTransparency = 1
		}):Play()

		Debris:AddItem(p,1)
	end
end

-- ACCEPT EVENT (DOES NOT CLOSE)
btn.MouseButton1Click:Connect(function()
	btn.Text = "❤️ Accepted ❤️"
	btn.BackgroundColor3 = Color3.fromRGB(180,0,0)

	text.Text =
	"❤️🖤 ACCEPTED 🖤❤️\n\nHe accepted my proposal\nForever starts now 🤭❤️"

	-- Glow pulse
	task.spawn(function()
		while true do
			TweenService:Create(stroke, TweenInfo.new(1.2), {
				Transparency = 0.8
			}):Play()
			task.wait(1.2)
			TweenService:Create(stroke, TweenInfo.new(1.2), {
				Transparency = 0.3
			}):Play()
			task.wait(1.2)
		end
	end)

	-- Fireworks loop
	task.spawn(function()
		while true do
			firework()
			task.wait(1.8)
		end
	end)
end)
