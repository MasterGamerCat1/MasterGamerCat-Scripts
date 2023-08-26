getgenv().RHF_Settings = {
    StartupNotification = false, -- Toast Notification On Startup: default = true
    StartupAnimation = false, -- Loading Animation On Startup: default = true
    ErrorToastNotifications = false-- Toast Notifications For Errors: default = false
}
 
RubyHubFunctions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RubyScriptsOnTop/RubyHubFunctions/main/source.lua"))()
 
task.wait(2)
 
RubyHubFunctions.StartupAnimation({
    Title = "MasterGamerCat Hub", -- default = "Ruby Hub Functions"
    LoadingText = "Thank you for choosing MasterGamerCat Hub!", -- default = "Loading..."
    Icon = "rbxassetid://5281294369" -- default = RubyHubFunctions.Icons.RubyHubNoBG
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/MasterGamerCat1/MasterGamerCat-Scripts/main/PunchSim.lua"))()

task.wait(4)
 
while task.wait(0.5) do
 
    pcall(function()
 

 
    end)
 
end
