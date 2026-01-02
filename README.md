# Orion Library Documentation
**Version:** Stable Release

**Language:** Lua (Roblox)

This documentation provides a complete reference for the Orion UI Library.

---

## 1. Quick Start / Booting
To utilize the library, place the following loadstring at the very top of your script.

```lua
local OrionLib = loadstring(game:HttpGet("https://github.com/OnyxIsCool/Orion/releases/download/v1.1-orion-rework/main.lua"))()
```

---

## 2. Main Structure
The hierarchy of Orion is **Window > Tab > Section > Element**.

### Creating a Window
The window is the main container for your UI.

```lua
local Window = OrionLib:MakeWindow({
    Name = "Title of the library",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})
```

**Window Parameters:**
| Property | Type | Description |
| :--- | :--- | :--- |
| **Name** | `string` | The title text displayed on the UI. |
| **HidePremium** | `bool` | If `true`, hides the user's Premium status. |
| **SaveConfig** | `bool` | Toggles the built-in configuration saving system. |
| **ConfigFolder** | `string` | The name of the folder where configs are saved within the workspace. |
| **IntroEnabled** | `bool` | Toggles the startup intro animation. |
| **IntroText** | `string` | Text displayed during the intro animation. |
| **IntroIcon** | `string` | Image Asset ID for the intro animation. |
| **Icon** | `string` | Image Asset ID displayed on the window header. |
| **CloseCallback** | `function` | Function to execute when the window is closed. |

### Creating a Tab
Tabs allow you to categorize your scripts features.

```lua
local Tab = Window:MakeTab({
	Name = "Tab 1",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
```
### Creating a Tab (Orion Icon Version)
```lua
local Tab = Window:MakeTab({
	Name = "Tab 1",
	Icon = "user",
	PremiumOnly = false
})
```

**Tab Parameters:**
| Property | Type | Description |
| :--- | :--- | :--- |
| **Name** | `string` | The title of the tab. |
| **Icon** | `string` | Image Asset ID or Name for the tab icon. |
| **PremiumOnly** | `bool` | If `true`, restricts access to Sirus Premium users only. |

### Creating a Section
Sections group elements inside a Tab to keep them organized.

```lua
local Section = Tab:AddSection({
	Name = "Section"
})
```

---

## 3. UI Elements
All elements below must be added to a **Tab** or a **Section**.

### Notification
Sends a toaster-style notification to the user.

```lua
OrionLib:MakeNotification({
	Name = "Title!",
	Content = "This is a notification.",
	Image = "rbxassetid://4483345998",
	Time = 5
})
```
### Notification (Orion Icon Version)
```lua
OrionLib:MakeNotification({
	Name = "Title!",
	Content = "Notification content... what will it say??",
	Image = "gpu",
	Time = 5
})
```
**Parameters:**
| Property | Type | Description |
| :--- | :--- | :--- |
| **Name** | `string` | The title header of the notification. |
| **Content** | `string` | The body text of the notification. |
| **Image** | `string` | The icon Asset ID or Name. |
| **Time** | `number` | Duration (in seconds) the notification stays on screen. |

### Button
A standard clickable button.

```lua
local Button = Tab:AddButton({
	Name = "Button!",
    Locked = false,
	Callback = function()
      		print("button pressed")
  	end    
})
```
**Methods:**
* `Button:Unlock()` — If you want to unlock it later in your script

**Parameters:**
| Property | Type | Description |
| :--- | :--- | :--- |
| **Name** | `string` | The name of the button. |
| **Locked** | `bool` | The boolean to set if the element is locked or not (`true` for ON, `false` for OFF). |
| **Callback** | `function` | Triggered when clicked. Returns the new boolean value. |

### Toggle
A switch that can be turned On or Off.

```lua
local Toggle = Tab:AddToggle({
	Name = "This is a toggle!",
	Locked = false,
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
```

**Parameters:**
| Property | Type | Description |
| :--- | :--- | :--- |
| **Name** | `string` | The name of the toggle. |
| **Default** | `bool` | The starting state (`true` for ON, `false` for OFF). |
| **Locked** | `bool` | The boolean to set if the element is locked or not (`true` for ON, `false` for OFF). |
| **Callback** | `function` | Triggered when clicked. Returns the new boolean value. |

**Methods:**
* `CoolToggle:Set(true)` — Programmatically change the toggle state.
* `Toggle:Unlock()` — If you want to unlock it later in your script

### Color Picker
Allows the user to select a color.

```lua
local Colorpicker = Tab:AddColorpicker({
	Name = "Colorpicker",
	Locked = false,
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		print(Value)
	end	  
})
```

**Methods:**
* `ColorPicker:Set(Color3.fromRGB(255,255,255))` — Sets the picker to a specific color.
* `Colorpicker:Unlock()` — If you want to unlock it later in your script

### Slider
A draggable bar to select a number within a range.

```lua
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
```

**Parameters:**
| Property | Type | Description |
| :--- | :--- | :--- |
| **Min** | `number` | The minimum value. |
| **Max** | `number` | The maximum value. |
| **Default** | `number` | The starting value. |
| **Increment** | `number` | Steps the slider takes (e.g., 1 for whole numbers, 0.1 for decimals). |
| **ValueName** | `string` | Text displayed after the number (e.g., "5 bananas"). |
| **Locked** | `bool` | The boolean to set if the element is locked or not (`true` for ON, `false` for OFF). |

**Methods:**
* `Slider:Set(2)` — Sets the slider to a specific number.
* `Slider:Unlock()` — If you want to unlock it later in your script

### Label
Standard text display.

```lua
local Label = Tab:AddLabel("Label")
```

**Methods:**
* `CoolLabel:Set("New Text")` — Updates the text of the label.

### Paragraph
Displays a header and a body of text.

```lua
local Paragraph = Tab:AddParagraph("Paragraph", "Paragraph Content")
```

**Methods:**
* `CoolParagraph:Set("New Header", "New Content")` — Updates the paragraph.

### Adaptive Input (Textbox)
A box for typing strings or numbers.

```lua
local Textbox = Tab:AddTextbox({
	Name = "Textbox",
	Default = "default box input",
	TextDisappear = true,
	Locked = false,
	Callback = function(Value)
		print(Value)
	end	  
})
```

**Parameters:**
| Property | Type | Description |
| :--- | :--- | :--- |
| **TextDisappear** | `bool` | If `true`, the text clears immediately after the user presses enter/loses focus. |
| **Locked** | `bool` | The boolean to set if the element is locked or not (`true` for ON, `false` for OFF). |

**Methods:**
* `Textbox:Unlock()` — If you want to unlock it later in your script

### Keybind
Allows users to bind a specific key on their keyboard to an action.

```lua
local Keybind = Tab:AddBind({
	Name = "Bind",
	Default = Enum.KeyCode.E,
	Hold = false,
	Locked= false,
	Callback = function()
		print("press")
	end    
})
```

**Parameters:**
| Property | Type | Description |
| :--- | :--- | :--- |
| **Default** | `KeyCode` | The default key (e.g., `Enum.KeyCode.E`). |
| **Hold** | `bool` | If `true`, callback fires while holding. If `false`, callback fires on press. |
| **Locked** | `bool` | The boolean to set if the element is locked or not (`true` for ON, `false` for OFF). |

**Methods:**
* `Bind:Set(Enum.KeyCode.Q)` — Sets a new keybind programmatically.
* `Keybind:Unlock()` — If you want to unlock it later in your script

### Dropdown
A menu to select one option from a list.

```lua
local Dropdown = Tab:AddDropdown({
	Name = "Dropdown",
	Default = "1",
	Options = {"1", "2"},
	Locked = false,
	Callback = function(Value)
		print(Value)
	end    
})
```

**Methods:**
* `Dropdown:Refresh({"Option A", "Option B"}, true)` — Updates the list of options. The `true` boolean clears the old buttons.
* `Dropdown:Set("Option A")` — Selects a specific option.
* `Dropdown:Unlock()` — If you want to unlock it later in your script

### Multi-Dropdown
A menu to select multiple option from a list.

```lua
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
```
**Methods:**
* `MultiDropdown:Refresh({"Option A", "Option B"}, true)` — Updates the list of options. The `true` boolean clears the old buttons.
* `MultiDropdown:Set("Option A")` — Selects a specific option.
* `MultiDropdown:Unlock()` — If you want to unlock it later in your script

### Discord Invite
A element to show your server and discord
```lua
local DiscordInviteLink = Tab:AddDiscordInvite({
    Name = "Name Hub",
    Description = "Join server for exclusive scripts",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.gg/yourinvite",
    Locked = false
})
```
---

## 4. Configuration System (Flags)
Orion has a built-in Save/Load config system. To use this, you must have `SaveConfig = true` and a `ConfigFolder` set in your **Window** creation.

To add an element to the config file, you must add the `Flag` and `Save` properties to your element (Works with: Toggle, Slider, Dropdown, Bind, Colorpicker).

**Example:**
```lua
Tab1:AddToggle({
    Name = "Toggle",
    Default = true,
    Save = true,
    Flag = "toggle_1" 
})
```

* **Flag:** A unique string ID for the element.
* **Save:** Set to `true` to include this in the save file.

**Accessing Flags:**
You can access the value of a flag anywhere in your script using:
```lua
print(OrionLib.Flags["toggle_1"].Value)
```

---

## 5. Initialization
This function **must** be added at the very end of your script to finalize the UI.

```lua
OrionLib:Init()
```

## 6. Destruction
To unload the UI (useful for debugging or panic buttons):

```lua
OrionLib:Destroy()
```
