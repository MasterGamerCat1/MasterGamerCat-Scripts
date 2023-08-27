getgenv().RHF_Settings = {
    StartupNotification = false, -- Toast Notification On Startup: default = true
    StartupAnimation = false, -- Loading Animation On Startup: default = true
    ErrorToastNotifications = false-- Toast Notifications For Errors: default = false
}
 
RubyHubFunctions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RubyScriptsOnTop/RubyHubFunctions/main/source.lua"))()
 
task.wait(2)
 
RubyHubFunctions.StartupAnimation({
    Title = "Sex Simulator", -- default = "Ruby Hub Functions"
    LoadingText = "Thank you for using SEX!", -- default = "Loading..."
    Icon = "rbxassetid://14515446164" -- default = RubyHubFunctions.Icons.RubyHubNoBG
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/MasterGamerCat1/MasterGamerCat-Scripts/main/MunchEatingSimulator"))()
 
task.wait(3)
 
while task.wait(300) do
 
    pcall(function()
  
    end)
 
end
