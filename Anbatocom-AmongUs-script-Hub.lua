local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Among Us Script Hub " .. Fluent.Version,
    SubTitle = "by basic_Bee",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "All Slap Battles Hub", Icon = "rbxassetid://17310802204" }),
    fe = Window:AddTab({ Title = "All Script Fe +", Icon = "rbxassetid://17278622420" }),
    badges = Window:AddTab({ Title = "Badges Hub", Icon = "rbxassetid://17310780952" }),
    Tool = Window:AddTab({ Title = "Tool", Icon = "rbxassetid://17296506044" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Welcome To AmongUs Script Hub",
        Content = "Thanks for use Script",
        SubContent = "Memaybeonha", 
        Duration = 5
    })



    Tabs.Main:AddParagraph({
        Title = "Slap Battles All Hub",
        Content = "Slap battles All Hub available "
    })



    Tabs.Main:AddButton({
        Title = "Giang MC Hub",
        Description = "By Giang",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/Slap_Battles.lua"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Main:AddButton({
        Title = "SBS Hub",
        Description = "By SBSscripter",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet('https://pastebin.com/raw/t9XmdEFT'))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Main:AddButton({
        Title = "Admin Slap Battles Hub",
        Description = "By Unknow",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet('https://pastefy.app/geozYRNU/raw'))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Main:AddButton({
        Title = "Dizzy Hub",
        Description = "By dizzy#4507",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"), true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Main:AddButton({
        Title = "R20 Hub",
        Description = "By Unknow",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/R2O/main/LOADSTRING.lua"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Main:AddButton({
        Title = "Hub That Exits",
        Description = "By guys hub that exit",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Main:AddButton({
        Title = "Gaster Hub",
        Description = "By Gaster",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet(("https://raw.githubusercontent.com/Dusty1234567890/TestMain/main/SLAPBATTLESGUI5")))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Main:AddButton({
        Title = "Slap Farm Hub",
        Description = "By BaconScripter",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhdat4461/BaconScripterLua/main/OPSlapsFarm.lua"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Main:AddButton({
        Title = "Auto Bob hub",
        Description = "By BaconScripter",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/thanhdat4461/Script/main/Slap%20Battles/BobFarm', true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Main:AddButton({
        Title = "Destroy hub",
        Description = "By Idk",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Usehsbd/DestroyerHub/main/DestHubPublic"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.fe:AddParagraph({
        Title = "All Fe Slap Battles",
        Content = "Slap battles All FE available "
    })
    
    Tabs.fe:AddButton({
        Title = "Auto Black Hole",
        Description = "By Giang and Gaster",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/tanhoangviet/AmongUs-gui/main/Black%20Hole%20V2"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    local function ToolboxFarm()
    while Toolboxfarm do
        if game.Workspace:FindFirstChild("Toolbox") then
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "Toolbox" and v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector, 0)
                    fireclickdetector(v.ClickDetector, 1)
                end
            end
        end
        task.wait()
    end
end

local Toggle = Tabs.fe:AddToggle("ToolboxFarmToggle", { Title = "Toolbox Farm", Default = false })

Toggle:OnChanged(function()
    print("Toggle changed:", Options.ToolboxFarmToggle.Value)
    if Options.ToolboxFarmToggle.Value then
        ToolboxFarm()
    end
end)

Options.ToolboxFarmToggle:SetValue(false)
     
     Tabs.fe:AddButton({
        Title = "Anti Ban",
        Description = "By Giang and Gaster",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            local Namecall
Namecall = hookmetamethod(game, "__namecall", function(self, ...)
   if getnamecallmethod() == "FireServer" and tostring(self) == "Ban" then
       return
   elseif getnamecallmethod() == "FireServer" and tostring(self) == "WalkSpeedChanged" then
       return
   elseif getnamecallmethod() == "FireServer" and tostring(self) == "AdminGUI" then
       return
   end
   return Namecall(self, ...)
end)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.fe:AddButton({
        Title = "Auto Redacted Gloves",
        Description = "By Giang Gaster",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 5000 then
Door = 0
for i = 1, 10 do
Door = Door + 1
if game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2124847850) then
else
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.PocketDimension.Doors[Door].TouchInterest.Parent, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.PocketDimension.Doors[Door].TouchInterest.Parent, 1)
wait(3.75)
end
end
end
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.fe:AddButton({
        Title = "Auto Couter",
        Description = "By Giang and Gaster",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            if not workspace:FindFirstChild("Keypad") then
    for _, server in ipairs(game.HttpService:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
        if server.playing < server.maxPlayers and server.JobId ~= game.JobId then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id)
        end
    end
else
local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
if teleportFunc then
    teleportFunc([[
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
        repeat wait() until game.Players.LocalPlayer
    task.wait(5)
Time = 121
fireclickdetector(game.Workspace.CounterLever.ClickDetector)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
for i = 1,Time do
Time = Time - 1
game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "You wait time [ "..Time.." ] receive.",Icon = "rbxassetid://7733658504",Duration = 2})
wait(1)
end
for i,v in pairs(workspace.Maze:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
    ]])
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Keypad.Buttons.Enter.CFrame
fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild("Reset").ClickDetector)
local digits = tostring((#game.Players:GetPlayers()) * 25 + 1100 - 7)
for i = 1, #digits do
task.wait(0.8)
local digit = digits:sub(i, i)
fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild(digit).ClickDetector)
end
task.wait(0.5)
fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild("Enter").ClickDetector)
end
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

    
    Tabs.Tool:AddParagraph({
        Title = "All Tool Helpful",
        Content = "All Tool available"
    })
    
    Tabs.Tool:AddButton({
        Title = "Inf Yeild",
        Description = "Helpful Tool universal",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Tool:AddButton({
        Title = "Dex Dark V4",
        Description = "Helpful Tool universal",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/SpaceSpiffer/Scripts/main/Script5", true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Tool:AddButton({
        Title = "Dark Dex V3",
        Description = "Helpful Tool universal",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Tool:AddButton({
        Title = "Dark Dex V2",
        Description = "Helpful Tool universal",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/SpaceSpiffer/Scripts/main/Script4", true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Tool:AddButton({
        Title = "Dark Dex V1",
        Description = "Helpful Tool universal",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:GetObjects("rbxassetid://3025032531")[1].Source)()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Tool:AddButton({
        Title = "PE | ui V0.5",
        Description = "Helpful Build menu",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet(('https://pastefy.app/EOgPqinS/raw')))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Tool:AddButton({
        Title = "Remote Spy V3",
        Description = "Helpful Build menu",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Tool:AddButton({
        Title = "Simple Spy Mobile",
        Description = "Helpful Build menu",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RS/main/SimpleSpyMobile"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Tool:AddButton({
        Title = "Fly Gui V3",
        Description = "Helpful Build menu",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Tool:AddButton({
        Title = "Fly Gui V3 [Tiếng Việt]",
        Description = "Helpful Build menu",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:HttpGet(('https://raw.githubusercontent.com/tanhoangviet/AmongUs-gui/main/Fly-Gui-Ti%E1%BA%BFng-Vi%E1%BB%87t.lua'),true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.Tool:AddButton({
        Title = "F3X Tools",
        Description = "Helpful Build menu",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.badges:AddParagraph({
        Title = "All Badges in Slap Battles",
        Content = "Subscribe To AmongUs"
    })
    
    Tabs.badges:AddButton({
        Title = "Get Frost Bite",
        Description = "By DonjoDx\n create By firepp",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            if  game.PlaceId ~= 17290438723 then
game:GetService("TeleportService"):Teleport(17290438723)
elseif game.PlaceId == 17290438723 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-558, 182, 54)
local function fireAllProximityPrompts()
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant:IsA("ProximityPrompt") then
            fireproximityprompt(descendant)
        end
    end
end

-- Trigger all ProximityPrompts
fireAllProximityPrompts()
end
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.badges:AddButton({
        Title = "Instant Lamp Gloves",
        Description = "By DonjoDx\n Required 70 slap and use ZZZZZZ gloves",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            for i = 1,5 do
game:GetService("ReplicatedStorage").nightmare:FireServer("LightBroken")
end
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.badges:AddButton({
        Title = "Auto Couter",
        Description = "By Giang and Gaster",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            if not workspace:FindFirstChild("Keypad") then
    for _, server in ipairs(game.HttpService:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
        if server.playing < server.maxPlayers and server.JobId ~= game.JobId then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id)
        end
    end
else
local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
if teleportFunc then
    teleportFunc([[
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
        repeat wait() until game.Players.LocalPlayer
    task.wait(5)
Time = 121
fireclickdetector(game.Workspace.CounterLever.ClickDetector)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
for i = 1,Time do
Time = Time - 1
game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "You wait time [ "..Time.." ] receive.",Icon = "rbxassetid://7733658504",Duration = 2})
wait(1)
end
for i,v in pairs(workspace.Maze:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
    ]])
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Keypad.Buttons.Enter.CFrame
fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild("Reset").ClickDetector)
local digits = tostring((#game.Players:GetPlayers()) * 25 + 1100 - 7)
for i = 1, #digits do
task.wait(0.8)
local digit = digits:sub(i, i)
fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild(digit).ClickDetector)
end
task.wait(0.5)
fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild("Enter").ClickDetector)
end
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.badges:AddButton({
        Title = "Auto Redacted Gloves",
        Description = "By Giang Gaster",
        Callback = function()
            Window:Dialog({
                Title = "Run",
                Content = "Run Script?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                            if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 5000 then
Door = 0
for i = 1, 10 do
Door = Door + 1
if game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2124847850) then
else
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.PocketDimension.Doors[Door].TouchInterest.Parent, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.PocketDimension.Doors[Door].TouchInterest.Parent, 1)
wait(3.75)
end
end
end
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    
    
    Tabs.Tool:AddParagraph({
        Title = "",
        Content = ""
    })
    
    Tabs.Tool:AddParagraph({
        Title = "",
        Content = ""
    })
    
    Tabs.Tool:AddParagraph({
        Title = "",
        Content = ""
    })
    
    Tabs.Tool:AddParagraph({
        Title = "",
        Content = ""
    })
    
    
    Tabs.Main:AddParagraph({
        Title = "",
        Content = ""
    })
    
    Tabs.Main:AddParagraph({
        Title = "",
        Content = ""
    })
    
    
    local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,

        -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    -- OnClick is only fired when you press the keybind and the mode is Toggle
    -- Otherwise, you will have to use Keybind:GetState()
    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            -- example for checking if a keybind is being pressed
            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


    local Input = Tabs.Main:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("Among_us_cofig")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Script Hub Loaded",
    Content = "The script hub has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig() 
