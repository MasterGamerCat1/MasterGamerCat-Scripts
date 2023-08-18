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
