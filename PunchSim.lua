local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/TmwenJBZ')))()
local Window = OrionLib:MakeWindow({
    Name = "MasterGamerCat Hub",
    HidePremium = false,
    IntroText = "MasterGamerCat Hub",
    SaveConfig = true,
    ConfigFolder = "MasterGamerCat Hub"
})

-- Values
-- Farming
getgenv().AutoDamage = false
-- Eggs
getgenv().AutoHatchEgg = false
getgenv().SelectEgg = ""

getgenv().Teleport = false
getgenv().SelectTeleport = ""
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

FarmingTab:AddLabel("🥊AutoFarming🥊")

local EggsTab = Window:MakeTab({
    Name = "Eggs",
    Icon = "rbxassetid://8691625924",
    PremiumOnly = false
})

EggsTab:AddLabel("🥚Eggs🥚")


local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://476288227",
    PremiumOnly = false
})

MiscTab:AddLabel("💠Miscs💠")


MiscTab:AddButton({
    Name = "Anti AFK",
    Default = false,
    Callback = function(Value)
        local VirtualUser = game:GetService("VirtualUser")
        local PlayerConnections = getconnections or get_signal_cons
        
            if PlayerConnections then
                
                for _, Connection in pairs(PlayerConnections(game.Players.LocalPlayer.Idled)) do
                    
                    if Connection["Disable"] then
                        
                        Connection["Disable"](Connection)
                    
                    elseif Connection["Disconnect"] then
        
                        Connection["Disconnect"](Connection)
        
                    end
        
                end
            
            else
        
                game.Players.LocalPlayer.Idled:Connect(function()
                    
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
        
                end)
        
            end
    end
})

MiscTab:AddToggle({
    Name = "🎁  FreeGifts",
    Default = false,
    Callback = function(Value)
        getgenv().AutoPlaytime = Value

        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(1)
        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(2)
        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(3)
        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(4)
        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(5)
        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(6)
        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(7)
        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(8)
        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(9)
        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(10)
        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(11)
        game:GetService("ReplicatedStorage").Events.PlaytimeRewardUpdateEvent:FireServer(12)
    end
})

MiscTab:AddLabel("⚙️Activate Machines (Not auto)⚙️")


MiscTab:AddButton({
    Name = "👨‍💻  HackMachine (100Gems)",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.HackEvent:InvokeServer("Begin")
    end
})

MiscTab:AddButton({
    Name = "⭐  Wishing Well Small (50Gems)",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.WishingWell:FireServer("Small")
    end
    })

MiscTab:AddButton({
    Name = "⭐  Wishing Well Medium (200Gems)",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.WishingWell:FireServer("Medium")
    end
    })

MiscTab:AddButton({
    Name = "⭐  Wishing Well High (1000Gems)",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.WishingWell:FireServer("High")
    end
})

MiscTab:AddLabel("⚙️Extras⚙️")



local TeleportTab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://6723742952",
    PremiumOnly = false
})

TeleportTab:AddLabel("🌀Telportations🌀")


TeleportTab:AddButton({
    Name = "Teleport To Area",
    Default = false,
    Callback = function()
        local offset = Vector3.new(0, 7, 0)
        local selectedTeleport = game:GetService("ReplicatedStorage").TeleportLocations:FindFirstChild(getgenv().SelectTeleport)
        if selectedTeleport then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = selectedTeleport.CFrame + offset
        end
    end
})

local teleport          = game:GetService("ReplicatedStorage").TeleportLocations:GetChildren() -- get all eggs in the workspace
local teleportOptionsSet = {}                                           -- start with the default option

-- loop through each egg and add its name to the options list
for i = 1, #teleport do
    local teleportName = teleport[i].Name
    local numericPart = teleportName:match("%d+")            -- extract the numeric part from the egg name
    if numericPart then
        teleportOptionsSet[tonumber(numericPart)] = true     -- insert the numeric part as a key in the set
    end
end

-- Convert the set keys to a list
local teleportOptions = {}
for numericValue, _ in pairs(teleportOptionsSet) do
    table.insert(teleportOptions, numericValue)
end

-- Sort the eggOptions list in ascending order
table.sort(teleportOptions)


TeleportTab:AddDropdown({
    Name = "Select Area",
    Default = "",
    Options = teleportOptions,
    Callback = function(Value)
        getgenv().SelectTeleport = Value
    end
})


TeleportTab:AddButton({
    Name = "🌲  Forest",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 1,}))
    end   
})

TeleportTab:AddButton({
    Name = "🏜️  Desert",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 2,}))
    end   
})

TeleportTab:AddButton({
    Name = "🕳️  Cave",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 3,}))
    end   
})

TeleportTab:AddButton({
    Name = "🌊  Ocean",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 4,}))
    end   
})

TeleportTab:AddButton({
    Name = "🍬  Candy",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 5,}))
    end   
})

TeleportTab:AddButton({
    Name = "❄️  Snow",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 6,}))
    end   
})

TeleportTab:AddButton({
    Name = "🧸  Toy",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 7,}))
    end   
})

TeleportTab:AddButton({
    Name = "🚜  Farm",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 8,}))
    end   
})

TeleportTab:AddButton({
    Name = "🏯  Samurai",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 9,}))
    end   
})

TeleportTab:AddButton({
    Name = "🚀  Space",
    Default = false,
    Callback = function(Value)
        game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer(table.unpack({    [1] = "Teleport",    [2] = 10,}))
    end   
})

local DungeonTab = Window:MakeTab({
    Name = "Dungeon",
    Icon = "rbxassetid://890896676",
    PremiumOnly = false
})

DungeonTab:AddLabel("🗡️Dungeons🗡️")


DungeonTab:AddButton({
    Name = "Start Dungeon",
    Default = false,
    Callback = function(Value)
        
game:GetService("ReplicatedStorage").Events.DungeonEvent:FireServer("StartDungeon")

    end
})

DungeonTab:AddButton({
    Name = "Auto Kill Dungeon (Soon)",
    Default = false,
    Callback = function(Value)


    end
})

local MachinesTab = Window:MakeTab({
    Name = "Machines",
    Icon = "rbxassetid://5078617183",
    PremiumOnly = false
})

MachinesTab:AddLabel("🛠️Tp To Machines🛠️")

MachinesTab:AddButton({
    Name = "🧈 Gold Machine",
    Default = false,
    Callback = function(Value)
        local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        rootPart.CFrame = CFrame.new(-1389.04065, 94.3862305, 2417.73462, -0.906296611, 0, 0.422642082, 0, 1, 0, -0.422642082, 0, -0.906296611)
    end
})

MachinesTab:AddButton({
    Name = "💎 Gem Upgrade Machine",
    Default = false,
    Callback = function(Value)
        local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        rootPart.CFrame = CFrame.new(-1324.5791, 97.6729889, 2378.8584, -0.874622703, 0, 0.484804183, 0, 1, 0, -0.484804183, 0, -0.874622703)
    end
})

MachinesTab:AddButton({
    Name = "🐾 Merge Machine",
    Default = false,
    Callback = function(Value)
        local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        rootPart.CFrame = CFrame.new(-3040.43677, 94.3603821, 2517.44922, -0.994581103, 0, -0.103963219, 0, 1, 0, 0.103963219, 0, -0.994581103)
    end
})

MachinesTab:AddButton({
    Name = "🌈 Rainbow Machine",
    Default = false,
    Callback = function(Value)
        local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        rootPart.CFrame = CFrame.new(-2932.83838, 94.4048767, 2511.0791, 0.90629667, 0, 0.422642082, 0, 1, 0, -0.422642082, 0, 0.90629667)
    end
})

MachinesTab:AddButton({
    Name = "★ Wishing Well",
    Default = false,
    Callback = function(Value)
        local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        rootPart.CFrame = CFrame.new(-4893.89111, 94.1791382, 2517.57104, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    end
})

MachinesTab:AddButton({
    Name = "🧰 Equipment Shop",
    Default = false,
    Callback = function(Value)
        local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        rootPart.CFrame = CFrame.new(-6149.37598, 94.2394028, 2517.45264, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
    end
})

MachinesTab:AddButton({
    Name = "👾 Hacker Station",
    Default = false,
    Callback = function(Value)
        local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        rootPart.CFrame = CFrame.new(-7548.10938, 94.1301727, 2528.77954, -0.798616767, 0, 0.601840496, 0, 1, 0, -0.601840496, 0, -0.798616767)
    end
})

MachinesTab:AddButton({
    Name = "⛏️ Miner",
    Default = false,
    Callback = function(Value)
        local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        rootPart.CFrame = CFrame.new(-9413.26465, 94.4916687, 2517.36768, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    end
})

local FpsTab = Window:MakeTab({
    Name = "FPS Booster",
    Icon = "rbxassetid://590553552",
    PremiumOnly = false
})

FpsTab:AddLabel("🟢FPS Stuff🟢")

FpsTab:AddButton({
    Name = "Low Graphics",
    Default = false,
    Callback = function(Value)

     loadstring(game:HttpGet("https://raw.githubusercontent.com/MasterGamerCat1/MasterGamerCat-Scripts/main/LowGraphics.lua"))()

    end
})


FpsTab:AddTextbox({
	Name = "FPS Unlocker",
	Default = "Input",
	TextDisappear = true,
	Callback = function(Value)
        setfpscap(Value)

    end	  
})

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://12663078719",
    PremiumOnly = false
})

CreditsTab:AddLabel("Created By MasterGamerCat, RubyHubOfficial and GodGamer.")

CreditsTab:AddLabel("Join The Discord")

CreditsTab:AddButton({
    Name = "MasterGamerCat Discord Server",
    Default = false,
    Callback = function(Value)
setclipboard("https://discord.gg/rx6Jg6yTyz")
    end
})

CreditsTab:AddButton({
    Name = "RubyHubOfficial Discord Server",
    Default = false,
    Callback = function(Value)

setclipboard("https://discord.com/invite/9Nqz8QCyDf")

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
    Name = "🥊 Auto Damage",
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
    Name = "MasterGamerCat Hub",
    Content = "Successfully loaded in!",
    Image = "rbxassetid://5281294369",
    Time = 5
})
OrionLib:Init()
