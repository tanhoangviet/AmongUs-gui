local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/Giangplay/Script/main/Orion_Library_PE_V2.lua")))()
local Window = OrionLib:MakeWindow({IntroText = "Name", IntroIcon = "rbxassetid://15315284749",Name = ("Game".." | ".. identifyexecutor()),IntroToggleIcon = "rbxassetid://7734091286", HidePremium = false, SaveConfig = false, IntroEnabled = true, ConfigFolder = "Who Game"})

local TextBox = Window:MakeTextBox({
    Name = "Enter Key",
    PlaceholderText = "Enter your key here",
    Size = UDim2.new(0, 150, 0, 30),
    Position = UDim2.new(0.5, -75, 0.5, -20),
    ClearTextOnFocus = false,
    MaxLength = 20
})

local CheckButton = Window:MakeButton({
    Name = "Check Key",
    Size = UDim2.new(0, 100, 0, 30),
    Position = UDim2.new(0.5, 75, 0.5, -20),
    Callback = function()
        local key = TextBox.Text
        if key == "mysecretkey" then
            print("Key is valid!")
        else
            print("Key is invalid!")
        end
    end
})

local GetKeyButton = Window:MakeButton({
    Name = "Get Key",
    Size = UDim2.new(0, 100, 0, 30),
    Position = UDim2.new(0.5, 75, 0.5, 10),
    Callback = function()
        local keyLink = fStringFormat("https://gateway.platoboost.com/a/%i?id=%i", accountId, localPlayerId)
        setclipboard(keyLink)
        print("Key link copied to clipboard!")
    end
})

local accountId = 22020; -- Plato account id [IMPORTANT]
local allowPassThrough = false; -- Allow user through if error occurs, may reduce security
local allowKeyRedeeming = false; -- Automatically check keys to redeem if valid
local useDataModel = false;

-- Plato callbacks
local onMessage = function(message)
    --logic
end;

-- Plato internals [START]
local fRequest, fStringFormat, fSpawn, fWait = request or http.request or http_request or syn.request, string.format, task.spawn, task.wait;
local localPlayerId = game:GetService("Players").LocalPlayer.UserId;
local rateLimit, rateLimitCountdown, errorWait = false, 0, false;
-- Plato internals [END]

-- Plato global functions [START]
function getLink()
    return fStringFormat("https://gateway.platoboost.com/a/%i?id=%i", accountId, localPlayerId);
end;

function verify(key)
    if errorWait or rateLimit then 
        return false;
    end;

    onMessage("Checking key...");

    if (useDataModel) then
        local status, result = pcall(function() 
            return game:HttpGetAsync(fStringFormat("https://api-gateway.platoboost.com/v1/public/whitelist/%i/%i?key=%s", accountId, localPlayerId, key));
        end);
        
        if status then
            if string.find(result, "true") then
                onMessage("Successfully whitelisted!");
                return true;
            elseif string.find(result, "false") then
                if allowKeyRedeeming then
                    local status1, result1 = pcall(function()
                        return game:HttpPostAsync(fStringFormat("https://api-gateway.platoboost.com/v1/autobuys/%i?id=%i&key=%s", accountId, localPlayerId, key), "", Enum.HttpContentType.ApplicationUrlEncoded);
                    end);

                    if status1 then
                        if string.find(result1, "success") then
                            onMessage("Successfully redeemed key!");
                            return true;
                        else
                            onMessage("Key is invalid.");
                            return false;
                            end;
                        else
                            onMessage("Error while redeeming key: ".. result1);
                            return false;
                        end;
                    else
                        onMessage("Error while redeeming key: ".. result1);
                        return false;
                    end;
                else
                    onMessage("Key is invalid.");
                    return false;
                end;
            else
                onMessage("Error: ".. result);
                return false;
            end;
        else
            onMessage("Error while verifying key: ".. result);
            return false;
        end;
    else
        fRequest(fStringFormat("https://api-gateway.platoboost.com/v1/public/whitelist/%i/%i?key=%s", accountId, localPlayerId, key), function(result)
            if result == "true" then
                onMessage("Successfully whitelisted!");
            elseif result == "false" then
                if allowKeyRedeeming then
                    fRequest(fStringFormat("https://api-gateway.platoboost.com/v1/autobuys/%i?id=%i&key=%s", accountId, localPlayerId, key), function(result1)
                        if string.find(result1, "success") then
                            onMessage("Successfully redeemed key!");
                        else
                            onMessage("Key is invalid.");
                        end;
                    end);
                else
                    onMessage("Key is invalid.");
                end;
            else
                onMessage("Error: ".. result);
            end;
        end);
    end;
end;

function requestLink()
    onMessage("Requesting key link...");
    fRequest(getLink(), function(link)
        setclipboard(link);
        onMessage("Key link copied to clipboard!");
    end);
end;
-- Plato global functions [END]

-- User-defined key handling
if allowPassThrough then
    Window:OnInitialize(function()
        CheckButton.Text = "Check Key (Unverified)";
    end);
else
    CheckButton.Callback = function()
        local key = TextBox.Text;
        if verify(key) then
            print("Key is valid!");
        else
            print("Key is invalid!");
        end;
    end;
end;

-- Request link on start
fSpawn(requestLink);
fWait(0.1);

-- Run UI loop
while Window.Open do
    game:GetService("RunService").RenderStepped:Wait();
end;

-- Exit cleanup
if not allowPassThrough then
    CheckButton.Text = "Check Key (Unverified)";
    CheckButton.Callback = function()
        local key = TextBox.Text;
        if verify(key) then
            print("Key is valid!");
        else
            print("Key is invalid!");
        end;
    end;
end;
Window:Destroy();
print("Exited script!");
