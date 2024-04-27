local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Giangplay/Script/main/Orion_Library_PE_V2.lua')))()
local Window = OrionLib:MakeWindow({IntroText = "Among Us Key system", IntroIcon = "rbxassetid://15315284749",Name = ("Among Us Key system".." | ".. identifyexecutor()),IntroToggleIcon = "rbxassetid://7734091286", HidePremium = false, SaveConfig = true, IntroEnabled = true, ConfigFolder = "Who Game"})

OrionLib:MakeNotification({
	Name = "Welcome To AmongUs Script Hub",
	Content = "You must Getkey fist",
	Image = "rbxassetid://4483345998",
	Time = 5
})

_G.Key = "amongus_886655"
_G.KeyInput = "string"

function MakeScriptHub()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/tanhoangviet/AmongUs-gui/main/Anbatocom-AmongUs-script-Hub.lua"), true))() -- You Put Your Script Here

end


function CorrectKeyNotifications()
    OrionLib:MakeNotification({
        Name = "Correct Key",
        Content = "Wait Script Loaded",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

function WrongKeyNotifications()
    OrionLib:MakeNotification({
        Name = " Wrong Key",
        Content = "You must Go server to Get key",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

local Tab = Window:MakeTab({
	Name = "Key System",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Enter Key",
	Default = "Enter Key",
	TextDisappear = true,
	Callback = function(Value)
        _G.KeyInput = Value
	end	  
})

Tab:AddButton({
	Name = "checking Key",
	Callback = function()
        if _G.KeyInput == _G.Key then
         MakeScriptHub()
         CorrectKeyNotifications()
     else
        WrongKeyNotifications()
        end
  	end    
})

local Tab = Window:MakeTab({
	Name = "Key Script",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddLabel("You key is amongus_886655")
