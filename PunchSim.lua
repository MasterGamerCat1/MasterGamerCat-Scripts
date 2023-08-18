local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/TmwenJBZ')))()
local Window = OrionLib:MakeWindow({
    Name = "Cesar Hub",
    HidePremium = false,
    IntroText = "Cesar Hub",
    SaveConfig = true,
    ConfigFolder = "Cesar Hub"
})

-- Values
-- Farming
getgenv().AutoDamage = false
-- Eggs
getgenv().AutoHatchEgg = false
getgenv().SelectEgg = ""

-- Local Functions

-- Functions
-- Buttons

-- Farming

function AutoDamage()
    while getgenv().AutoDamage do
        game:GetService("ReplicatedStorage").Events.DamageIncreaseOnClickEvent:FireServer()
        task.wait()
    end
end

-- Eggs
function AutoHatchEgg()
    while getgenv().AutoHatchEgg do
        game:GetService("ReplicatedStorage").Events.PlayerPressedKeyOnEgg:FireServer("" .. getgenv().SelectEgg .. "")
        task.wait()
    end
end

-- Tabs
local FarmingTab = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://11896700808",
    PremiumOnly = false
})

local EggsTab = Window:MakeTab({
    Name = "Eggs",
    Icon = "rbxassetid://8691625924",
    PremiumOnly = false
})

local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://476288227",
    PremiumOnly = false
})

local TeleportTab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://6723742952",
    PremiumOnly = false
})

TeleportTab:AddButton({
    Name = "Forest",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 1,}))
    end   
})

TeleportTab:AddButton({
    Name = "Desert",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 2,}))
    end   
})

TeleportTab:AddButton({
    Name = "Cave",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 3,}))
    end   
})

TeleportTab:AddButton({
    Name = "Ocean",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 4,}))
    end   
})

TeleportTab:AddButton({
    Name = "Candy",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 5,}))
    end   
})

TeleportTab:AddButton({
    Name = "Snow",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 6,}))
    end   
})

TeleportTab:AddButton({
    Name = "Toy",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 7,}))
    end   
})

TeleportTab:AddButton({
    Name = "Farm",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 8,}))
    end   
})

TeleportTab:AddButton({
    Name = "Last Area",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 9,}))
    end   
})

-- Sliders
MiscTab:AddSlider({
    Name = "Walkspeed",
    Min = 16,
    Max = 500,
    Default = 16,
    Increment = 1,
    ValueName = "WalkSpeed",
    Callback = function(Value)
     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end    
})

MiscTab:AddSlider({
    Name = "JumpPower",
    Min = 16,
    Max = 500,
    Default = 16,
    Increment = 1,
    ValueName = "JumpPower",
    Callback = function(Value)
  game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end    
})
-- Toggles


-- Farming
FarmingTab:AddToggle({
    Name = "Auto Damage",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDamage = Value
        AutoDamage()
    end
})

FarmingTab:AddToggle({
    Name = "AutoClick",
    Default = false,
    Callback = function(Value)
        getgenv().AutoClicker = Value
        local VIM = game:GetService("VirtualInputManager")
        local GuiService = game:GetService("GuiService")
        local RunService = game:GetService("RunService")
        
        local function getScreenCenter()
            local screenSize = GuiService:GetScreenResolution()
            return Vector2.new(screenSize.X / 2, screenSize.Y / 2)
        end
        
        local function simulateMouseClick()
            local screenCenter = getScreenCenter()
            VIM:SendMouseButtonEvent(screenCenter.X, screenCenter.Y, 0, true, game, 1)
            VIM:SendMouseButtonEvent(screenCenter.X, screenCenter.Y, 0, false, game, 1)
        end
        
        local connection
        connection = RunService.Heartbeat:Connect(function()
            if getgenv().AutoClicker then
                simulateMouseClick()
            else
                connection:Disconnect()  -- Disconnect the Heartbeat connection to stop the loop
            end
        end)
  
    end
})

-- Eggs
EggsTab:AddButton({
    Name = "Remove Egg Animation",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").EggOpenMap:Destroy()
    end
})

EggsTab:AddToggle({
    Name = "Auto Hatch Egg",
    Default = false,
    Callback = function(Value)
        getgenv().AutoHatchEgg = Value
        AutoHatchEgg()
    end
})

local eggs          = game:GetService("Workspace").EggVendors:GetChildren() -- get all eggs in the workspace
local eggOptionsSet = {}                                           -- start with the default option

-- loop through each egg and add its name to the options list
for i = 1, #eggs do
    local eggName = eggs[i].Name
    local numericPart = eggName:match("%d+")            -- extract the numeric part from the egg name
    if numericPart then
        eggOptionsSet[tonumber(numericPart)] = true     -- insert the numeric part as a key in the set
    end
end

-- Convert the set keys to a list
local eggOptions = {}
for numericValue, _ in pairs(eggOptionsSet) do
    table.insert(eggOptions, numericValue)
end

-- Sort the eggOptions list in ascending order
table.sort(eggOptions)


EggsTab:AddDropdown({
    Name = "Select Egg",
    Default = "",
    Options = eggOptions,
    Callback = function(Value)
        getgenv().SelectEgg = Value
    end
})

-- Notifications
OrionLib:MakeNotification({
    Name = "Cesar Hub",
    Content = "Successfully loaded in!",
    Image = "rbxassetid://2669899834",
    Time = 5
})
OrionLib:Init()
