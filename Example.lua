local OrionLib = loadstring(game:HttpGet("https://github.com/OnyxIsCool/Orion/releases/download/v1.2-orion-rework/SourceNew.lua"))()
local Window = OrionLib:MakeWindow({
    Name = "Title of the library",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})

OrionLib:MakeNotification({
	Name = "Title!",
	Content = "Notification content... what will it say??",
	Image = "gpu",
	Time = 5
})

local Tab = Window:MakeTab({
	Name = "Tab 1",
	Icon = "user",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Section"
})

local Button = Tab:AddButton({
	Name = "Button!",
    Locked = false,
	Callback = function()
      		print("button pressed")
  	end    
})

local Toggle = Tab:AddToggle({
	Name = "This is a toggle!",
	Locked = false,
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
local Colorpicker = Tab:AddColorpicker({
	Name = "Colorpicker",
	Locked = false,
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		print(Value)
	end	  
})

local Slider = Tab:AddSlider({
	Name = "Slider",
	Min = 0,
	Max = 20,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "bananas",
	Locked = false,
	Callback = function(Value)
		print(Value)
	end    
})

local Paragraph = Tab:AddParagraph("Paragraph", "Paragraph Content")
local Label = Tab:AddLabel("Label")

local Keybind = Tab:AddBind({
	Name = "Bind",
	Default = Enum.KeyCode.E,
	Hold = false,
	Locked = false,
	Callback = function()
		print("press")
	end    
})

local Dropdown = Tab:AddDropdown({
	Name = "Dropdown",
	Default = "1",
	Options = {"1", "2"},
	Locked = false,
	Callback = function(Value)
		print(Value)
	end    
})

local Textbox = Tab:AddTextbox({
	Name = "Textbox",
	Default = "default box input",
	TextDisappear = true,
	Locked = false,
	Callback = function(Value)
		print(Value)
	end	  
})

local MultiDropdown Tab:AddMultiDropdown({
	Name = "Multi Dropdown",
	Default = {"One", "Three"}, 
	Options = {"One", "Two", "Three", "Four", "Five"},
	Locked = false,
	Callback = function(Value)
		print("Selected Items:")
		for _, v in pairs(Value) do
			print(v)
		end
	end    
})

local DiscordInviteLink = Tab:AddDiscordInvite({
    Name = "Name Hub",
    Description = "Join server for exclusive scripts",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.gg/yourinvite",
    Locked = false
})
