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

MiscTab:AddToggle({
    Name = "FreeGifts (Working On it)",
    Default = false,
    Callback = function(Value)
        getgenv().AutoClaim = Value
        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(1)
    end
})

MiscTab:AddButton({
    Name = "HackMachine (100Gems)",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.HackEvent:InvokeServer("Begin")
    end
})

MiscTab:AddButton({
    Name = "Wishing Well Small (50Gems)",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.WishingWell:FireServer("Small")
    end
    })

MiscTab:AddButton({
    Name = "Wishing Well Medium (200Gems)",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.WishingWell:FireServer("Medium")
    end
    })

MiscTab:AddButton({
    Name = "Wishing Well High (1000Gems)",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.WishingWell:FireServer("High")
    end
})


local TeleportTab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://6723742952",
    PremiumOnly = false
})

TeleportTab:AddButton({
    Name = "Forest (Need To buy TP With Gems)",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 1,}))
    end   
})

TeleportTab:AddButton({
    Name = "Desert (Need To buy TP With Gems",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 2,}))
    end   
})

TeleportTab:AddButton({
    Name = "Cave (Need To buy TP With Gems",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 3,}))
    end   
})

TeleportTab:AddButton({
    Name = "Ocean (Need To buy TP With Gems",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 4,}))
    end   
})

TeleportTab:AddButton({
    Name = "Candy (Need To buy TP With Gems",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 5,}))
    end   
})

TeleportTab:AddButton({
    Name = "Snow (Need To buy TP With Gems",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 6,}))
    end   
})

TeleportTab:AddButton({
    Name = "Toy (Need To buy TP With Gems",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 7,}))
    end   
})

TeleportTab:AddButton({
    Name = "Farm (Need To buy TP With Gems",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 8,}))
    end   
})

TeleportTab:AddButton({
    Name = "Last Area (Need To buy TP With Gems)",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 9,}))
    end   
})

TeleportTab:AddButton({
    Name = "Last Last Area (Need To buy TP With Gems)",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 10,}))
    end   
})

local DungeonTab = Window:MakeTab({
    Name = "Dungeon",
    Icon = "rbxassetid://4786777810",
    PremiumOnly = false
})

DungeonTab:AddButton({
    Name = "Kill Aura Soon",
    Default = false,
    Callback = function(Value)


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
