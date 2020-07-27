local coregui = game:GetService("CoreGui");
assert(not getgenv().dex_loaded, "Dex is already loaded");
getgenv().dex_loaded = true
math.randomseed(tick())
local UserInputService = game:GetService("UserInputService");

local TweenService = game:service'TweenService';
local setthreadcontext = setthreadcontext or syn.set_thread_identity;
function RandomCharacters(length)
	local STR = "";
	for i = 1, length do
		STR = STR .. string.char(math.random(65,90));
	end;
	return STR;
end;

local dragger = {}; 
do
	local players = game:service('Players');
	local player = players.LocalPlayer;
	local mouse = player:GetMouse();
	local run = game:service('RunService');
	local stepped = run.Stepped;
	dragger.new = function(obj)
    	spawn(function()
        	local minitial;
        	local initial;
        	local isdragging;
        	obj.InputBegan:Connect(function(input)
            	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                	isdragging = true;
                	minitial = input.Position;
                	initial = obj.Position;
                	local con;
                	con = stepped:Connect(function()
                    	if isdragging then
                        	local delta = Vector3.new(mouse.X, mouse.Y, 0) - minitial;
                        	obj.Position = UDim2.new(initial.X.Scale, initial.X.Offset + delta.X, initial.Y.Scale, initial.Y.Offset + delta.Y);
                    	else
                        	con:Disconnect();
                    	end;
               	 	end);
                	input.Changed:Connect(function()
                    	if input.UserInputState == Enum.UserInputState.End then
                        	isdragging = false;
                    	end;
                	end);
            	end;
        	end);
    	end)
	end;
end;

local localPlayer = game:GetService("Players").LocalPlayer;
local dexSpy = game:GetObjects("rbxassetid://4543296899")[1];
local remoteEvent = game:GetObjects("rbxassetid://4543177020")[1];
local remoteFunction = game:GetObjects("rbxassetid://4543178955")[1];
remoteEvent.BackgroundColor3 = Color3.fromRGB(140, 30, 49); 
remoteEvent.AutoButtonColor = false;
remoteFunction.BackgroundColor3 = Color3.fromRGB(140, 30, 49); 
remoteFunction.AutoButtonColor = false;
local tweenService = game:GetService("TweenService");
local players = game:GetService("Players");
local mouse = localPlayer:GetMouse();
local mainFrame = dexSpy.mainFrame;
local topbarFrame = mainFrame.topbarFrame;
local exitBtn = topbarFrame.exitBtn;
local miniBtn = topbarFrame.miniBtn;
local sentinelLogo = topbarFrame.sentinelLogo;
local scriptsFrame = mainFrame.scriptsFrame;
local scriptsScrollingFrame = scriptsFrame.scriptsScrollingFrame;
local scriptsBox = scriptsScrollingFrame.scriptsBox;
local highlightLabel = scriptsBox.highlightLabel;
local testLabel = scriptsBox.testLabel;
local remotesFrame = mainFrame.remotesFrame;
local remotesScrollingFrame = remotesFrame.remotesScrollingFrame;
local clearBtn = mainFrame.clearBtn;
local copyBtn = mainFrame.copyBtn;
local copyRemBtn = mainFrame.copyRemBtn
local copyScrBtn = mainFrame.copyScrBtn;
local currentButton;
local dlogs, logs = {}, {};
local syntaxHighlight, transformPath, dumpTable, ValueToReadable;
local textYSize = scriptsBox.TextSize;
dexSpy.Enabled = false;
dexSpy.Parent = coregui;

local function draggable(obj)
	spawn(function()
		local dragging = false;
		local draggableToggle;
		local draggableInput;
		local draggableStart;

		obj.topbarFrame.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true;
				draggableStart = input.Position;
				startPos = obj.AbsolutePosition;
			end;
		end);
		
		obj.topbarFrame.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = false;
			end;
		end);
		
		UserInputService.InputChanged:Connect(function(input)
			if obj.Parent.Enabled and input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
				local res = obj.Parent.AbsoluteSize;
				obj.Position = UDim2.new(0, startPos.X + (input.Position.X - draggableStart.X), 0, startPos.Y + (input.Position.Y - draggableStart.Y));
			end;
		end);
	end);
end;

do --// UI Setup
	draggable(mainFrame);
	
	local keywords = {
        {["Keyword"] = "print", ["Color"] = Color3.fromRGB(123, 216, 143)};
        {["Keyword"] = "warn", ["Color"] = Color3.fromRGB(123, 216, 143)};
        {["Keyword"] = "FireServer", ["Color"] = Color3.fromRGB(123, 216, 143)};
        {["Keyword"] = "InvokeServer", ["Color"] = Color3.fromRGB(123, 216, 143)};
        {["Keyword"] = "game", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "for", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "and", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "or", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "local", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "if", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "then", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "do", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "while", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "repeat", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "until", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "end", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "function", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "return", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "break", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "else", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "elseif", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "require", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "script", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "loadstring", ["Color"] = Color3.fromRGB(123, 216, 143)};
        {["Keyword"] = "GetService", ["Color"] = Color3.fromRGB(123, 216, 143)};
        {["Keyword"] = "self", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "Ray", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "Color3", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "fromRGB", ["Color"] = Color3.fromRGB(123, 216, 143)};
        {["Keyword"] = "new", ["Color"] = Color3.fromRGB(123, 216, 143)};
        {["Keyword"] = "in", ["Color"] = Color3.fromRGB(252, 97, 141)};
        {["Keyword"] = "(", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = ")", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "{", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "}", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "[", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "]", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "+", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "-", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "*", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "/", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "%", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "^", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "=", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = ",", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "<", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = ">", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = ";", ["Color"] = Color3.fromRGB(252, 97, 141), ["Independent"] = true};
        {["Keyword"] = "true", ["Color"] = Color3.fromRGB(122, 114, 185)};
        {["Keyword"] = "false", ["Color"] = Color3.fromRGB(122, 114, 185)};
        {["Keyword"] = "nil", ["Color"] = Color3.fromRGB(122, 114, 185)};
    };

    function syntaxHighlight() [nonamecall]
        setthreadcontext(6);
        local text = scriptsBox.Text;
        local pos = 0;
        local newLine = 0;
        local newLinePos = 0;
        local inString = false;
		local inComment = false;
		local blacklistedNumberPos;
        for i, v in pairs(scriptsBox:GetChildren()) do
            if v.Name == "highlightLabel" then
                v:Destroy();
            end;
        end;
        text:gsub(".", function(char)
            for i, v in pairs(keywords) do
                if not inString and not inComment and char == v["Keyword"]:sub(1, 1) and text:sub(pos + 1, pos + #v["Keyword"]) == v["Keyword"] then
                    if not v["Independent"] and not text:sub(pos, pos):match("%w") and not text:sub((pos + #v["Keyword"]) + 1, (pos + #v["Keyword"]) + 1):match("%w") then
                        local pastText = text:sub(newLinePos, pos);
                        local testLabel = testLabel:Clone();
                        testLabel.Parent = coregui;
                        testLabel.Text = pastText;
                        local xPos = testLabel.TextBounds.X;
                        testLabel:Destroy();
                        local highlightLabel = highlightLabel:Clone();
                        highlightLabel.Name = "highlightLabel";
                        highlightLabel.TextColor3 = v["Color"];
                        highlightLabel.Text = v["Keyword"];
                        highlightLabel.Position = UDim2.new(0, xPos, 0, newLine * textYSize);
                        highlightLabel.Parent = scriptsBox;
                    elseif v["Independent"] then
                        local pastText = text:sub(newLinePos, pos);
                        local testLabel = testLabel:Clone();
                        testLabel.Parent = coregui;
                        testLabel.Text = pastText;
                        local xPos = testLabel.TextBounds.X;
                        testLabel:Destroy();
                        local highlightLabel = highlightLabel:Clone();
                        highlightLabel.Name = "highlightLabel";
                        highlightLabel.TextColor3 = v["Color"];
                        highlightLabel.Text = v["Keyword"];
                        highlightLabel.Position = UDim2.new(0, xPos, 0, newLine * textYSize);
                        highlightLabel.Parent = scriptsBox;
                    end;
                end;
            end;
            if not inString and not inComment and tonumber(char) and not text:sub(pos + 2, pos + 2):match("%a") then
                if not text:sub(pos, pos):match("%a") and pos ~= blacklistedNumberPos then
                    local pastText = text:sub(newLinePos, pos);
                    local testLabel = testLabel:Clone();
                    testLabel.Parent = coregui;
                    testLabel.Text = pastText;
                    local xPos = testLabel.TextBounds.X;
                    testLabel:Destroy();
                    local highlightLabel = highlightLabel:Clone();
                    highlightLabel.Name = "highlightLabel";
                    highlightLabel.TextColor3 = Color3.fromRGB(122, 114, 185);
                    highlightLabel.Text = char;
                    highlightLabel.Position = UDim2.new(0, xPos, 0, newLine * textYSize);
                    highlightLabel.Parent = scriptsBox;
                else
                    blacklistedNumberPos = pos + 1;
                end;
            elseif char == '"' and not inComment then
                inString = not inString;
                local pastText = text:sub(newLinePos, pos);
                local testLabel = testLabel:Clone();
                testLabel.Parent = coregui;
                testLabel.Text = pastText;
                local xPos = testLabel.TextBounds.X;
                testLabel:Destroy();
                local highlightLabel = highlightLabel:Clone();
                highlightLabel.Name = "highlightLabel";
                highlightLabel.TextColor3 = Color3.fromRGB(243, 221, 99);
                highlightLabel.Text = char;
                highlightLabel.Position = UDim2.new(0, xPos, 0, newLine * textYSize);
                highlightLabel.Parent = scriptsBox;
            elseif char == "'" and not inComment then
                inString = not inString;
                local pastText = text:sub(newLinePos, pos);
                local testLabel = testLabel:Clone();
                testLabel.Parent = coregui;
                testLabel.Text = pastText;
                local xPos = testLabel.TextBounds.X;
                testLabel:Destroy();
                local highlightLabel = highlightLabel:Clone();
                highlightLabel.Name = "highlightLabel";
                highlightLabel.TextColor3 = Color3.fromRGB(243, 221, 99);
                highlightLabel.Text = char;
                highlightLabel.Position = UDim2.new(0, xPos, 0, newLine * textYSize);
                highlightLabel.Parent = scriptsBox;
            elseif char == "-" and text:sub(pos + 2, pos + 2) == "-" and not inString then
                inComment = true;
                local pastText = text:sub(newLinePos, pos);
                local testLabel = testLabel:Clone();
                testLabel.Parent = coregui;
                testLabel.Text = pastText;
                local xPos = testLabel.TextBounds.X;
                testLabel:Destroy();
                local highlightLabel = highlightLabel:Clone();
                highlightLabel.Name = "highlightLabel";
                highlightLabel.TextColor3 = Color3.fromRGB(105, 103, 108);
                highlightLabel.Text = char;
                highlightLabel.Position = UDim2.new(0, xPos, 0, newLine * textYSize);
                highlightLabel.Parent = scriptsBox;
            elseif char == "\n" then
                inComment = false;
                newLinePos = pos + 1;
                newLine = newLine + 1;
            else
                if inString then
                    local pastText = text:sub(newLinePos, pos);
                    local testLabel = testLabel:Clone();
                    testLabel.Parent = coregui;
                    testLabel.Text = pastText;
                    local xPos = testLabel.TextBounds.X;
                    testLabel:Destroy();
                    local highlightLabel = highlightLabel:Clone();
                    highlightLabel.Name = "highlightLabel";
                    highlightLabel.TextColor3 = Color3.fromRGB(243, 221, 99);
                    highlightLabel.Text = char;
                    highlightLabel.Position = UDim2.new(0, xPos, 0, newLine * textYSize);
                    highlightLabel.Parent = scriptsBox;
                elseif inComment then
                    local pastText = text:sub(newLinePos, pos);
                    local testLabel = testLabel:Clone();
                    testLabel.Parent = coregui;
                    testLabel.Text = pastText;
                    local xPos = testLabel.TextBounds.X;
                    testLabel:Destroy();
                    local highlightLabel = highlightLabel:Clone();
                    highlightLabel.Name = "highlightLabel";
                    highlightLabel.TextColor3 = Color3.fromRGB(105, 103, 108);
                    highlightLabel.Text = char;
                    highlightLabel.Position = UDim2.new(0, xPos, 0, newLine * textYSize);
                    highlightLabel.Parent = scriptsBox;
                end;
            end;
            pos = pos + 1;
        end);
    end;

    local buttons = {
        ["copyBtn"] = function() if currentButton then setclipboard(logs[currentButton]["Loading Script"]) end end,
        ["clearBtn"] = function() logs = {}; for i, v in pairs(remotesScrollingFrame:GetChildren()) do if not v:IsA("UIListLayout") then v:Destroy(); end; end; remotesScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0); currentButton = nil; end,
        ["exitBtn"] = function() currentRemote = nil; mainFrame:TweenSize(UDim2.new(0, 565, 0, 28), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25); wait(0.25); mainFrame:TweenSize(UDim2.new(0, 0, 0, 28), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25); wait(0.25); dexSpy.Enabled = false; mainFrame.Size = UDim2.new(0, 565, 0, 348); end,
        ["miniBtn"] = function()
            if mainFrame.Size ~= UDim2.new(0, 565, 0, 28) then
                mainFrame:TweenSize(UDim2.new(0, 565, 0, 28), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25, true);
            else
                mainFrame:TweenSize(UDim2.new(0, 565, 0, 348), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25, true);
            end;
        end,
        ["copyRemBtn"] = function() if currentButton then setclipboard(transformPath(logs[currentButton]["Remote"]:GetFullName())); end; end,
        ["copyScrBtn"] = function() if currentButton then setclipboard(transformPath(logs[currentButton]["Calling Script"]:GetFullName())); end; end
    };

    for i, v in pairs(mainFrame:GetDescendants()) do
        if buttons[v.Name] then
            v.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    tweenService:Create(v, TweenInfo.new(0.1), {ImageTransparency = 0}):Play();
                end;
            end);
            v.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    tweenService:Create(v, TweenInfo.new(0.1 ), {ImageTransparency = 1}):Play();
                end;
            end);
            v.MouseButton1Click:Connect(buttons[v.Name]);
        end;
    end;

    remotesScrollingFrame.ChildAdded:Connect(function(child)
        local xBounds = child.remoteLabel.TextBounds.X;
        local canSize = remotesScrollingFrame.CanvasSize
        if xBounds >  canSize.X.Offset then
            remotesScrollingFrame.CanvasSize = UDim2.new(0, xBounds+40, 0, (#remotesScrollingFrame:GetChildren() - 1) * 24);
            return
        end;
        remotesScrollingFrame.CanvasSize = UDim2.new(0, canSize.X.Offset, 0, (#remotesScrollingFrame:GetChildren() - 1) * 24);
    end);
end;

do --// Extra Functions (From Hydroxide)
    transformPath = function(path) [nonamecall]
        local split = path:split('.');
        local result = "";
        local name = localPlayer.Name;
        
        if #split == 1 and not game:FindFirstChild(split[1]) then
            return split[1] .. " --[[ Parent is \"nil\" or object is destroyed ]]";
        end;

        if pcall(game.GetService, game, split[1]) then
            split[1] = "GetService(\"" .. split[1] .. "\")";
        end;
        
        for i,v in pairs(split) do
            if (v:sub(1, 1):match("%A") or v:find("%W")) and not v:find("GetService") then
                result = result:sub(1, result:len());
                v = "[\"" .. v .. "\"]";
            elseif v:find("GetService") then
                v = ':' .. v;
            else
                v = '.' .. v;
            end;
            
            result = result .. v;
        end;
        
        result = result:gsub("GetService(\"Players\")." .. name, "GetService(\"Players\").LocalPlayer");
        result = result:gsub("GetService(\"Players\")[\"" .. name .. "\"]", "GetService(\"Players\").LocalPlayer");

        return "game" .. result;
    end;

    dumpTable = function(t) [nonamecall]
        local result = "{";

        for i, v in pairs(t) do
            local class = typeof(index)

            if class == "table" then
                result = result .. '[' .. dumpTable(index) .. ']'
            elseif class == "string" then
                if index:find("%A") then
                    result = result .. "[\"" .. index .. "\"]"
                else
                    result = result .. index
                end
            elseif class == "number" then
            elseif class == "Instance" then
                result = result .. '[' ..  transformPath(index:GetFullName()) .. ']';
            elseif class ~= "nil" then
                result = result .. tostring(index);
            end;
            
            if class ~= "number" and class ~= "nil" then
                result = result .. " = ";
            end;

            result = result ..   ValueToReadable(v) .. ', ';
        end;

        if result:sub(result:len() - 1, result:len()) == ", " then
            result = result:sub(1, result:len() - 2);
        end;

        return result .. "}";
    end;

    ValueToReadable = function(value) [nonamecall]
        local result = "";
        local ttype = typeof(value);

        if ttype == "table" then
            result = result .. dumpTable(value);
        elseif ttype == "string" then
            result = result .. '"' .. value .. '"';
        elseif ttype == "Instance" then
            result = result ..  transformPath(value:GetFullName());
        elseif ttype == "Vector3" then
            result = result .. "Vector3.new(" .. tostring(value) .. ")";
        elseif ttype == "CFrame" then
            result = result .. "CFrame.new(" .. tostring(value) .. ")";
        elseif ttype == "Color3" then
            result = result .. "Color3.new(" .. tostring(value) .. ")";
        elseif ttype == "Ray" then
            local split = tostring(value):split('}, ')
            local origin = split[1]:gsub('{', "Vector3.new("):gsub('}', ')');
            local direction = split[2]:gsub('{', "Vector3.new("):gsub('}', ')');
            result = result .. "Ray.new(" .. origin .. "), " .. direction .. ')';
        elseif ttype == "ColorSequence" then
            result = result .. "ColorSequence.new(" .. dumpTable(v.Keypoints) .. ')';
        elseif ttype == "ColorSequenceKeypoint" then
            result = result .. "ColorSequenceKeypoint.new(" .. value.Time .. ", Color3.new(" .. tostring(value.Value) .. "))";
        else
            if type(value) == "userdata" then
                
            end;
            
            result = result .. tostring(value);
        end;

        return result;
    end;
end;

local function saveData(button, remote, callingScript, ...) [nonamecall]
	local args = {...};
	local callerScript = "";
    local localArgs = {};
    
	for i,v in pairs(args) do
		table.insert(localArgs, "Sentinel" .. i);
		callerScript = callerScript .. "local Sentinel" .. i .. " = " .. ValueToReadable(v) .. "\n";
    end;
    
    callerScript = callerScript .. transformPath(remote:GetFullName()) .. ":" .. (remote:IsA("RemoteEvent") and "FireServer" or "InvokeServer") .. "(" .. table.concat(localArgs, ",") .. ")";
    
	local data = {
		["Remote"] = remote,
		["Calling Script"] = callingScript,
		["Loading Script"] = callerScript
    };
    
	logs[button] = data;
end;

local function log(remote, ...) [nonamecall]
	setthreadcontext(6);
	local remoteButton;
	if remote:IsA("RemoteEvent") then
		remoteButton = remoteEvent:Clone();
	elseif remote:IsA("RemoteFunction") then
		remoteButton = remoteFunction:Clone();
	end
	remoteButton.remoteLabel.Text = remote.Name;
    remoteButton.Parent = remotesScrollingFrame;
	saveData(remoteButton, remote, getfenv(3).script, ...);
	remoteButton.MouseEnter:Connect(function()
		setthreadcontext(6);
		if remoteButton ~= currentButton then
			tweenService:Create(remoteButton, TweenInfo.new(0.1), {BackgroundTransparency = 0}):Play();
		end;
	end);
	remoteButton.MouseLeave:Connect(function()
		setthreadcontext(6);
		if remoteButton ~= currentButton then
			tweenService:Create(remoteButton, TweenInfo.new(0.1), {BackgroundTransparency = 1}):Play();
		end;
	end);
    remoteButton.MouseButton1Click:Connect(function()
        setthreadcontext(6);
		if currentButton then currentButton.BackgroundTransparency = 1; end
        currentButton = remoteButton;
        currentButton.BackgroundColor3 = Color3.fromRGB(140, 30, 49); 
		scriptsBox.Text = logs[remoteButton]["Loading Script"];
		syntaxHighlight();
		local XTBounds = scriptsBox.TextBounds.X;
		local YTBounds = scriptsBox.TextBounds.Y;
		scriptsBox.Size = UDim2.new(0, XTBounds + 2, 0, YTBounds + 2);
		local newXCanvas = XTBounds > scriptsScrollingFrame.Size.X.Offset and (XTBounds + 2.5) or 0;
		local newYCanvas = YTBounds > scriptsScrollingFrame.Size.Y.Offset and (YTBounds + 2.5) or 0;
        scriptsScrollingFrame.CanvasSize = UDim2.new(0, newXCanvas, 0, newYCanvas);
	end);
	setthreadcontext(2);
end;

local mt = getrawmetatable(game);
local oldNamecall = mt.__namecall;
local currentRemote;
setreadonly(mt, false);

mt.__namecall = newcclosure(function(obj, ...) [nonamecall]
	local method = getnamecallmethod();
    if not checkcaller() and tostring(method) == "FireServer" or tostring(method) == "InvokeServer" then
        if obj == currentRemote then
            log(obj, ...);
        end;
	end;
    
    return oldNamecall(obj, ...);
end);

setreadonly(mt, true);

local oldFireServer;
local oldInvokeServer;

oldFireServer = hookfunction(Instance.new("RemoteEvent").FireServer, function(remote, ...)
    if not checkcaller() and remote == currentRemote then
		log(remote, ...);
    end;
    
    return oldFireServer(remote, ...);
end);

oldInvokeServer = hookfunction(Instance.new("RemoteFunction").InvokeServer, function(remote, ...)
    if not checkcaller() and remote == currentRemote then
		log(remote, ...);
    end;
    
    return oldInvokeServer(remote, ...);
end);

local scriptDumper = game:GetObjects("rbxassetid://4544004447")[1];
local localScript = game:GetObjects("rbxassetid://4544003591")[1];
local moduleScript = game:GetObjects("rbxassetid://4544002916")[1];
localScript.BackgroundColor3 = Color3.fromRGB(140, 30, 49); 
localScript.AutoButtonColor = false
moduleScript.BackgroundColor3 = Color3.fromRGB(140, 30, 49); 
moduleScript.AutoButtonColor = false
local mainFrame = scriptDumper.mainFrame;
local topbarFrame = mainFrame.topbarFrame;
local exitBtn = topbarFrame.exitBtn;
local miniBtn = topbarFrame.miniBtn;
local sentinelLogo = topbarFrame.sentinelLogo;
local scriptsFrame = mainFrame.scriptsFrame;
local scriptsScrollingFrame = scriptsFrame.scriptsScrollingFrame;
local dumpsFrame = mainFrame.dumpsFrame;
local dumpsScrollingFrame = dumpsFrame.dumpsScrollingFrame;
local dumpsBox = dumpsScrollingFrame.dumpsBox;
local clearBtn = mainFrame.clearBtn;
local copyBtn = mainFrame.copyBtn;
local currentButton;
scriptDumper.Enabled = false;
scriptDumper.Parent = coregui;

do --// UI Setup
    draggable(mainFrame);

    local buttons = {
        ["copyBtn"] = function() if currentButton then setclipboard(dlogs[currentButton]["Loading Dump"]) end end,
        ["clearBtn"] = function() dlogs = {}; for i, v in pairs(scriptsScrollingFrame:GetChildren()) do if not v:IsA("UIListLayout") then v:Destroy(); end; end; remotesScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0); currentButton = nil; end,
        ["exitBtn"] = function() mainFrame:TweenSize(UDim2.new(0, 565, 0, 28), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25); wait(0.25); mainFrame:TweenSize(UDim2.new(0, 0, 0, 28), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25); wait(0.25); scriptDumper.Enabled = false; mainFrame.Size = UDim2.new(0, 565, 0, 348); end,
        ["miniBtn"] = function()
            if mainFrame.Size ~= UDim2.new(0, 565, 0, 28) then
                mainFrame:TweenSize(UDim2.new(0, 565, 0, 28), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25, true);
            else
                mainFrame:TweenSize(UDim2.new(0, 565, 0, 348), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25, true);
            end;
        end
    };

    for i, v in pairs(mainFrame:GetDescendants()) do
        if buttons[v.Name] then
            v.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    tweenService:Create(v, TweenInfo.new(0.1), {ImageTransparency = 0}):Play();
                end;
            end);
            v.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    tweenService:Create(v, TweenInfo.new(0.1), {ImageTransparency = 1}):Play();
                end;
            end);
            v.MouseButton1Click:Connect(buttons[v.Name]);
        end;
    end;

    scriptsScrollingFrame.ChildAdded:Connect(function(child)
        if scriptsScrollingFrame.CanvasSize.X.Offset ~= 150 then
            scriptsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, (#scriptsScrollingFrame:GetChildren() - 1) * 24);
        else
            scriptsScrollingFrame.CanvasSize = UDim2.new(0, 150, 0, (#scriptsScrollingFrame:GetChildren() - 1) * 24);
        end;
        if child.scriptLabel.TextBounds.X > (scriptsScrollingFrame.Size.X.Offset - 20) then
            scriptsScrollingFrame.CanvasSize = UDim2.new(0, 150, 0, (#scriptsScrollingFrame:GetChildren() - 1) * 24);
        end;
    end);
end;

local function saveDData(button, script) [nonamecall]
    local function dumpScript(script)
		local str = "";

		for i, func in pairs(getgc()) do
			if type(func) == "function" and getfenv(func).script == script then
				str = str..("-"):rep(#tostring(func)).."\n\n"..tostring(func).." :\n";
				str = str.."Constants :\n";
				for idx, constant in pairs(debug.getconstants(func)) do
					str = str.."\t["..idx.."] : "..ValueToReadable(constant).."\n";
				end
				str = str.."Upvalues :\n";
				for idx, upval in pairs(debug.getupvalues(func)) do
					str = str.."\t["..idx.."] : "..ValueToReadable(upval).."\n";
				end
				str = str.."\n"..("-"):rep(#tostring(func)).."\n"
			end
		end

		return str;
	end;
    
	local data = {
		["Script"] = script,
		["Loading Dump"] = dumpScript(script)
    };
    
	dlogs[button] = data;
end;

local function log(script) [nonamecall]
	local scriptButton;
	if script:IsA("LocalScript") then
		scriptButton = localScript:Clone();
	elseif script:IsA("ModuleScript") then
		scriptButton = moduleScript:Clone();
	end;
	scriptButton.scriptLabel.Text = script.Name;
    scriptButton.Parent = scriptsScrollingFrame;
	saveDData(scriptButton, script);
	scriptButton.MouseEnter:Connect(function()
		if scriptButton ~= currentButton then
			tweenService:Create(scriptButton, TweenInfo.new(0.1), {BackgroundTransparency = 0}):Play();
		end;
	end);
	scriptButton.MouseLeave:Connect(function()
		if scriptButton ~= currentButton then
			tweenService:Create(scriptButton, TweenInfo.new(0.1), {BackgroundTransparency = 1}):Play();
		end;
	end);
    scriptButton.MouseButton1Click:Connect(function()
		currentButton = scriptButton;
		dumpsBox.Text = dlogs[scriptButton]["Loading Dump"];
		local XTBounds = dumpsBox.TextBounds.X;
		local YTBounds = dumpsBox.TextBounds.Y;
		dumpsBox.Size = UDim2.new(0, XTBounds + 2, 0, YTBounds + 2);
		local newXCanvas = XTBounds > dumpsScrollingFrame.Size.X.Offset and (XTBounds + 2.5) or 0;
		local newYCanvas = YTBounds > dumpsScrollingFrame.Size.Y.Offset and (YTBounds + 2.5) or 0;
        dumpsScrollingFrame.CanvasSize = UDim2.new(0, newXCanvas, 0, newYCanvas);
	end);
end;

CreateGui = function()
local ROBLOX = Instance.new("ScreenGui")
local PropertiesFrame = Instance.new("Frame")
local Header = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local ExplorerPanel = Instance.new("Frame")
local SideMenu = Instance.new("Frame")
local Toggle = Instance.new("TextButton")
local Title = Instance.new("TextLabel")
local Version = Instance.new("TextLabel")
local Slant = Instance.new("ImageLabel")
local Main = Instance.new("Frame")
local SlideOut = Instance.new("Frame")
local SlideFrame = Instance.new("Frame")
local Explorer = Instance.new("TextButton")
local Icon = Instance.new("ImageLabel")
local SaveMap = Instance.new("TextButton")
local Icon_2 = Instance.new("ImageLabel")
local Settings = Instance.new("TextButton")
local Icon_3 = Instance.new("ImageLabel")
local Icon_4 = Instance.new("ImageLabel")
local About = Instance.new("TextButton")
local Icon_5 = Instance.new("ImageLabel")
local OpenScriptEditor = Instance.new("TextButton")
local Icon_6 = Instance.new("ImageLabel")
local Toggle_2 = Instance.new("TextButton")
local SettingsPanel = Instance.new("Frame")
local Header_2 = Instance.new("Frame")
local TextLabel_2 = Instance.new("TextLabel")
local SettingTemplate = Instance.new("Frame")
local SName = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local Change = Instance.new("TextButton")
local OnBar = Instance.new("TextLabel")
local Bar = Instance.new("TextLabel")
local SettingList = Instance.new("Frame")
local SaveInstance = Instance.new("Frame")
local Title_2 = Instance.new("TextLabel")
local MainWindow = Instance.new("Frame")
local Save = Instance.new("TextButton")
local Desc = Instance.new("TextLabel")
local Cancel = Instance.new("TextButton")
local FileName = Instance.new("TextBox")
local SaveObjects = Instance.new("TextButton")
local enabled = Instance.new("TextLabel")
local Desc2 = Instance.new("TextLabel")
local Confirmation = Instance.new("Frame")
local Title_3 = Instance.new("TextLabel")
local MainWindow_2 = Instance.new("Frame")
local Yes = Instance.new("TextButton")
local Desc_2 = Instance.new("TextLabel")
local No = Instance.new("TextButton")
local Caution = Instance.new("Frame")
local Title_4 = Instance.new("TextLabel")
local MainWindow_3 = Instance.new("Frame")
local Desc_3 = Instance.new("TextLabel")
local Ok = Instance.new("TextButton")
local CallRemote = Instance.new("Frame")
local Title_5 = Instance.new("TextLabel")
local MainWindow_4 = Instance.new("Frame")
local Desc_4 = Instance.new("TextLabel")
local Arguments = Instance.new("ScrollingFrame")
local DisplayReturned = Instance.new("TextButton")
local enabled_2 = Instance.new("TextLabel")
local Desc2_2 = Instance.new("TextLabel")
local Add = Instance.new("TextButton")
local Subtract = Instance.new("TextButton")
local ArgumentTemplate = Instance.new("Frame")
local Type = Instance.new("TextButton")
local Value = Instance.new("TextBox")
local Cancel_2 = Instance.new("TextButton")
local Ok_2 = Instance.new("TextButton")
local TableCaution = Instance.new("Frame")
local MainWindow_5 = Instance.new("Frame")
local Ok_3 = Instance.new("TextButton")
local TableResults = Instance.new("ScrollingFrame")
local TableTemplate = Instance.new("Frame")
local Type_2 = Instance.new("TextLabel")
local Value_2 = Instance.new("TextLabel")
local Title_6 = Instance.new("TextLabel")
local ScriptEditor = Instance.new("Frame")
local Title_7 = Instance.new("TextLabel")
local Cover = Instance.new("Frame")
local EditorGrid = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local ScriptBarLeft = Instance.new("ImageButton")
local ArrowGraphic = Instance.new("Frame")
local Graphic = Instance.new("Frame")
local Graphic_2 = Instance.new("Frame")
local Graphic_3 = Instance.new("Frame")
local Graphic_4 = Instance.new("Frame")
local ScriptBarRight = Instance.new("ImageButton")
local ArrowGraphic_2 = Instance.new("Frame")
local Graphic_5 = Instance.new("Frame")
local Graphic_6 = Instance.new("Frame")
local Graphic_7 = Instance.new("Frame")
local Graphic_8 = Instance.new("Frame")
local Clipboard = Instance.new("TextButton")
local SaveScript = Instance.new("TextButton")
local ScriptBar = Instance.new("Frame")
local Entry = Instance.new("Frame")
local Button = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local Close_2 = Instance.new("TextButton")
local IntroFrame = Instance.new("Frame")
local Main_2 = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local Title_8 = Instance.new("ImageLabel")
local Title_9 = Instance.new("ImageLabel")
local Version_2 = Instance.new("TextLabel")
local Creator = Instance.new("TextLabel")
local BG = Instance.new("ImageLabel")
local Slant_2 = Instance.new("Frame")
local ImageLabel_2 = Instance.new("ImageLabel")
local SaveMapWindow = Instance.new("Frame")
local Header_3 = Instance.new("Frame")
local TextLabel_3 = Instance.new("TextLabel")
local MapSettings = Instance.new("Frame")
local Terrain = Instance.new("Frame")
local SName_2 = Instance.new("TextLabel")
local Status_2 = Instance.new("TextLabel")
local Change_2 = Instance.new("TextButton")
local OnBar_2 = Instance.new("TextLabel")
local Bar_2 = Instance.new("TextLabel")
local Lighting = Instance.new("Frame")
local SName_3 = Instance.new("TextLabel")
local Status_3 = Instance.new("TextLabel")
local Change_3 = Instance.new("TextButton")
local OnBar_3 = Instance.new("TextLabel")
local Bar_3 = Instance.new("TextLabel")
local CameraInstances = Instance.new("Frame")
local SName_4 = Instance.new("TextLabel")
local Status_4 = Instance.new("TextLabel")
local Change_4 = Instance.new("TextButton")
local OnBar_4 = Instance.new("TextLabel")
local Bar_4 = Instance.new("TextLabel")
local Scripts = Instance.new("Frame")
local SName_5 = Instance.new("TextLabel")
local Status_5 = Instance.new("TextLabel")
local Change_5 = Instance.new("TextButton")
local OnBar_5 = Instance.new("TextLabel")
local Bar_5 = Instance.new("TextLabel")
local ToSave = Instance.new("TextLabel")
local CopyList = Instance.new("Frame")
local Bottom = Instance.new("Frame")
local TextLabel_4 = Instance.new("TextLabel")
local Save_2 = Instance.new("TextButton")
local FileName_2 = Instance.new("TextBox")
local Entry_2 = Instance.new("Frame")
local Change_6 = Instance.new("TextButton")
local enabled_3 = Instance.new("TextLabel")
local Info = Instance.new("TextLabel")
local RemoteDebugWindow = Instance.new("Frame")
local Header_4 = Instance.new("Frame")
local TextLabel_5 = Instance.new("TextLabel")
local AboutWindow = Instance.new("Frame")
local Header_5 = Instance.new("Frame")
local TextLabel_6 = Instance.new("TextLabel")
local Desc_6 = Instance.new("TextLabel")

ROBLOX.Name = RandomCharacters(16, 64)

PropertiesFrame.Name = "PropertiesFrame"
PropertiesFrame.Parent = ROBLOX
PropertiesFrame.Active = true
PropertiesFrame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
PropertiesFrame.Transparency = 0.2
PropertiesFrame.BorderColor3 = Color3.fromRGB(191, 191, 191)
PropertiesFrame.BorderSizePixel = 0
PropertiesFrame.Position = UDim2.new(1, 0, 0.5, 36)
PropertiesFrame.Size = UDim2.new(0, 300, 0.5, -36)

Header.Name = "Header"
Header.Parent = PropertiesFrame
Header.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Header.BorderColor3 = Color3.fromRGB(149, 149, 149)
Header.BorderSizePixel = 0
Header.Position = UDim2.new(0, 0, 0, -35)
Header.Size = UDim2.new(1, 0, 0, 35)

TextLabel.Parent = Header
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 4, 0, 0)
TextLabel.Size = UDim2.new(1, -4, 0.5, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Properties"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

TextBox.Parent = Header
TextBox.BackgroundTransparency = 0.8
TextBox.Position = UDim2.new(0, 4, 0.5, 0)
TextBox.Size = UDim2.new(1, -8, 0.5, -3)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Search Properties"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14
TextBox.TextXAlignment = Enum.TextXAlignment.Left

ExplorerPanel.Name = "ExplorerPanel"
ExplorerPanel.Parent = ROBLOX
ExplorerPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ExplorerPanel.BorderColor3 = Color3.fromRGB(191, 191, 191)
ExplorerPanel.BorderSizePixel = 0
ExplorerPanel.Position = UDim2.new(1, 0, 0, 1)
ExplorerPanel.Size = UDim2.new(0, 300, 0.5, 0)
ExplorerPanel.Transparency = 0.2

SideMenu.Name = "SideMenu"
SideMenu.Parent = ROBLOX
SideMenu.BackgroundColor3 = Color3.fromRGB(233, 233, 233)
SideMenu.BackgroundTransparency = 1
SideMenu.BorderColor3 = Color3.fromRGB(149, 149, 149)
SideMenu.BorderSizePixel = 0
SideMenu.Position = UDim2.new(1, -330, 0, 0)
SideMenu.Size = UDim2.new(0, 30, 0, 180)
SideMenu.Visible = false
SideMenu.ZIndex = 2

Toggle.Name = "Toggle"
Toggle.Parent = SideMenu
Toggle.Active = false
Toggle.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0, 0, 0, 60)
Toggle.Size = UDim2.new(0, 30, 0, 30)
Toggle.AutoButtonColor = false
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = ">"
Toggle.TextColor3 = Color3.fromRGB(197, 28, 70)
Toggle.TextSize = 24
Toggle.TextTransparency = 1
Toggle.TextWrapped = true



Title.Name = "Title"
Title.Parent = SideMenu
Title.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 30, 0, 20)
Title.ZIndex = 2
Title.Font = Enum.Font.SourceSansBold
Title.Text = "DEX"
Title.TextColor3 = Color3.fromRGB(197, 28, 70)
Title.TextSize = 14
Title.TextWrapped = true

Version.Name = "Version"
Version.Parent = SideMenu
Version.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Version.BackgroundTransparency = 1
Version.Position = UDim2.new(0, 0, 0, 15)
Version.Size = UDim2.new(0, 30, 0, 20)
Version.ZIndex = 2
Version.Font = Enum.Font.SourceSansBold
Version.Text = "V2.0.1"
Version.TextColor3 = Color3.fromRGB(197, 28, 70)
Version.TextSize = 12
Version.TextWrapped = true

Slant.Name = "Slant"
Slant.Parent = SideMenu
Slant.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Slant.BackgroundTransparency = 1
Slant.Position = UDim2.new(0, 0, 0, 90)
Slant.Rotation = 180
Slant.Size = UDim2.new(0, 30, 0, 30)
Slant.ImageColor3 = Color3.fromRGB(43, 43, 43)
Slant.Image = "rbxassetid://474172996"

Main.Name = "Main"
Main.Parent = SideMenu
Main.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Main.BorderSizePixel = 0
Main.Size = UDim2.new(0, 30, 0, 30)

SlideOut.Name = "SlideOut"
SlideOut.Parent = SideMenu
SlideOut.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
SlideOut.BackgroundTransparency = 1
SlideOut.BorderSizePixel = 0
SlideOut.ClipsDescendants = true
SlideOut.Position = UDim2.new(0, 0, 0, 30)
SlideOut.Size = UDim2.new(0, 30, 0, 150)

SlideFrame.Name = "SlideFrame"
SlideFrame.Parent = SlideOut
SlideFrame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
SlideFrame.BorderSizePixel = 0
SlideFrame.Position = UDim2.new(0, 0, 0, -150)
SlideFrame.Size = UDim2.new(0, 30, 0, 150)

Explorer.Name = "Explorer"
Explorer.Parent = SlideFrame
Explorer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Explorer.BackgroundTransparency = 1
Explorer.BorderSizePixel = 0
Explorer.Position = UDim2.new(0, 0, 0, 90)
Explorer.Size = UDim2.new(0, 30, 0, 30)
Explorer.ZIndex = 2
Explorer.AutoButtonColor = false
Explorer.Font = Enum.Font.SourceSans
Explorer.Text = ""
Explorer.TextSize = 24

Icon.Name = "Icon"
Icon.Parent = Explorer
Icon.BackgroundColor3 = Color3.fromRGB(197, 28, 70)
Icon.BackgroundTransparency = 1
Icon.Position = UDim2.new(0, 5, 0, 5)
Icon.Size = UDim2.new(0, 20, 0, 20)
Icon.ZIndex = 2
Icon.Image = "rbxassetid://472635937"

SaveMap.Name = "SaveMap"
SaveMap.Parent = SlideFrame
SaveMap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SaveMap.BackgroundTransparency = 1
SaveMap.BorderSizePixel = 0
SaveMap.Position = UDim2.new(0, 0, 0, 60)
SaveMap.Size = UDim2.new(0, 30, 0, 30)
SaveMap.ZIndex = 2
SaveMap.AutoButtonColor = false
SaveMap.Font = Enum.Font.SourceSans
SaveMap.Text = ""
SaveMap.TextSize = 24

Icon_2.Name = "Icon"
Icon_2.Parent = SaveMap
Icon_2.BackgroundColor3 = Color3.fromRGB(197, 28, 70)
Icon_2.BackgroundTransparency = 1
Icon_2.Position = UDim2.new(0, 5, 0, 5)
Icon_2.Size = UDim2.new(0, 20, 0, 20)
Icon_2.ZIndex = 2
Icon_2.Image = "rbxassetid://472636337"

Settings.Name = "Settings"
Settings.Parent = SlideFrame
Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Settings.BackgroundTransparency = 1
Settings.BorderSizePixel = 0
Settings.Position = UDim2.new(0, 0, 0, 30)
Settings.Size = UDim2.new(0, 30, 0, 30)
Settings.ZIndex = 2
Settings.AutoButtonColor = false
Settings.Font = Enum.Font.SourceSans
Settings.Text = ""
Settings.TextSize = 24

Icon_3.Name = "Icon"
Icon_3.Parent = Settings
Icon_3.BackgroundColor3 = Color3.fromRGB(197, 28, 70)
Icon_3.ImageColor3 = Color3.fromRGB(197, 28, 70)
Icon_3.BackgroundTransparency = 1
Icon_3.Position = UDim2.new(0, 5, 0, 5)
Icon_3.Size = UDim2.new(0, 20, 0, 20)
Icon_3.ZIndex = 2
Icon_3.Image = "rbxassetid://472635774"

About.Name = "About"
About.Parent = SlideFrame
About.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
About.BackgroundTransparency = 1
About.BorderSizePixel = 0
About.Size = UDim2.new(0, 30, 0, 30)
About.ZIndex = 2
About.AutoButtonColor = false
About.Font = Enum.Font.SourceSans
About.Text = ""
About.TextSize = 24

Icon_5.Archivable = false
Icon_5.Name = "Icon"
Icon_5.Parent = About
Icon_5.BackgroundColor3 = Color3.fromRGB(197, 28, 70)
Icon_5.ImageColor3 = Color3.fromRGB(197, 28, 70)
Icon_5.BackgroundTransparency = 1
Icon_5.Position = UDim2.new(0, 5, 0, 5)
Icon_5.Size = UDim2.new(0, 20, 0, 20)
Icon_5.ZIndex = 2
Icon_5.Image = "rbxassetid://476354004"

OpenScriptEditor.Name = "OpenScriptEditor"
OpenScriptEditor.Parent = SideMenu
OpenScriptEditor.Active = false
OpenScriptEditor.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
OpenScriptEditor.BorderSizePixel = 0
OpenScriptEditor.Position = UDim2.new(0, 0, 0, 30)
OpenScriptEditor.Size = UDim2.new(0, 30, 0, 30)
OpenScriptEditor.ZIndex = 2
OpenScriptEditor.AutoButtonColor = false
OpenScriptEditor.Font = Enum.Font.SourceSans
OpenScriptEditor.Text = ""
OpenScriptEditor.TextSize = 24

Icon_6.Name = "Icon"
Icon_6.Parent = OpenScriptEditor
Icon_6.BackgroundColor3 = Color3.fromRGB(197, 28, 70)
Icon_6.ImageColor3 = Color3.fromRGB(197, 28, 70)
Icon_6.BackgroundTransparency = 1
Icon_6.Position = UDim2.new(0, 5, 0, 5)
Icon_6.Size = UDim2.new(0, 20, 0, 20)
Icon_6.ZIndex = 2
Icon_6.Image = "rbxassetid://475456048"
Icon_6.ImageTransparency = 1

Toggle_2.Name = "Toggle"
Toggle_2.Parent = ROBLOX
Toggle_2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Toggle_2.BorderColor3 = Color3.fromRGB(53, 53, 53)
Toggle_2.TextColor3 = Color3.fromRGB(197, 28, 70)
Toggle_2.Position = UDim2.new(1, 0, 0, 0)
Toggle_2.Size = UDim2.new(0, 30, 0, 30)
Toggle_2.Font = Enum.Font.SourceSans
Toggle_2.Text = "<"
Toggle_2.TextSize = 24

SettingsPanel.Name = "SettingsPanel"
SettingsPanel.Parent = ROBLOX
SettingsPanel.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
SettingsPanel.BorderColor3 = Color3.fromRGB(191, 191, 191)
SettingsPanel.BorderSizePixel = 0
SettingsPanel.Position = UDim2.new(1, 0, 0, 1)
SettingsPanel.Size = UDim2.new(0, 300, 1, 0)

Header_2.Name = "Header"
Header_2.Parent = SettingsPanel
Header_2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Header_2.BorderColor3 = Color3.fromRGB(30, 30, 30)
Header_2.Size = UDim2.new(1, 0, 0, 17)

TextLabel_2.Parent = Header_2
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.Position = UDim2.new(0, 4, 0, 0)
TextLabel_2.Size = UDim2.new(1, -4, 1, 0)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Settings"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 14
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

SettingTemplate.Name = "SettingTemplate"
SettingTemplate.Parent = SettingsPanel
SettingTemplate.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
SettingTemplate.BackgroundTransparency = 1
SettingTemplate.Position = UDim2.new(0, 0, 0, 18)
SettingTemplate.Size = UDim2.new(1, 0, 0, 60)
SettingTemplate.Visible = false

SName.Name = "SName"
SName.Parent = SettingTemplate
SName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SName.BackgroundTransparency = 1
SName.Position = UDim2.new(0, 10, 0, 0)
SName.Size = UDim2.new(1, -20, 0, 30)
SName.Font = Enum.Font.SourceSans
SName.Text = "SettingName"
SName.TextColor3 = Color3.fromRGB(255, 255, 255)
SName.TextSize = 18
SName.TextXAlignment = Enum.TextXAlignment.Left

Status.Name = "Status"
Status.Parent = SettingTemplate
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0, 60, 0, 30)
Status.Size = UDim2.new(0, 50, 0, 15)
Status.Font = Enum.Font.SourceSans
Status.Text = "Off"
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextSize = 18
Status.TextXAlignment = Enum.TextXAlignment.Left

Change.Name = "Change"
Change.Parent = SettingTemplate
Change.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
Change.BorderSizePixel = 0
Change.Position = UDim2.new(0, 10, 0, 30)
Change.Size = UDim2.new(0, 40, 0, 15)
Change.Font = Enum.Font.SourceSans
Change.Text = ""
Change.TextColor3 = Color3.fromRGB(255, 255, 255)
Change.TextSize = 14

OnBar.Name = "OnBar"
OnBar.Parent = Change
OnBar.BackgroundColor3 = Color3.fromRGB(197, 28, 70)
OnBar.BorderSizePixel = 0
OnBar.Size = UDim2.new(0, 0, 0, 15)
OnBar.Font = Enum.Font.SourceSans
OnBar.Text = ""
OnBar.TextColor3 = Color3.fromRGB(255, 255, 255)
OnBar.TextSize = 14

Bar.Name = "Bar"
Bar.Parent = Change
Bar.BackgroundColor3 = Color3.fromRGB(219, 47, 84)
Bar.BorderSizePixel = 0
Bar.ClipsDescendants = true
Bar.Position = UDim2.new(0, -2, 0, -2)
Bar.Size = UDim2.new(0, 10, 0, 19)
Bar.Font = Enum.Font.SourceSans
Bar.Text = ""
Bar.TextColor3 = Color3.fromRGB(255, 255, 255)
Bar.TextSize = 14

SettingList.Name = "SettingList"
SettingList.Parent = SettingsPanel
SettingList.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
SettingList.BackgroundTransparency = 1
SettingList.Position = UDim2.new(0, 0, 0, 17)
SettingList.Size = UDim2.new(1, 0, 1, -17)

SaveInstance.Name = "SaveInstance"
SaveInstance.Parent = ROBLOX
SaveInstance.Active = true
SaveInstance.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
SaveInstance.BorderColor3 = Color3.fromRGB(30, 30, 30)
dragger.new(SaveInstance)
SaveInstance.Position = UDim2.new(0.3, 0, 0.3, 0)
SaveInstance.Size = UDim2.new(0, 350, 0, 20)
SaveInstance.Visible = false
SaveInstance.ZIndex = 2

Title_2.Name = "Title"
Title_2.Parent = SaveInstance
Title_2.BackgroundTransparency = 1
Title_2.Size = UDim2.new(1, 0, 1, 0)
Title_2.ZIndex = 2
Title_2.Font = Enum.Font.SourceSans
Title_2.Text = "Save Instance"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 14
Title_2.TextXAlignment = Enum.TextXAlignment.Left

MainWindow.Name = "MainWindow"
MainWindow.Parent = SaveInstance
MainWindow.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
MainWindow.BackgroundTransparency = 0.1
MainWindow.BorderColor3 = Color3.fromRGB(30, 30, 30)
MainWindow.Size = UDim2.new(1, 0, 0, 200)

Save.Name = "Save"
Save.Parent = MainWindow
Save.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Save.BackgroundTransparency = 0.5
Save.BorderColor3 = Color3.fromRGB(40, 40, 40)
Save.Position = UDim2.new(0.075, 0, 1, -40)
Save.Size = UDim2.new(0.4, 0, 0, 30)
Save.Font = Enum.Font.SourceSans
Save.Text = "Save"
Save.TextColor3 = Color3.fromRGB(255, 255, 255)
Save.TextSize = 18

Desc.Name = "Desc"
Desc.Parent = MainWindow
Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Desc.BackgroundTransparency = 1
Desc.Position = UDim2.new(0, 0, 0, 20)
Desc.Size = UDim2.new(1, 0, 0, 40)
Desc.Font = Enum.Font.SourceSans
Desc.Text = "This will save an instance to your PC. Type in the name for your instance. (.rbxmx will be added automatically.)"
Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
Desc.TextSize = 14
Desc.TextWrapped = true

Cancel.Name = "Cancel"
Cancel.Parent = MainWindow
Cancel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Cancel.BackgroundTransparency = 0.5
Cancel.BorderColor3 = Color3.fromRGB(40, 40, 40)
Cancel.Position = UDim2.new(0.524, 0, 1, -40)
Cancel.Size = UDim2.new(0.4, 0, 0, 30)
Cancel.Font = Enum.Font.SourceSans
Cancel.Text = "Cancel"
Cancel.TextColor3 = Color3.fromRGB(255, 255, 255)
Cancel.TextSize = 18

FileName.Name = "FileName"
FileName.Parent = MainWindow
FileName.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FileName.BackgroundTransparency = 0.2
FileName.BorderColor3 = Color3.fromRGB(40, 40, 40)
FileName.Position = UDim2.new(0.075, 0, 0.4, 0)
FileName.Size = UDim2.new(0.85, 0, 0, 30)
FileName.Font = Enum.Font.SourceSans
FileName.Text = ""
FileName.TextColor3 = Color3.fromRGB(255, 255, 255)
FileName.TextSize = 18
FileName.TextXAlignment = Enum.TextXAlignment.Left

SaveObjects.Name = "SaveObjects"
SaveObjects.Parent = MainWindow
SaveObjects.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SaveObjects.BackgroundTransparency = 0.6
SaveObjects.BorderColor3 = Color3.fromRGB(40, 40, 40)
SaveObjects.Position = UDim2.new(0.075, 0, 0.625, 0)
SaveObjects.Size = UDim2.new(0, 20, 0, 20)
SaveObjects.ZIndex = 2
SaveObjects.Font = Enum.Font.SourceSans
SaveObjects.Text = ""
SaveObjects.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveObjects.TextSize = 18

enabled.Name = "enabled"
enabled.Parent = SaveObjects
enabled.BackgroundColor3 = Color3.fromRGB(96, 96, 96)
enabled.BackgroundTransparency = 0.4
enabled.BorderSizePixel = 0
enabled.Position = UDim2.new(0, 3, 0, 3)
enabled.Size = UDim2.new(0, 14, 0, 14)
enabled.Font = Enum.Font.SourceSans
enabled.Text = ""
enabled.TextSize = 14

Desc2.Name = "Desc2"
Desc2.Parent = MainWindow
Desc2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Desc2.BackgroundTransparency = 1
Desc2.Position = UDim2.new(0.075, 30, 0.625, 0)
Desc2.Size = UDim2.new(0.925, -30, 0, 20)
Desc2.Font = Enum.Font.SourceSans
Desc2.Text = "Save \"Object\" type values"
Desc2.TextColor3 = Color3.fromRGB(255, 255, 255)
Desc2.TextSize = 14
Desc2.TextXAlignment = Enum.TextXAlignment.Left

Confirmation.Name = "Confirmation"
Confirmation.Parent = ROBLOX
Confirmation.Active = true
Confirmation.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Confirmation.BorderColor3 = Color3.fromRGB(30, 30, 30)
dragger.new(Confirmation)
Confirmation.Position = UDim2.new(0.3, 0, 0.349, 0)
Confirmation.Size = UDim2.new(0, 350, 0, 20)
Confirmation.Visible = false
Confirmation.ZIndex = 3

Title_3.Name = "Title"
Title_3.Parent = Confirmation
Title_3.BackgroundTransparency = 1
Title_3.Size = UDim2.new(1, 0, 1, 0)
Title_3.ZIndex = 3
Title_3.Font = Enum.Font.SourceSans
Title_3.Text = "    Confirm"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 14
Title_3.TextXAlignment = Enum.TextXAlignment.Left

MainWindow_2.Name = "MainWindow"
MainWindow_2.Parent = Confirmation
MainWindow_2.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MainWindow_2.BackgroundTransparency = 0.1
MainWindow_2.BorderColor3 = Color3.fromRGB(40, 40, 40)
MainWindow_2.Size = UDim2.new(1, 0, 0, 150)
MainWindow_2.ZIndex = 2

Yes.Name = "Yes"
Yes.Parent = MainWindow_2
Yes.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
Yes.BackgroundTransparency = 0.5
Yes.BorderColor3 = Color3.fromRGB(0, 0, 0)
Yes.Position = UDim2.new(0.075, 0, 1, -40)
Yes.Size = UDim2.new(0.4, 0, 0, 30)
Yes.ZIndex = 2
Yes.Font = Enum.Font.SourceSans
Yes.Text = "Yes"
Yes.TextColor3 = Color3.fromRGB(255, 255, 255)
Yes.TextSize = 18

Desc_2.Name = "Desc"
Desc_2.Parent = MainWindow_2
Desc_2.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
Desc_2.BackgroundTransparency = 1
Desc_2.Position = UDim2.new(0, 0, 0, 20)
Desc_2.Size = UDim2.new(1, 0, 0, 40)
Desc_2.ZIndex = 2
Desc_2.Font = Enum.Font.SourceSans
Desc_2.Text = "The file, FILENAME, already exists. Overwrite?"
Desc_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Desc_2.TextSize = 14
Desc_2.TextWrapped = true

No.Name = "No"
No.Parent = MainWindow_2
No.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
No.BackgroundTransparency = 0.5
No.BorderColor3 = Color3.fromRGB(0, 0, 0)
No.Position = UDim2.new(0.524, 0, 1, -40)
No.Size = UDim2.new(0.4, 0, 0, 30)
No.ZIndex = 2
No.Font = Enum.Font.SourceSans
No.Text = "No"
No.TextColor3 = Color3.fromRGB(255, 255, 255)
No.TextSize = 18

Caution.Name = "Caution"
Caution.Parent = ROBLOX
Caution.Active = true
Caution.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Caution.BorderColor3 = Color3.fromRGB(30, 30, 30)
dragger.new(Caution)
Caution.Position = UDim2.new(0.3, 0, 0.3, 0)
Caution.Size = UDim2.new(0, 350, 0, 20)
Caution.Visible = false
Caution.ZIndex = 5

Title_4.Name = "Title"
Title_4.Parent = Caution
Title_4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title_4.BackgroundTransparency = 1
Title_4.Size = UDim2.new(1, 0, 1, 0)
Title_4.ZIndex = 5
Title_4.Font = Enum.Font.SourceSans
Title_4.Text = "    Caution"
Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_4.TextSize = 14
Title_4.TextStrokeColor3 = Color3.fromRGB(30, 30, 30)
Title_4.TextXAlignment = Enum.TextXAlignment.Left

MainWindow_3.Name = "MainWindow"
MainWindow_3.Parent = Caution
MainWindow_3.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MainWindow_3.BackgroundTransparency = 0.1
MainWindow_3.BorderColor3 = Color3.fromRGB(40, 40, 40)
MainWindow_3.Size = UDim2.new(1, 0, 0, 150)
MainWindow_3.ZIndex = 4

Desc_3.Name = "Desc"
Desc_3.Parent = MainWindow_3
Desc_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Desc_3.BackgroundTransparency = 1
Desc_3.Position = UDim2.new(0, 0, 0, 20)
Desc_3.Size = UDim2.new(1, 0, 0, 42)
Desc_3.ZIndex = 4
Desc_3.Font = Enum.Font.SourceSans
Desc_3.Text = "The file, FILENAME, already exists. Overwrite?"
Desc_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Desc_3.TextSize = 14
Desc_3.TextStrokeColor3 = Color3.fromRGB(30, 30, 30)
Desc_3.TextWrapped = true

Ok.Name = "Ok"
Ok.Parent = MainWindow_3
Ok.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Ok.BackgroundTransparency = 0.5
Ok.BorderColor3 = Color3.fromRGB(0, 0, 0)
Ok.Position = UDim2.new(0.3, 0, 1, -40)
Ok.Size = UDim2.new(0.4, 0, 0, 30)
Ok.ZIndex = 4
Ok.Font = Enum.Font.SourceSans
Ok.Text = "Ok"
Ok.TextColor3 = Color3.fromRGB(255, 255, 255)
Ok.TextSize = 18
Ok.TextStrokeColor3 = Color3.fromRGB(30, 30, 30)

CallRemote.Name = "CallRemote"
CallRemote.Parent = ROBLOX
CallRemote.Active = true
CallRemote.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CallRemote.BorderColor3 = Color3.fromRGB(40, 40, 40)
dragger.new(CallRemote)
CallRemote.Position = UDim2.new(0.3, 0, 0.3, 0)
CallRemote.Size = UDim2.new(0, 350, 0, 20)
CallRemote.Visible = false
CallRemote.ZIndex = 2

Title_5.Name = "Title"
Title_5.Parent = CallRemote
Title_5.BackgroundTransparency = 1
Title_5.Size = UDim2.new(1, 0, 1, 0)
Title_5.ZIndex = 2
Title_5.Font = Enum.Font.SourceSans
Title_5.Text = "Call Remote"
Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_5.TextSize = 14
Title_5.TextXAlignment = Enum.TextXAlignment.Left

MainWindow_4.Name = "MainWindow"
MainWindow_4.Parent = CallRemote
MainWindow_4.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
MainWindow_4.BackgroundTransparency = 0.1
MainWindow_4.BorderColor3 = Color3.fromRGB(40, 40, 40)
MainWindow_4.Size = UDim2.new(1, 0, 0, 200)

Desc_4.Name = "Desc"
Desc_4.Parent = MainWindow_4
Desc_4.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Desc_4.BackgroundTransparency = 1
Desc_4.BorderColor3 = Color3.fromRGB(30, 30, 30)
Desc_4.Position = UDim2.new(0, 0, 0, 20)
Desc_4.Size = UDim2.new(1, 0, 0, 20)
Desc_4.Font = Enum.Font.SourceSans
Desc_4.Text = "Arguments"
Desc_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Desc_4.TextSize = 14
Desc_4.TextWrapped = true

Arguments.Name = "Arguments"
Arguments.Parent = MainWindow_4
Arguments.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Arguments.BackgroundTransparency = 1
Arguments.BorderColor3 = Color3.fromRGB(30, 30, 30)
Arguments.Position = UDim2.new(0, 0, 0, 40)
Arguments.Size = UDim2.new(1, 0, 0, 80)
Arguments.BottomImage = "rbxasset://textures/blackBkg_square.png"
Arguments.CanvasSize = UDim2.new(0, 0, 0, 0)
Arguments.MidImage = "rbxasset://textures/blackBkg_square.png"
Arguments.TopImage = "rbxasset://textures/blackBkg_square.png"

DisplayReturned.Name = "DisplayReturned"
DisplayReturned.Parent = MainWindow_4
DisplayReturned.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
DisplayReturned.BackgroundTransparency = 0.6
DisplayReturned.BorderColor3 = Color3.fromRGB(30, 30, 30)
DisplayReturned.Position = UDim2.new(0.075, 0, 0.625, 0)
DisplayReturned.Size = UDim2.new(0, 20, 0, 20)
DisplayReturned.ZIndex = 2
DisplayReturned.Font = Enum.Font.SourceSans
DisplayReturned.Text = ""
DisplayReturned.TextColor3 = Color3.fromRGB(255, 255, 255)
DisplayReturned.TextSize = 18

enabled_2.Name = "enabled"
enabled_2.Parent = DisplayReturned
enabled_2.BackgroundColor3 = Color3.fromRGB(96, 96, 96)
enabled_2.BackgroundTransparency = 0.4
enabled_2.BorderSizePixel = 0
enabled_2.Position = UDim2.new(0, 3, 0, 3)
enabled_2.Size = UDim2.new(0, 14, 0, 14)
enabled_2.Visible = false
enabled_2.Font = Enum.Font.SourceSans
enabled_2.Text = ""
enabled_2.TextSize = 14

Desc2_2.Name = "Desc2"
Desc2_2.Parent = MainWindow_4
Desc2_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Desc2_2.BackgroundTransparency = 1
Desc2_2.BorderColor3 = Color3.fromRGB(30, 30, 30)
Desc2_2.Position = UDim2.new(0.075, 30, 0.625, 0)
Desc2_2.Size = UDim2.new(0.925, -30, 0, 20)
Desc2_2.Font = Enum.Font.SourceSans
Desc2_2.Text = "Display values returned"
Desc2_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Desc2_2.TextSize = 14
Desc2_2.TextXAlignment = Enum.TextXAlignment.Left

Add.Name = "Add"
Add.Parent = MainWindow_4
Add.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Add.BackgroundTransparency = 0.5
Add.BorderColor3 = Color3.fromRGB(30, 30, 30)
Add.Position = UDim2.new(0.8, 0, 0.625, 0)
Add.Size = UDim2.new(0, 20, 0, 20)
Add.Font = Enum.Font.SourceSansBold
Add.Text = "+"
Add.TextColor3 = Color3.fromRGB(255, 255, 255)
Add.TextSize = 24

Subtract.Name = "Subtract"
Subtract.Parent = MainWindow_4
Subtract.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Subtract.BackgroundTransparency = 0.5
Subtract.BorderColor3 = Color3.fromRGB(30, 30, 30)
Subtract.Position = UDim2.new(0.899, 0, 0.625, 0)
Subtract.Size = UDim2.new(0, 20, 0, 20)
Subtract.Font = Enum.Font.SourceSansBold
Subtract.Text = "-"
Subtract.TextColor3 = Color3.fromRGB(255, 255, 255)
Subtract.TextSize = 24

ArgumentTemplate.Name = "ArgumentTemplate"
ArgumentTemplate.Parent = MainWindow_4
ArgumentTemplate.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ArgumentTemplate.BackgroundTransparency = 0.5
ArgumentTemplate.BorderColor3 = Color3.fromRGB(40, 40, 40)
ArgumentTemplate.Size = UDim2.new(1, 0, 0, 20)
ArgumentTemplate.Visible = false

Type.Name = "Type"
Type.Parent = ArgumentTemplate
Type.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Type.BackgroundTransparency = 0.899
Type.BorderColor3 = Color3.fromRGB(30, 30, 30)
Type.Size = UDim2.new(0.4, 0, 0, 20)
Type.Font = Enum.Font.SourceSans
Type.Text = "Script"
Type.TextSize = 18

Value.Name = "Value"
Value.Parent = ArgumentTemplate
Value.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Value.BackgroundTransparency = 0.899
Value.BorderColor3 = Color3.fromRGB(30, 30, 30)
Value.Position = UDim2.new(0.4, 0, 0, 0)
Value.Size = UDim2.new(0.6, -12, 0, 20)
Value.Font = Enum.Font.SourceSans
Value.Text = ""
Value.TextSize = 14
Value.TextXAlignment = Enum.TextXAlignment.Left

Cancel_2.Name = "Cancel"
Cancel_2.Parent = MainWindow_4
Cancel_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Cancel_2.BackgroundTransparency = 0.5
Cancel_2.BorderColor3 = Color3.fromRGB(30, 30, 30)
Cancel_2.Size = UDim2.new(0.4, 0, 0, 30)
Cancel_2.Font = Enum.Font.SourceSans
Cancel_2.Text = "Cancel"
Cancel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Cancel_2.TextSize = 18

Ok_2.Name = "Ok"
Ok_2.Parent = MainWindow_4
Ok_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Ok_2.BackgroundTransparency = 0.5
Ok_2.BorderColor3 = Color3.fromRGB(30, 30, 30)
Ok_2.Position = UDim2.new(0.075, 0, 1, -40)
Ok_2.Size = UDim2.new(0.4, 0, 0, 30)
Ok_2.Font = Enum.Font.SourceSans
Ok_2.Text = "Call"
Ok_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Ok_2.TextSize = 18

TableCaution.Name = "TableCaution"
TableCaution.Parent = ROBLOX
TableCaution.Active = true
TableCaution.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TableCaution.BorderColor3 = Color3.fromRGB(43, 43, 43)
dragger.new(TableCaution)
TableCaution.Position = UDim2.new(0.3, 0, 0.3, 0)
TableCaution.Size = UDim2.new(0, 350, 0, 20)
TableCaution.Visible = false
TableCaution.ZIndex = 2

MainWindow_5.Name = "MainWindow"
MainWindow_5.Parent = TableCaution
MainWindow_5.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainWindow_5.BackgroundTransparency = 0.1
MainWindow_5.BorderColor3 = Color3.fromRGB(43, 43, 43)
MainWindow_5.Size = UDim2.new(1, 0, 0, 150)

Ok_3.Name = "Ok"
Ok_3.Parent = MainWindow_5
Ok_3.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Ok_3.BackgroundTransparency = 0.5
Ok_3.BorderColor3 = Color3.fromRGB(30, 30, 30)
Ok_3.Position = UDim2.new(0.3, 0, 1, -40)
Ok_3.Size = UDim2.new(0.4, 0, 0, 30)
Ok_3.Font = Enum.Font.SourceSans
Ok_3.Text = "Ok"
Ok_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Ok_3.TextSize = 18

TableResults.Name = "TableResults"
TableResults.Parent = MainWindow_5
TableResults.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TableResults.BackgroundTransparency = 1
TableResults.Position = UDim2.new(0, 0, 0, 20)
TableResults.Size = UDim2.new(1, 0, 0, 80)
TableResults.BottomImage = "rbxasset://textures/blackBkg_square.png"
TableResults.CanvasSize = UDim2.new(0, 0, 0, 0)
TableResults.MidImage = "rbxasset://textures/blackBkg_square.png"
TableResults.TopImage = "rbxasset://textures/blackBkg_square.png"

TableTemplate.Name = "TableTemplate"
TableTemplate.Parent = MainWindow_5
TableTemplate.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
TableTemplate.BackgroundTransparency = 0.5
TableTemplate.BorderColor3 = Color3.fromRGB(191, 191, 191)
TableTemplate.Size = UDim2.new(1, 0, 0, 20)
TableTemplate.Visible = false

Type_2.Name = "Type"
Type_2.Parent = TableTemplate
Type_2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Type_2.BackgroundTransparency = 0.899
Type_2.BorderColor3 = Color3.fromRGB(30, 30, 30)
Type_2.Size = UDim2.new(0.4, 0, 0, 20)
Type_2.Font = Enum.Font.SourceSans
Type_2.Text = "Script"
Type_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Type_2.TextSize = 18

Value_2.Name = "Value"
Value_2.Parent = TableTemplate
Value_2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Value_2.BackgroundTransparency = 0.899
Value_2.BorderColor3 = Color3.fromRGB(30, 30, 30)
Value_2.Position = UDim2.new(0.4, 0, 0, 0)
Value_2.Size = UDim2.new(0.6, -12, 0, 20)
Value_2.Font = Enum.Font.SourceSans
Value_2.Text = "Script"
Value_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Value_2.TextSize = 14

Title_6.Name = "Title"
Title_6.Parent = TableCaution
Title_6.BackgroundTransparency = 1
Title_6.Size = UDim2.new(1, 0, 1, 0)
Title_6.ZIndex = 2
Title_6.Font = Enum.Font.SourceSans
Title_6.Text = "Caution"
Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_6.TextSize = 14
Title_6.TextXAlignment = Enum.TextXAlignment.Left

ScriptEditor.Name = "ScriptEditor"
ScriptEditor.Parent = ROBLOX
ScriptEditor.Active = true
ScriptEditor.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
ScriptEditor.BorderColor3 = Color3.fromRGB(30, 30, 30)
dragger.new(ScriptEditor)
ScriptEditor.Position = UDim2.new(0.3, 0, 0.3, 0)
ScriptEditor.Size = UDim2.new(0, 916, 0, 20)
ScriptEditor.Visible = false
ScriptEditor.ZIndex = 5

Title_7.Name = "Title"
Title_7.Parent = ScriptEditor
Title_7.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Title_7.BackgroundTransparency = 1
Title_7.Size = UDim2.new(1, 0, 1, 0)
Title_7.ZIndex = 5
Title_7.Font = Enum.Font.SourceSans
Title_7.Text = "Script Viewer"
Title_7.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_7.TextSize = 14
Title_7.TextXAlignment = Enum.TextXAlignment.Left

Cover.Name = "Cover"
Cover.Parent = ScriptEditor
Cover.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Cover.BorderColor3 = Color3.fromRGB(30, 30, 30)
Cover.Position = UDim2.new(0, 0, 3, 0)
Cover.Size = UDim2.new(0, 916, 0, 416)

EditorGrid.Name = "EditorGrid"
EditorGrid.Parent = ScriptEditor
EditorGrid.Active = true
EditorGrid.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
EditorGrid.BorderColor3 = Color3.fromRGB(30, 30, 30)
EditorGrid.Position = UDim2.new(0, 0, 3, 0)
EditorGrid.Size = UDim2.new(1, -16, 0, 400)

TopBar.Name = "TopBar"
TopBar.Parent = ScriptEditor
TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TopBar.BorderColor3 = Color3.fromRGB(30, 30, 30)
TopBar.Size = UDim2.new(1, 0, 3, 0)

ScriptBarLeft.Name = "ScriptBarLeft"
ScriptBarLeft.Parent = TopBar
ScriptBarLeft.Active = false
ScriptBarLeft.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
ScriptBarLeft.BorderColor3 = Color3.fromRGB(30, 30, 30)
ScriptBarLeft.Position = UDim2.new(1, -32, 0, 40)
ScriptBarLeft.Size = UDim2.new(0, 16, 0, 20)
ScriptBarLeft.AutoButtonColor = false

ArrowGraphic.Name = "Arrow Graphic"
ArrowGraphic.Parent = ScriptBarLeft
ArrowGraphic.BackgroundTransparency = 1
ArrowGraphic.BorderSizePixel = 0
ArrowGraphic.Position = UDim2.new(0.5, -4, 0.5, -4)
ArrowGraphic.Size = UDim2.new(0, 8, 0, 8)

Graphic.Name = "Graphic"
Graphic.Parent = ArrowGraphic
Graphic.BackgroundColor3 = Color3.fromRGB(149, 149, 149)
Graphic.BackgroundTransparency = 0.699
Graphic.BorderSizePixel = 0
Graphic.Position = UDim2.new(0.25, 0, 0.375, 0)
Graphic.Size = UDim2.new(0.125, 0, 0.25, 0)

Graphic_2.Name = "Graphic"
Graphic_2.Parent = ArrowGraphic
Graphic_2.BackgroundColor3 = Color3.fromRGB(149, 149, 149)
Graphic_2.BackgroundTransparency = 0.699
Graphic_2.BorderSizePixel = 0
Graphic_2.Position = UDim2.new(0.375, 0, 0.25, 0)
Graphic_2.Size = UDim2.new(0.125, 0, 0.5, 0)

Graphic_3.Name = "Graphic"
Graphic_3.Parent = ArrowGraphic
Graphic_3.BackgroundColor3 = Color3.fromRGB(149, 149, 149)
Graphic_3.BackgroundTransparency = 0.699
Graphic_3.BorderSizePixel = 0
Graphic_3.Position = UDim2.new(0.5, 0, 0.125, 0)
Graphic_3.Size = UDim2.new(0.125, 0, 0.75, 0)

Graphic_4.Name = "Graphic"
Graphic_4.Parent = ArrowGraphic
Graphic_4.BackgroundColor3 = Color3.fromRGB(149, 149, 149)
Graphic_4.BackgroundTransparency = 0.699
Graphic_4.BorderSizePixel = 0
Graphic_4.Position = UDim2.new(0.625, 0, 0, 0)
Graphic_4.Size = UDim2.new(0.125, 0, 1, 0)

ScriptBarRight.Name = "ScriptBarRight"
ScriptBarRight.Parent = TopBar
ScriptBarRight.Active = false
ScriptBarRight.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
ScriptBarRight.BorderColor3 = Color3.fromRGB(30, 30, 30)
ScriptBarRight.Position = UDim2.new(1, -16, 0, 40)
ScriptBarRight.Size = UDim2.new(0, 16, 0, 20)
ScriptBarRight.AutoButtonColor = false

ArrowGraphic_2.Name = "Arrow Graphic"
ArrowGraphic_2.Parent = ScriptBarRight
ArrowGraphic_2.BackgroundTransparency = 1
ArrowGraphic_2.BorderSizePixel = 0
ArrowGraphic_2.Position = UDim2.new(0.5, -4, 0.5, -4)
ArrowGraphic_2.Size = UDim2.new(0, 8, 0, 8)

Graphic_5.Name = "Graphic"
Graphic_5.Parent = ArrowGraphic_2
Graphic_5.BackgroundColor3 = Color3.fromRGB(149, 149, 149)
Graphic_5.BackgroundTransparency = 0.699
Graphic_5.BorderSizePixel = 0
Graphic_5.Position = UDim2.new(0.625, 0, 0.375, 0)
Graphic_5.Size = UDim2.new(0.125, 0, 0.25, 0)

Graphic_6.Name = "Graphic"
Graphic_6.Parent = ArrowGraphic_2
Graphic_6.BackgroundColor3 = Color3.fromRGB(149, 149, 149)
Graphic_6.BackgroundTransparency = 0.699
Graphic_6.BorderSizePixel = 0
Graphic_6.Position = UDim2.new(0.5, 0, 0.25, 0)
Graphic_6.Size = UDim2.new(0.125, 0, 0.5, 0)

Graphic_7.Name = "Graphic"
Graphic_7.Parent = ArrowGraphic_2
Graphic_7.BackgroundColor3 = Color3.fromRGB(149, 149, 149)
Graphic_7.BackgroundTransparency = 0.699
Graphic_7.BorderSizePixel = 0
Graphic_7.Position = UDim2.new(0.375, 0, 0.125, 0)
Graphic_7.Size = UDim2.new(0.125, 0, 0.75, 0)

Graphic_8.Name = "Graphic"
Graphic_8.Parent = ArrowGraphic_2
Graphic_8.BackgroundColor3 = Color3.fromRGB(149, 149, 149)
Graphic_8.BackgroundTransparency = 0.699
Graphic_8.BorderSizePixel = 0
Graphic_8.Position = UDim2.new(0.25, 0, 0, 0)
Graphic_8.Size = UDim2.new(0.125, 0, 1, 0)

Clipboard.Name = "Clipboard"
Clipboard.Parent = TopBar
Clipboard.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Clipboard.BackgroundTransparency = 0.5
Clipboard.BorderColor3 = Color3.fromRGB(0, 0, 0)
Clipboard.Position = UDim2.new(0, 0, 0, 20)
Clipboard.Size = UDim2.new(0, 80, 0, 20)
Clipboard.AutoButtonColor = false
Clipboard.Font = Enum.Font.SourceSans
Clipboard.Text = "To Clipboard"
Clipboard.TextColor3 = Color3.fromRGB(255, 255, 255)
Clipboard.TextSize = 14

SaveScript.Name = "SaveScript"
SaveScript.Parent = TopBar
SaveScript.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
SaveScript.BackgroundTransparency = 0.5
SaveScript.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveScript.Position = UDim2.new(0, 80, 0, 20)
SaveScript.Size = UDim2.new(0, 80, 0, 20)
SaveScript.AutoButtonColor = false
SaveScript.Font = Enum.Font.SourceSans
SaveScript.Text = "Save Script"
SaveScript.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveScript.TextSize = 14

ScriptBar.Name = "ScriptBar"
ScriptBar.Parent = TopBar
ScriptBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScriptBar.BorderColor3 = Color3.fromRGB(30, 30, 30)
ScriptBar.ClipsDescendants = true
ScriptBar.Position = UDim2.new(0, 0, 0, 40)
ScriptBar.Size = UDim2.new(1, -32, 0, 20)

Entry.Name = "Entry"
Entry.Parent = TopBar
Entry.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Entry.BackgroundTransparency = 1
Entry.Size = UDim2.new(0, 100, 1, 0)
Entry.Visible = false

Button.Name = "Button"
Button.Parent = Entry
Button.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
Button.BackgroundTransparency = .6
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.ClipsDescendants = true
Button.Size = UDim2.new(1, 0, 1, 0)
Button.ZIndex = 4
Button.Font = Enum.Font.SourceSans
Button.Text = ""
Button.TextSize = 12
Button.TextColor3 = Color3.fromRGB(255, 255, 255);
Button.TextXAlignment = Enum.TextXAlignment.Left

Close.Name = "Close"
Close.Parent = Entry
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.Position = UDim2.new(1, -20, 0, 0)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.ZIndex = 4
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(255, 255, 255)

Close_2.Name = "Close"
Close_2.Parent = ScriptEditor
Close_2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Close_2.BackgroundTransparency = 1
Close_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close_2.Position = UDim2.new(1, -20, 0, 0)
Close_2.Size = UDim2.new(0, 20, 0, 20)
Close_2.ZIndex = 5
Close_2.Font = Enum.Font.SourceSans
Close_2.Text = "X"
Close_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Close_2.TextSize = 14

IntroFrame.Name = "IntroFrame"
IntroFrame.Parent = ROBLOX
IntroFrame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
IntroFrame.BorderSizePixel = 0
IntroFrame.Position = UDim2.new(1, 30, 0, 0)
IntroFrame.Size = UDim2.new(0, 300, 1, 0)
IntroFrame.ZIndex = 2

Main_2.Name = "Main"
Main_2.Parent = IntroFrame
Main_2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Main_2.BorderSizePixel = 0
Main_2.Position = UDim2.new(0, -30, 0, 0)
Main_2.Size = UDim2.new(0, 30, 0, 90)
Main_2.ZIndex = 4

ImageLabel.Parent = Main_2
ImageLabel.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderSizePixel = 0
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.ZIndex = 5
ImageLabel.ScaleType = Enum.ScaleType.Tile
ImageLabel.TileSize = UDim2.new(25, 0, 6, 0)

Title_8.Name = "Title"
Title_8.Parent = IntroFrame
Title_8.BackgroundTransparency = 1
Title_8.Position = UDim2.new(0, 100, 0, 110)
Title_8.Size = UDim2.new(0, 100, 0, 100)
Title_8.ZIndex = 4
Title_8.Image = "http://www.roblox.com/asset/?id=4540274383"
Title_8.ScaleType = Enum.ScaleType.Fit

Version_2.Name = "Version"
Version_2.Parent = IntroFrame
Version_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Version_2.BackgroundTransparency = 1
Version_2.Position = UDim2.new(0, 100, 0, 225)
Version_2.Size = UDim2.new(0, 100, 0, 30)
Version_2.ZIndex = 4
Version_2.Font = Enum.Font.SourceSansBold
Version_2.Text = "V2.0.1\nEdited by Google Chrome & CriShoux"
Version_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Version_2.TextSize = 19

Creator.Name = "Creator"
Creator.Parent = IntroFrame
Creator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Creator.BackgroundTransparency = 1
Creator.Position = UDim2.new(0, 80, 0, 300)
Creator.Size = UDim2.new(0, 140, 0, 30)
Creator.ZIndex = 4
Creator.Font = Enum.Font.SourceSansBold
Creator.Text = ""
Creator.TextColor3 = Color3.fromRGB(255, 255, 255)
Creator.TextSize = 28
Creator.TextWrapped = true

BG.Name = "BG"
BG.Parent = IntroFrame
BG.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
BG.BackgroundTransparency = 1
BG.BorderSizePixel = 0
BG.Size = UDim2.new(1, 0, 1, 0)
BG.ZIndex = 3
BG.ScaleType = Enum.ScaleType.Tile
BG.TileSize = UDim2.new(4, 0, 1, 0)

Slant_2.Name = "Slant"
Slant_2.Parent = IntroFrame
Slant_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slant_2.BackgroundTransparency = 1
Slant_2.BorderSizePixel = 0
Slant_2.ClipsDescendants = true
Slant_2.Position = UDim2.new(0, -27, 0, 86)
Slant_2.Rotation = 45
Slant_2.Size = UDim2.new(0, 60, 0, 30)
Slant_2.ZIndex = 3

ImageLabel_2.Parent = Slant_2
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
ImageLabel_2.BackgroundTransparency = 1
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Size = UDim2.new(1, 0, 1, 0)
ImageLabel_2.ZIndex = 2
ImageLabel_2.Image = "rbxassetid://474172996"
ImageLabel_2.ScaleType = Enum.ScaleType.Tile
ImageLabel_2.TileSize = UDim2.new(25, 0, 6, 0)
ImageLabel_2.ImageColor3 = Color3.fromRGB(43, 43, 43)

SaveMapWindow.Name = "SaveMapWindow"
SaveMapWindow.Parent = ROBLOX
SaveMapWindow.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
SaveMapWindow.BorderColor3 = Color3.fromRGB(191, 191, 191)
SaveMapWindow.BorderSizePixel = 0
SaveMapWindow.Position = UDim2.new(1, 0, 0, 1)
SaveMapWindow.Size = UDim2.new(0, 300, 1, 0)

Header_3.Name = "Header"
Header_3.Parent = SaveMapWindow
Header_3.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Header_3.BorderColor3 = Color3.fromRGB(30, 30, 30)
Header_3.Size = UDim2.new(1, 0, 0, 17)

TextLabel_3.Parent = Header_3
TextLabel_3.BackgroundTransparency = 1
TextLabel_3.Position = UDim2.new(0, 4, 0, 0)
TextLabel_3.Size = UDim2.new(1, -4, 1, 0)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Map Downloader"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextSize = 14
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

MapSettings.Name = "MapSettings"
MapSettings.Parent = SaveMapWindow
MapSettings.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
MapSettings.BackgroundTransparency = 1
MapSettings.BorderSizePixel = 0
MapSettings.Position = UDim2.new(0, 0, 0, 200)
MapSettings.Size = UDim2.new(1, 0, 0, 240)

Terrain.Name = "Terrain"
Terrain.Parent = MapSettings
Terrain.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Terrain.BackgroundTransparency = 1
Terrain.BorderSizePixel = 0
Terrain.Position = UDim2.new(0, 0, 0, 60)
Terrain.Size = UDim2.new(1, 0, 0, 60)

SName_2.Name = "SName"
SName_2.Parent = Terrain
SName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SName_2.BackgroundTransparency = 1
SName_2.BorderColor3 = Color3.fromRGB(40, 40, 40)
SName_2.Position = UDim2.new(0, 10, 0, 0)
SName_2.Size = UDim2.new(1, -20, 0, 30)
SName_2.Font = Enum.Font.SourceSans
SName_2.Text = "Save Terrain"
SName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
SName_2.TextSize = 18
SName_2.TextXAlignment = Enum.TextXAlignment.Left

Status_2.Name = "Status"
Status_2.Parent = Terrain
Status_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status_2.BackgroundTransparency = 1
Status_2.BorderColor3 = Color3.fromRGB(40, 40, 40)
Status_2.Position = UDim2.new(0, 60, 0, 30)
Status_2.Size = UDim2.new(0, 50, 0, 15)
Status_2.Font = Enum.Font.SourceSans
Status_2.Text = "Off"
Status_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Status_2.TextSize = 18
Status_2.TextXAlignment = Enum.TextXAlignment.Left

Change_2.Name = "Change"
Change_2.Parent = Terrain
Change_2.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
Change_2.BorderColor3 = Color3.fromRGB(40, 40, 40)
Change_2.BorderSizePixel = 0
Change_2.Position = UDim2.new(0, 10, 0, 30)
Change_2.Size = UDim2.new(0, 40, 0, 15)
Change_2.Font = Enum.Font.SourceSans
Change_2.Text = ""
Change_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Change_2.TextSize = 14

OnBar_2.Name = "OnBar"
OnBar_2.Parent = Change_2
OnBar_2.BackgroundColor3 = Color3.fromRGB(197, 28, 70)
OnBar_2.BorderSizePixel = 0
OnBar_2.Size = UDim2.new(0, 0, 0, 15)
OnBar_2.Font = Enum.Font.SourceSans
OnBar_2.Text = ""
OnBar_2.TextSize = 14

Bar_2.Name = "Bar"
Bar_2.Parent = Change_2
Bar_2.BackgroundColor3 = Color3.fromRGB(219, 47, 84)
Bar_2.BorderSizePixel = 0
Bar_2.ClipsDescendants = true
Bar_2.Position = UDim2.new(0, -2, 0, -2)
Bar_2.Size = UDim2.new(0, 10, 0, 19)
Bar_2.Font = Enum.Font.SourceSans
Bar_2.Text = ""
Bar_2.TextSize = 14

Lighting.Name = "Lighting"
Lighting.Parent = MapSettings
Lighting.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Lighting.BackgroundTransparency = 1
Lighting.BorderSizePixel = 0
Lighting.Position = UDim2.new(0, 0, 0, 120)
Lighting.Size = UDim2.new(1, 0, 0, 60)

SName_3.Name = "SName"
SName_3.Parent = Lighting
SName_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SName_3.BackgroundTransparency = 1
SName_3.BorderColor3 = Color3.fromRGB(40, 40, 40)
SName_3.Position = UDim2.new(0, 10, 0, 0)
SName_3.Size = UDim2.new(1, -20, 0, 30)
SName_3.Font = Enum.Font.SourceSans
SName_3.Text = "Lighting Properties"
SName_3.TextColor3 = Color3.fromRGB(255, 255, 255)
SName_3.TextSize = 18
SName_3.TextXAlignment = Enum.TextXAlignment.Left

Status_3.Name = "Status"
Status_3.Parent = Lighting
Status_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status_3.BackgroundTransparency = 1
Status_3.BorderColor3 = Color3.fromRGB(40, 40, 40)
Status_3.Position = UDim2.new(0, 60, 0, 30)
Status_3.Size = UDim2.new(0, 50, 0, 15)
Status_3.Font = Enum.Font.SourceSans
Status_3.Text = "Off"
Status_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Status_3.TextSize = 18
Status_3.TextXAlignment = Enum.TextXAlignment.Left

Change_3.Name = "Change"
Change_3.Parent = Lighting
Change_3.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
Change_3.BorderColor3 = Color3.fromRGB(40, 40, 40)
Change_3.BorderSizePixel = 0
Change_3.Position = UDim2.new(0, 10, 0, 30)
Change_3.Size = UDim2.new(0, 40, 0, 15)
Change_3.Font = Enum.Font.SourceSans
Change_3.Text = ""
Change_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Change_3.TextSize = 14

OnBar_3.Name = "OnBar"
OnBar_3.Parent = Change_3
OnBar_3.BackgroundColor3 = Color3.fromRGB(197, 28, 70)
OnBar_3.BorderSizePixel = 0
OnBar_3.Size = UDim2.new(0, 0, 0, 15)
OnBar_3.Font = Enum.Font.SourceSans
OnBar_3.Text = ""
OnBar_3.TextSize = 14

Bar_3.Name = "Bar"
Bar_3.Parent = Change_3
Bar_3.BackgroundColor3 = Color3.fromRGB(219, 47, 84)
Bar_3.BorderSizePixel = 0
Bar_3.ClipsDescendants = true
Bar_3.Position = UDim2.new(0, -2, 0, -2)
Bar_3.Size = UDim2.new(0, 10, 0, 19)
Bar_3.Font = Enum.Font.SourceSans
Bar_3.Text = ""
Bar_3.TextSize = 14

CameraInstances.Name = "CameraInstances"
CameraInstances.Parent = MapSettings
CameraInstances.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
CameraInstances.BackgroundTransparency = 1
CameraInstances.BorderSizePixel = 0
CameraInstances.Position = UDim2.new(0, 0, 0, 180)
CameraInstances.Size = UDim2.new(1, 0, 0, 60)

SName_4.Name = "SName"
SName_4.Parent = CameraInstances
SName_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SName_4.BackgroundTransparency = 1
SName_4.BorderColor3 = Color3.fromRGB(40, 40, 40)
SName_4.Position = UDim2.new(0, 10, 0, 0)
SName_4.Size = UDim2.new(1, -20, 0, 30)
SName_4.Font = Enum.Font.SourceSans
SName_4.Text = "Camera Instances"
SName_4.TextColor3 = Color3.fromRGB(255, 255, 255)
SName_4.TextSize = 18
SName_4.TextXAlignment = Enum.TextXAlignment.Left

Status_4.Name = "Status"
Status_4.Parent = CameraInstances
Status_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status_4.BackgroundTransparency = 1
Status_4.BorderColor3 = Color3.fromRGB(40, 40, 40)
Status_4.Position = UDim2.new(0, 60, 0, 30)
Status_4.Size = UDim2.new(0, 50, 0, 15)
Status_4.Font = Enum.Font.SourceSans
Status_4.Text = "Off"
Status_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Status_4.TextSize = 18
Status_4.TextXAlignment = Enum.TextXAlignment.Left

Change_4.Name = "Change"
Change_4.Parent = CameraInstances
Change_4.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
Change_4.BorderColor3 = Color3.fromRGB(40, 40, 40)
Change_4.BorderSizePixel = 0
Change_4.Position = UDim2.new(0, 10, 0, 30)
Change_4.Size = UDim2.new(0, 40, 0, 15)
Change_4.Font = Enum.Font.SourceSans
Change_4.Text = ""
Change_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Change_4.TextSize = 14

OnBar_4.Name = "OnBar"
OnBar_4.Parent = Change_4
OnBar_4.BackgroundColor3 = Color3.fromRGB(197, 28, 70)
OnBar_4.BorderSizePixel = 0
OnBar_4.Size = UDim2.new(0, 0, 0, 15)
OnBar_4.Font = Enum.Font.SourceSans
OnBar_4.Text = ""
OnBar_4.TextSize = 14

Bar_4.Name = "Bar"
Bar_4.Parent = Change_4
Bar_4.BackgroundColor3 = Color3.fromRGB(219, 47, 84)
Bar_4.BorderSizePixel = 0
Bar_4.ClipsDescendants = true
Bar_4.Position = UDim2.new(0, -2, 0, -2)
Bar_4.Size = UDim2.new(0, 10, 0, 19)
Bar_4.Font = Enum.Font.SourceSans
Bar_4.Text = ""
Bar_4.TextSize = 14

Scripts.Name = "Scripts"
Scripts.Parent = MapSettings
Scripts.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Scripts.BackgroundTransparency = 1
Scripts.BorderSizePixel = 0
Scripts.Size = UDim2.new(1, 0, 0, 60)

SName_5.Name = "SName"
SName_5.Parent = Scripts
SName_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SName_5.BackgroundTransparency = 1
SName_5.BorderColor3 = Color3.fromRGB(40, 40, 40)
SName_5.Position = UDim2.new(0, 10, 0, 0)
SName_5.Size = UDim2.new(1, -20, 0, 30)
SName_5.Font = Enum.Font.SourceSans
SName_5.Text = "Save Scripts"
SName_5.TextColor3 = Color3.fromRGB(255, 255, 255)
SName_5.TextSize = 18
SName_5.TextXAlignment = Enum.TextXAlignment.Left

Status_5.Name = "Status"
Status_5.Parent = Scripts
Status_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status_5.BackgroundTransparency = 1
Status_5.BorderColor3 = Color3.fromRGB(40, 40, 40)
Status_5.Position = UDim2.new(0, 60, 0, 30)
Status_5.Size = UDim2.new(0, 50, 0, 15)
Status_5.Font = Enum.Font.SourceSans
Status_5.Text = "Off"
Status_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Status_5.TextSize = 18
Status_5.TextXAlignment = Enum.TextXAlignment.Left

Change_5.Name = "Change"
Change_5.Parent = Scripts
Change_5.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
Change_5.BorderColor3 = Color3.fromRGB(40, 40, 40)
Change_5.BorderSizePixel = 0
Change_5.Position = UDim2.new(0, 10, 0, 30)
Change_5.Size = UDim2.new(0, 40, 0, 15)
Change_5.Font = Enum.Font.SourceSans
Change_5.Text = ""
Change_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Change_5.TextSize = 14

OnBar_5.Name = "OnBar"
OnBar_5.Parent = Change_5
OnBar_5.BackgroundColor3 = Color3.fromRGB(197, 28, 70)
OnBar_5.BorderSizePixel = 0
OnBar_5.Size = UDim2.new(0, 0, 0, 15)
OnBar_5.Font = Enum.Font.SourceSans
OnBar_5.Text = ""
OnBar_5.TextSize = 14

Bar_5.Name = "Bar"
Bar_5.Parent = Change_5
Bar_5.BackgroundColor3 = Color3.fromRGB(219, 47, 84)
Bar_5.BorderSizePixel = 0
Bar_5.ClipsDescendants = true
Bar_5.Position = UDim2.new(0, -2, 0, -2)
Bar_5.Size = UDim2.new(0, 10, 0, 19)
Bar_5.Font = Enum.Font.SourceSans
Bar_5.Text = ""
Bar_5.TextSize = 14

ToSave.Name = "ToSave"
ToSave.Parent = SaveMapWindow
ToSave.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
ToSave.BackgroundTransparency = 1
ToSave.Position = UDim2.new(0, 0, 0, 17)
ToSave.Size = UDim2.new(1, 0, 0, 20)
ToSave.Font = Enum.Font.SourceSans
ToSave.Text = "To Save"
ToSave.TextColor3 = Color3.fromRGB(255, 255, 255)
ToSave.TextSize = 18

CopyList.Name = "CopyList"
CopyList.Parent = SaveMapWindow
CopyList.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
CopyList.BackgroundTransparency = 0.4
CopyList.BorderSizePixel = 0
CopyList.Position = UDim2.new(0, 0, 0, 37)
CopyList.Size = UDim2.new(1, 0, 0, 163)

Bottom.Name = "Bottom"
Bottom.Parent = SaveMapWindow
Bottom.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Bottom.BorderColor3 = Color3.fromRGB(30, 30, 30)
Bottom.BorderSizePixel = 0
Bottom.Position = UDim2.new(0, 0, 1, -50)
Bottom.Size = UDim2.new(1, 0, 0, 50)

TextLabel_4.Parent = Bottom
TextLabel_4.BackgroundTransparency = 1
TextLabel_4.Position = UDim2.new(0, 4, 0, 0)
TextLabel_4.Size = UDim2.new(1, -4, 1, 0)
TextLabel_4.Font = Enum.Font.SourceSans
TextLabel_4.Text = "After the map saves, open a new place on studio, then right click Lighting and \"Insert from file...\", then select your file and run the unpacker script inside the folder."
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextSize = 14
TextLabel_4.TextWrapped = true
TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_4.TextYAlignment = Enum.TextYAlignment.Top

Save_2.Name = "Save"
Save_2.Parent = SaveMapWindow
Save_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Save_2.BackgroundTransparency = 0.4
Save_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Save_2.BorderSizePixel = 0
Save_2.Position = UDim2.new(0, 0, 1, -80)
Save_2.Size = UDim2.new(1, 0, 0, 30)
Save_2.Font = Enum.Font.SourceSans
Save_2.Text = "Save"
Save_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Save_2.TextSize = 18

FileName_2.Name = "FileName"
FileName_2.Parent = SaveMapWindow
FileName_2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
FileName_2.BackgroundTransparency = 0.4
FileName_2.BorderSizePixel = 0
FileName_2.Position = UDim2.new(0, 0, 1, -105)
FileName_2.Size = UDim2.new(1, 0, 0, 25)
FileName_2.Font = Enum.Font.SourceSans
FileName_2.Text = "   PlaceName"
FileName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
FileName_2.TextSize = 18
FileName_2.TextXAlignment = Enum.TextXAlignment.Left

Entry_2.Name = "Entry"
Entry_2.Parent = SaveMapWindow
Entry_2.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Entry_2.BackgroundTransparency = 1
Entry_2.BorderSizePixel = 0
Entry_2.Size = UDim2.new(1, 0, 0, 22)
Entry_2.Visible = false

Change_6.Name = "Change"
Change_6.Parent = Entry_2
Change_6.BackgroundColor3 = Color3.fromRGB(219, 47, 84)
Change_6.BackgroundTransparency = 0.6
Change_6.Position = UDim2.new(0, 10, 0, 1)
Change_6.Size = UDim2.new(0, 20, 0, 20)
Change_6.ZIndex = 2
Change_6.Font = Enum.Font.SourceSans
Change_6.Text = ""
Change_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Change_6.TextSize = 18

enabled_3.Name = "enabled"
enabled_3.Parent = Change_6
enabled_3.BackgroundColor3 = Color3.fromRGB(197, 28, 70)
enabled_3.BackgroundTransparency = 0.4
enabled_3.BorderSizePixel = 0
enabled_3.Position = UDim2.new(0, 3, 0, 3)
enabled_3.Size = UDim2.new(0, 14, 0, 14)
enabled_3.Font = Enum.Font.SourceSans
enabled_3.Text = ""
enabled_3.TextColor3 = Color3.fromRGB(255, 255, 255)
enabled_3.TextSize = 14

Info.Name = "Info"
Info.Parent = Entry_2
Info.BackgroundTransparency = 1
Info.Position = UDim2.new(0, 40, 0, 0)
Info.Size = UDim2.new(1, -40, 0, 22)
Info.Font = Enum.Font.SourceSans
Info.Text = "Workspace"
Info.TextColor3 = Color3.fromRGB(255, 255, 255)
Info.TextSize = 18
Info.TextXAlignment = Enum.TextXAlignment.Left

RemoteDebugWindow.Name = "RemoteDebugWindow"
RemoteDebugWindow.Parent = ROBLOX
RemoteDebugWindow.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
RemoteDebugWindow.BorderColor3 = Color3.fromRGB(191, 191, 191)
RemoteDebugWindow.BorderSizePixel = 0
RemoteDebugWindow.Position = UDim2.new(1, 0, 0, 1)
RemoteDebugWindow.Size = UDim2.new(0, 300, 1, 0)

Header_4.Name = "Header"
Header_4.Parent = RemoteDebugWindow
Header_4.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Header_4.BorderColor3 = Color3.fromRGB(30, 30, 30)
Header_4.Size = UDim2.new(1, 0, 0, 17)

TextLabel_5.Parent = Header_4
TextLabel_5.BackgroundTransparency = 1
TextLabel_5.Position = UDim2.new(0, 4, 0, 0)
TextLabel_5.Size = UDim2.new(1, -4, 1, 0)
TextLabel_5.Font = Enum.Font.SourceSans
TextLabel_5.Text = "Remote Debugger"
TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.TextSize = 14
TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

AboutWindow.Name = "AboutWindow"
AboutWindow.Parent = ROBLOX
AboutWindow.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
AboutWindow.BorderColor3 = Color3.fromRGB(191, 191, 191)
AboutWindow.BorderSizePixel = 0
AboutWindow.Position = UDim2.new(1, 0, 0, 1)
AboutWindow.Size = UDim2.new(0, 300, 1, 0)

Header_5.Name = "Header"
Header_5.Parent = AboutWindow
Header_5.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Header_5.BorderColor3 = Color3.fromRGB(30, 30, 30)
Header_5.Size = UDim2.new(1, 0, 0, 17)

TextLabel_6.Parent = Header_5
TextLabel_6.BackgroundTransparency = 1
TextLabel_6.Position = UDim2.new(0, 4, 0, 0)
TextLabel_6.Size = UDim2.new(1, -4, 1, 0)
TextLabel_6.Font = Enum.Font.SourceSans
TextLabel_6.Text = "About"
TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.TextSize = 14
TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left

Title_9.Name = "Logo"
Title_9.Parent = AboutWindow
Title_9.BackgroundTransparency = 1
Title_9.Position = UDim2.new(0, 100, 0, 70)
Title_9.Size = UDim2.new(0, 100, 0, 90)
Title_9.ZIndex = 4
Title_9.Image = "http://www.roblox.com/asset/?id=4540274383"
Title_9.ScaleType = Enum.ScaleType.Fit

Desc_6.Name = "Desc"
Desc_6.Parent = AboutWindow
Desc_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Desc_6.BackgroundTransparency = 1
Desc_6.Position = UDim2.new(0.1, 0, 0.1, 0)
Desc_6.Size = UDim2.new(0.8, 0, 0, 200)
Desc_6.Font = Enum.Font.SourceSans
Desc_6.Text = "Dex v2.0.1\nEdited by Google Chrome & CriShoux"
Desc_6.TextColor3 = Color3.fromRGB(197, 28, 70)
Desc_6.TextSize = 24
Desc_6.TextWrapped = true

local NewGuiPart153 = Instance.new("BindableFunction")
local NewGuiPart154 = Instance.new("BindableFunction")
local NewGuiPart155 = Instance.new("BindableFunction")
local NewGuiPart156 = Instance.new("BindableFunction")
local NewGuiPart157 = Instance.new("BindableEvent")
local NewGuiPart158 = Instance.new("BindableFunction")
local NewGuiPart159 = Instance.new("BindableFunction")
local NewGuiPart160 = Instance.new("BindableEvent")
local NewGuiPart161 = Instance.new("BindableFunction")
local NewGuiPart162 = Instance.new("BindableFunction")
local NewGuiPart163 = Instance.new("BindableEvent")

NewGuiPart158.Name = "GetApi"
NewGuiPart158.Parent = PropertiesFrame
NewGuiPart158.Archivable = true

NewGuiPart159.Name = "GetAwaiting"
NewGuiPart159.Parent = PropertiesFrame
NewGuiPart159.Archivable = true

NewGuiPart160.Name = "SetAwaiting"
NewGuiPart160.Parent = PropertiesFrame
NewGuiPart160.Archivable = true

NewGuiPart153.Name = "GetOption"
NewGuiPart153.Parent = ExplorerPanel
NewGuiPart153.Archivable = true

NewGuiPart154.Name = "GetSelection"
NewGuiPart154.Parent = ExplorerPanel
NewGuiPart154.Archivable = true

NewGuiPart155.Name = "SetOption"
NewGuiPart155.Parent = ExplorerPanel
NewGuiPart155.Archivable = true

NewGuiPart156.Name = "SetSelection"
NewGuiPart156.Parent = ExplorerPanel
NewGuiPart156.Archivable = true

NewGuiPart157.Name = "SelectionChanged"
NewGuiPart157.Parent = ExplorerPanel
NewGuiPart157.Archivable = true

NewGuiPart161.Name = "GetSetting"
NewGuiPart161.Parent = RemoteDebugWindow
NewGuiPart161.Archivable = true

NewGuiPart162.Name = "GetSetting"
NewGuiPart162.Parent = SettingsPanel
NewGuiPart162.Archivable = true

NewGuiPart163.Name = "OpenScript"
NewGuiPart163.Parent = ScriptEditor
NewGuiPart163.Archivable = true

return ROBLOX
end

local D_E_X = CreateGui()
D_E_X.Parent = coregui.RobloxGui;

spawn(function()

local Gui = D_E_X

local IntroFrame = Gui:WaitForChild("IntroFrame")

local SideMenu = Gui:WaitForChild("SideMenu")
local OpenToggleButton = Gui:WaitForChild("Toggle")
local CloseToggleButton = SideMenu:WaitForChild("Toggle")
local OpenScriptEditorButton = SideMenu:WaitForChild("OpenScriptEditor")

local ScriptEditor = Gui:WaitForChild("ScriptEditor")

local SlideOut = SideMenu:WaitForChild("SlideOut")
local SlideFrame = SlideOut:WaitForChild("SlideFrame")
local Slant = SideMenu:WaitForChild("Slant")

local ExplorerButton = SlideFrame:WaitForChild("Explorer")
local SettingsButton = SlideFrame:WaitForChild("Settings")

local SelectionBox = Instance.new("SelectionBox")
SelectionBox.Parent = Gui

local ExplorerPanel = Gui:WaitForChild("ExplorerPanel")
local PropertiesFrame = Gui:WaitForChild("PropertiesFrame")
local SaveMapWindow = Gui:WaitForChild("SaveMapWindow")
local RemoteDebugWindow = Gui:WaitForChild("RemoteDebugWindow")
local AboutWindow = Gui:WaitForChild("AboutWindow")

local SettingsPanel = Gui:WaitForChild("SettingsPanel")
local SettingsListener = SettingsPanel:WaitForChild("GetSetting")
local SettingTemplate = SettingsPanel:WaitForChild("SettingTemplate")
local SettingList = SettingsPanel:WaitForChild("SettingList")

local SaveMapCopyList = SaveMapWindow:WaitForChild("CopyList")
local SaveMapSettingFrame = SaveMapWindow:WaitForChild("MapSettings")
local SaveMapName = SaveMapWindow:WaitForChild("FileName")
local SaveMapButton = SaveMapWindow:WaitForChild("Save")
local SaveMapCopyTemplate = SaveMapWindow:WaitForChild("Entry")
local SaveMapSettings = {
	CopyWhat = {
		Workspace = true,
		Lighting = true,
		ReplicatedStorage = true,
		ReplicatedFirst = true,
		StarterPack = true,
		StarterGui = true,
		StarterPlayer = true
	},
	SaveScripts = true,
	SaveTerrain = true,
	LightingProperties = true,
	CameraInstances = true
}

local SelectionChanged = ExplorerPanel:WaitForChild("SelectionChanged")
local GetSelection = ExplorerPanel:WaitForChild("GetSelection")
local SetSelection = ExplorerPanel:WaitForChild("SetSelection")

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()

local CurrentWindow = "Nothing c:"
local Windows = {
	Explorer = {
		ExplorerPanel,
		PropertiesFrame
	},
	Settings = {SettingsPanel},
	SaveMap = {SaveMapWindow},
	About = {AboutWindow}
}

function switchWindows(wName,over)
	if CurrentWindow == wName and not over then return end
	
	local count = 0
	
	for i,v in pairs(Windows) do
		count = 0
		if i ~= wName then
			for _,c in pairs(v) do c:TweenPosition(UDim2.new(1, 30, c.Position.Y.Scale, c.Position.Y.Offset), "Out", "Quad", 0.5, true) count = count + 1 end
			-- for _,c in pairs(v) do c:TweenPosition(UDim2.new(1, 30, count * 0.5, count * 36), "Out", "Quad", 0.5, true) count = count + 1 end
		end
	end
	
	count = 0
	
	if Windows[wName] then
		for _,c in pairs(Windows[wName]) do c:TweenPosition(UDim2.new(1, -300, c.Position.Y.Scale, c.Position.Y.Offset), "Out", "Quad", 0.5, true) count = count + 1 end
		-- for _,c in pairs(Windows[wName]) do c:TweenPosition(UDim2.new(1, -300, count * 0.5, count * 36), "Out", "Quad", 0.5, true) count = count + 1 end
	end
	
	if wName ~= "Nothing c:" then
		CurrentWindow = wName
		for i,v in pairs(SlideFrame:GetChildren()) do
			v.AutoButtonColor = false;
			v.BackgroundTransparency = 1
			v.Icon.ImageColor3 = Color3.fromRGB(197, 28, 70)
		end
		if SlideFrame:FindFirstChild(wName) then
			-- SlideFrame[wName].BackgroundTransparency = 1
			SlideFrame[wName].Icon.ImageColor3 = Color3.fromRGB(197, 28, 70)
		end
	end
end

function toggleDex(on)
	if on then
		SideMenu:TweenPosition(UDim2.new(1, -330, 0, 0), "Out", "Quad", 0.5, true)
		OpenToggleButton:TweenPosition(UDim2.new(1,0,0,0), "Out", "Quad", 0.5, true)
		switchWindows(CurrentWindow,true)
	else
		SideMenu:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.5, true)
		OpenToggleButton:TweenPosition(UDim2.new(1,-30,0,0), "Out", "Quad", 0.5, true)
		switchWindows("Nothing c:")
	end
end

local Settings = {
	ClickSelect = false;
	SelBox = false;
	ClearProps = false;
	SelectUngrouped = true;
	SaveInstanceScripts = true;
}

function ReturnSetting(set)
	if set == "ClearProps" then
		return Settings.ClearProps
	elseif set == "SelectUngrouped" then
		return Settings.SelectUngrouped
	end
end

OpenToggleButton.MouseButton1Up:connect(function()
	toggleDex(true)
end)

OpenScriptEditorButton.MouseButton1Up:connect(function()
	if OpenScriptEditorButton.Active then
		ScriptEditor.Visible = true
	end
end)

CloseToggleButton.MouseButton1Up:connect(function()
	if CloseToggleButton.Active then
		toggleDex(false)
	end
end)

for i,v in pairs(SlideFrame:GetChildren()) do
	v.MouseButton1Click:connect(function()
		switchWindows(v.Name)
	end)
	
	-- v.MouseEnter:connect(function()v.BackgroundTransparency = 0.5 end)
	-- v.MouseLeave:connect(function()if CurrentWindow~=v.Name then v.BackgroundTransparency = 1 end end)
end


function createSetting(name, interName, defaultOn, func)
	local newSetting = SettingTemplate:Clone()
	newSetting.Position = UDim2.new(0,0,0,#SettingList:GetChildren() * 60)
	newSetting.SName.Text = name
	
	local function toggle(on)
		if on then
			newSetting.Change.Bar:TweenPosition(UDim2.new(0,32,0,-2),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			newSetting.Change.OnBar:TweenSize(UDim2.new(0,34,0,15),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			newSetting.Status.Text = "On"
			Settings[interName] = true
		else
			newSetting.Change.Bar:TweenPosition(UDim2.new(0,-2,0,-2),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			newSetting.Change.OnBar:TweenSize(UDim2.new(0,0,0,15),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			newSetting.Status.Text = "Off"
			Settings[interName] = false
		end
	end	
	
	newSetting.Change.MouseButton1Click:connect(function()
		toggle(not Settings[interName])
		if func then pcall(func, Settings[interName]) end
	end)
	
	newSetting.Visible = true
	newSetting.Parent = SettingList
	
	if defaultOn then
		toggle(true)
	end
end

createSetting("Click part to select","ClickSelect",false)
createSetting("Selection Box","SelBox",false)
createSetting("Clear property value on focus","ClearProps",false)
createSetting("Select ungrouped models","SelectUngrouped",true)
createSetting("SaveInstance decompiles scripts","SaveInstanceScripts",true)

local function getSelection()
	local t = GetSelection:Invoke()
	if t and #t > 0 then
		return t[1]
	else
		return nil
	end
end

Mouse.Button1Down:connect(function()
	if CurrentWindow == "Explorer" and Settings.ClickSelect then
		local target = Mouse.Target
		if target then
			SetSelection:Invoke({target})
		end
	end
end)

SelectionChanged.Event:connect(function()
	if Settings.SelBox then
		local success,err = pcall(function()
			local selection = getSelection()
			SelectionBox.Adornee = selection
		end)
		if err then
			SelectionBox.Adornee = nil
		end
	end
end)

SettingsListener.OnInvoke = ReturnSetting

-- Map Copier

function createMapSetting(obj,interName,defaultOn)
	local function toggle(on)
		if on then
			obj.Change.Bar:TweenPosition(UDim2.new(0,32,0,-2),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			obj.Change.OnBar:TweenSize(UDim2.new(0,34,0,15),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			obj.Status.Text = "On"
			SaveMapSettings[interName] = true
		else
			obj.Change.Bar:TweenPosition(UDim2.new(0,-2,0,-2),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			obj.Change.OnBar:TweenSize(UDim2.new(0,0,0,15),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
			obj.Status.Text = "Off"
			SaveMapSettings[interName] = false
		end
	end	
	
	obj.Change.MouseButton1Click:connect(function()
		toggle(not SaveMapSettings[interName])
	end)
	
	obj.Visible = true
	obj.Parent = SaveMapSettingFrame
	
	if defaultOn then
		toggle(true)
	end
end

function createCopyWhatSetting(serv)
	if SaveMapSettings.CopyWhat[serv] then
		local newSetting = SaveMapCopyTemplate:Clone()
		newSetting.Position = UDim2.new(0,0,0,#SaveMapCopyList:GetChildren() * 22 + 5)
		newSetting.Info.Text = serv
		
		local function toggle(on)
			if on then
				newSetting.Change.enabled.Visible = true
				SaveMapSettings.CopyWhat[serv] = true
			else
				newSetting.Change.enabled.Visible = false
				SaveMapSettings.CopyWhat[serv] = false
			end
		end	
	
		newSetting.Change.MouseButton1Click:connect(function()
			toggle(not SaveMapSettings.CopyWhat[serv])
		end)
		
		newSetting.Visible = true
		newSetting.Parent = SaveMapCopyList
	end
end

createMapSetting(SaveMapSettingFrame.Scripts,"SaveScripts",true)
createMapSetting(SaveMapSettingFrame.Terrain,"SaveTerrain",true)
createMapSetting(SaveMapSettingFrame.Lighting,"LightingProperties",true)
createMapSetting(SaveMapSettingFrame.CameraInstances,"CameraInstances",true)

createCopyWhatSetting("Workspace")
createCopyWhatSetting("Lighting")
createCopyWhatSetting("ReplicatedStorage")
createCopyWhatSetting("ReplicatedFirst")
createCopyWhatSetting("StarterPack")
createCopyWhatSetting("StarterGui")
createCopyWhatSetting("StarterPlayer")

SaveMapName.Text = tostring(game.PlaceId).."MapCopy"

SaveMapButton.MouseButton1Click:connect(function()
	local copyWhat = {}

	local copyGroup = Instance.new("Model",game:GetService'ReplicatedStorage')

	local copyScripts = SaveMapSettings.SaveScripts

	local copyTerrain = SaveMapSettings.SaveTerrain

	local lightingProperties = SaveMapSettings.LightingProperties

	local cameraInstances = SaveMapSettings.CameraInstances

	-----------------------------------------------------------------------------------

	for i,v in pairs(SaveMapSettings.CopyWhat) do
		if v then
			table.insert(copyWhat,i)
		end
	end

	local consoleFunc = printconsole or writeconsole

	if consoleFunc then
		consoleFunc("Raspberry Pi's place copier loaded.")
		consoleFunc("Copying map of game "..tostring(game.PlaceId)..".")
	end

	function archivable(root)
		for i,v in pairs(root:GetChildren()) do
			if not game:GetService'Players':GetPlayerFromCharacter(v) then
				v.Archivable = true
				archivable(v)
			end
		end
	end

	function decompileS(root)
		for i,v in pairs(root:GetChildren()) do
			pcall(function()
				if v:IsA("LocalScript") then
					local isDisabled = v.Disabled
					v.Disabled = true
					v.Source = decompile(v)
					v.Disabled = isDisabled
				
					if v.Source == "" then 
						if consoleFunc then consoleFunc("LocalScript "..v.Name.." had a problem decompiling.") end
					else
						if consoleFunc then consoleFunc("LocalScript "..v.Name.." decompiled.") end
					end
				elseif v:IsA("ModuleScript") then
					v.Source = decompile(v)
				
					if v.Source == "" then 
						if consoleFunc then consoleFunc("ModuleScript "..v.Name.." had a problem decompiling.") end
					else
						if consoleFunc then consoleFunc("ModuleScript "..v.Name.." decompiled.") end
					end
				end
			end)
			decompileS(v)
		end
	end

	for i,v in pairs(copyWhat) do archivable(game[v]) end

	for j,obj in pairs(copyWhat) do
		if obj ~= "StarterPlayer" then
			local newFolder = Instance.new("Folder",copyGroup)
			newFolder.Name = obj
			for i,v in pairs(game[obj]:GetChildren()) do
				if v ~= copyGroup then
					pcall(function()
						v:Clone().Parent = newFolder
					end)
				end
			end
		else
			local newFolder = Instance.new("Model",copyGroup)
			newFolder.Name = "StarterPlayer"
			for i,v in pairs(game[obj]:GetChildren()) do
				local newObj = Instance.new("Folder",newFolder)
				newObj.Name = v.Name
				for _,c in pairs(v:GetChildren()) do
					if c.Name ~= "ControlScript" and c.Name ~= "CameraScript" then
						c:Clone().Parent = newObj
					end
				end
			end
		end
	end

	if workspace.CurrentCamera and cameraInstances then
		local cameraFolder = Instance.new("Model",copyGroup)
		cameraFolder.Name = "CameraItems"
		for i,v in pairs(workspace.CurrentCamera:GetChildren()) do v:Clone().Parent = cameraFolder end
	end

	if copyTerrain then
		local myTerrain = workspace.Terrain:CopyRegion(workspace.Terrain.MaxExtents)
		myTerrain.Parent = copyGroup
	end

	function saveProp(obj,prop,par)
		local myProp = obj[prop]
		if type(myProp) == "boolean" then
			local newProp = Instance.new("BoolValue",par)
			newProp.Name = prop
			newProp.Value = myProp
		elseif type(myProp) == "number" then
			local newProp = Instance.new("IntValue",par)
			newProp.Name = prop
			newProp.Value = myProp
		elseif type(myProp) == "string" then
			local newProp = Instance.new("StringValue",par)
			newProp.Name = prop
			newProp.Value = myProp
		elseif type(myProp) == "userdata" then -- Assume Color3
			pcall(function()
				local newProp = Instance.new("Color3Value",par)
				newProp.Name = prop
				newProp.Value = myProp
			end)
		end
	end

	if lightingProperties then
		local lightingProps = Instance.new("Model",copyGroup)
		lightingProps.Name = "LightingProperties"
	
		saveProp(game:GetService'Lighting',"Ambient",lightingProps)
		saveProp(game:GetService'Lighting',"Brightness",lightingProps)
		saveProp(game:GetService'Lighting',"ColorShift_Bottom",lightingProps)
		saveProp(game:GetService'Lighting',"ColorShift_Top",lightingProps)
		saveProp(game:GetService'Lighting',"GlobalShadows",lightingProps)
		saveProp(game:GetService'Lighting',"OutdoorAmbient",lightingProps)
		saveProp(game:GetService'Lighting',"Outlines",lightingProps)
		saveProp(game:GetService'Lighting',"GeographicLatitude",lightingProps)
		saveProp(game:GetService'Lighting',"TimeOfDay",lightingProps)
		saveProp(game:GetService'Lighting',"FogColor",lightingProps)
		saveProp(game:GetService'Lighting',"FogEnd",lightingProps)
		saveProp(game:GetService'Lighting',"FogStart",lightingProps)
	end

	if decompile and copyScripts then
		decompileS(copyGroup)
	end

	if SaveInstance then
		SaveInstance(copyGroup,SaveMapName.Text..".rbxm")
	elseif saveinstance then
		saveinstance(SaveMapName.Text..".rbxm", copyGroup)
	end
	--print("Saved!")
	if consoleFunc then
		consoleFunc("The map has been copied.")
	end
	SaveMapButton.Text = "The map has been saved"
	wait(5)
	SaveMapButton.Text = "Save"
end)

-- End Copier

wait()

IntroFrame:TweenPosition(UDim2.new(1,-300,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true)

switchWindows("Explorer")

wait(1)

SideMenu.Visible = true

for i = 0,1,0.1 do
	IntroFrame.BackgroundTransparency = i
	IntroFrame.Main.BackgroundTransparency = i
	IntroFrame.Slant.ImageLabel.ImageTransparency = i
	IntroFrame.Title.ImageTransparency = i
	IntroFrame.Version.TextTransparency = i
	IntroFrame.Creator.TextTransparency = i
	wait()
end

IntroFrame.Visible = false

SlideFrame:TweenPosition(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true)
OpenScriptEditorButton:TweenPosition(UDim2.new(0,0,0,150),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true)
CloseToggleButton:TweenPosition(UDim2.new(0,0,0,180),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true)
Slant:TweenPosition(UDim2.new(0,0,0,210),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.5,true)

wait(0.5)

for i = 1,0,-0.1 do
	OpenScriptEditorButton.Icon.ImageTransparency = i
	CloseToggleButton.TextTransparency = i
	wait()
end

CloseToggleButton.Active = true

OpenScriptEditorButton.Active = true
end)
spawn(function()
	-- initial states
local Option = {
	-- can modify object parents in the hierarchy
	Modifiable = false;
	-- can select objects
	Selectable = true;
}

-- MERELY

Option.Modifiable = true

-- END MERELY

-- general size of GUI objects, in pixels
local GUI_SIZE = 16
-- padding between items within each entry
local ENTRY_PADDING = 1
-- padding between each entry
local ENTRY_MARGIN = 1

local Input = game:GetService("UserInputService")
local HoldingCtrl = false
local HoldingShift = false

--[[

# Explorer Panel

A GUI panel that displays the game hierarchy.


## Selection Bindables

- `Function GetSelection ( )`

	Returns an array of objects representing the objects currently
	selected in the panel.

- `Function SetSelection ( Objects selection )`

	Sets the objects that are selected in the panel. `selection` is an array
	of objects.

- `Event SelectionChanged ( )`

	Fired after the selection changes.


## Option Bindables

- `Function GetOption ( string optionName )`

	If `optionName` is given, returns the value of that option. Otherwise,
	returns a table of options and their current values.

- `Function SetOption ( string optionName, bool value )`

	Sets `optionName` to `value`.

	Options:

	- Modifiable

		Whether objects can be modified by the panel.

		Note that modifying objects depends on being able to select them. If
		Selectable is false, then Actions will not be available. Reparenting
		is still possible, but only for the dragged object.

	- Selectable

		Whether objects can be selected.

		If Modifiable is false, then left-clicking will perform a drag
		selection.

## Updates

- 2013-09-18
	- Fixed explorer icons to match studio explorer.

- 2013-09-14
	- Added GetOption and SetOption bindables.
		- Option: Modifiable; sets whether objects can be modified by the panel.
		- Option: Selectable; sets whether objects can be selected.
	- Slight modification to left-click selection behavior.
	- Improved layout and scaling.

- 2013-09-13
	- Added drag to reparent objects.
		- Left-click to select/deselect object.
		- Left-click and drag unselected object to reparent single object.
		- Left-click and drag selected object to move reparent entire selection.
		- Right-click while dragging to cancel.

- 2013-09-11
	- Added explorer panel header with actions.
		- Added Cut action.
		- Added Copy action.
		- Added Paste action.
		- Added Delete action.
	- Added drag selection.
		- Left-click: Add to selection on drag.
		- Right-click: Add to or remove from selection on drag.
	- Ensured SelectionChanged fires only when the selection actually changes.
	- Added documentation and change log.
	- Fixed thread issue.

- 2013-09-09
	- Added basic multi-selection.
		- Left-click to set selection.
		- Right-click to add to or remove from selection.
	- Removed "Selection" ObjectValue.
		- Added GetSelection BindableFunction.
		- Added SetSelection BindableFunction.
		- Added SelectionChanged BindableEvent.
	- Changed font to SourceSans.

- 2013-08-31
	- Improved GUI sizing based off of `GUI_SIZE` constant.
	- Automatic font size detection.

- 2013-08-27
	- Initial explorer panel.


## Todo

- Sorting
	- by ExplorerOrder
	- by children
	- by name
- Drag objects to reparent

]]

local ENTRY_SIZE = GUI_SIZE + ENTRY_PADDING*2
local ENTRY_BOUND = ENTRY_SIZE + ENTRY_MARGIN
local HEADER_SIZE = ENTRY_SIZE*2

local FONT = 'SourceSans'
local FONT_SIZE do
	local size = {8,9,10,11,12,14,18,24,36,48}
	local s
	local n = math.huge
	for i = 1,#size do
		if size[i] <= GUI_SIZE then
			FONT_SIZE = i - 1
		end
	end
end

local GuiColor = {
	Background      = Color3.fromRGB( 43,  43,  43);
	Border          = Color3.fromRGB( 20,  20,  20);
	Selected        = Color3.fromRGB( 197, 28, 70);
	BorderSelected  = Color3.fromRGB( 170, 82, 104);
	Text            = Color3.fromRGB(245, 245, 245);
	TextDisabled    = Color3.fromRGB(188, 188, 188);
	TextSelected    = Color3.fromRGB(255, 255, 255);
	Button          = Color3.fromRGB( 33,  33,  33);
	ButtonBorder    = Color3.fromRGB(133, 133, 133);
	ButtonSelected  = Color3.fromRGB( 250, 51, 101);
	Field           = Color3.fromRGB( 43,  43,  43);
	FieldBorder     = Color3.fromRGB( 50,  50,  50);
	TitleBackground = Color3.fromRGB( 11,  11,  11);
}

--[[
Background      = Color3.fromRGB(233, 233, 233);
Border          = Color3.fromRGB(149, 149, 149);
Selected        = Color3.fromRGB( 96, 140, 211);
BorderSelected  = Color3.fromRGB( 86, 125, 188);
Text            = Color3.fromRGB(  0,   0,   0);
TextDisabled    = Color3.fromRGB(128, 128, 128);
TextSelected    = Color3.fromRGB(255, 255, 255);
Button          = Color3.fromRGB(221, 221, 221);
ButtonBorder    = Color3.fromRGB(149, 149, 149);
ButtonSelected  = Color3.fromRGB(255,   0,   0);
Field           = Color3.fromRGB(255, 255, 255);
FieldBorder     = Color3.fromRGB(191, 191, 191);
TitleBackground = Color3.fromRGB(178, 178, 178);
]]

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
---- Icon map constants

local MAP_ID = 483448923

-- Indices based on implementation of Icon function.
local ACTION_CUT         	 = 160
local ACTION_COPY        	 = 161
local ACTION_PASTE       	 = 162
local ACTION_DELETE      	 = 163
local ACTION_SORT        	 = 164
local ACTION_CUT_OVER    	 = 174
local ACTION_COPY_OVER   	 = 175
local ACTION_PASTE_OVER  	 = 176
local ACTION_DELETE_OVER	 = 177
local ACTION_SORT_OVER  	 = 178
local ACTION_EDITQUICKACCESS = 190
local ACTION_FREEZE 		 = 188
local ACTION_STARRED 		 = 189
local ACTION_ADDSTAR 		 = 184
local ACTION_ADDSTAR_OVER 	 = 187

local NODE_COLLAPSED      = 165
local NODE_EXPANDED       = 166
local NODE_COLLAPSED_OVER = 179
local NODE_EXPANDED_OVER  = 180

local ExplorerIndex = {
	["Accessory"] = 32;
	["Accoutrement"] = 32;
	["AdService"] = 73;
	["Animation"] = 60;
	["AnimationController"] = 60;
	["AnimationTrack"] = 60;
	["Animator"] = 60;
	["ArcHandles"] = 56;
	["AssetService"] = 72;
	["Attachment"] = 34;
	["Backpack"] = 20;
	["BadgeService"] = 75;
	["BallSocketConstraint"] = 89;
	["BillboardGui"] = 64;
	["BinaryStringValue"] = 4;
	["BindableEvent"] = 67;
	["BindableFunction"] = 66;
	["BlockMesh"] = 8;
	["BloomEffect"] = 90;
	["BlurEffect"] = 90;
	["BodyAngularVelocity"] = 14;
	["BodyForce"] = 14;
	["BodyGyro"] = 14;
	["BodyPosition"] = 14;
	["BodyThrust"] = 14;
	["BodyVelocity"] = 14;
	["BoolValue"] = 4;
	["BoxHandleAdornment"] = 54;
	["BrickColorValue"] = 4;
	["Camera"] = 5;
	["CFrameValue"] = 4;
	["CharacterMesh"] = 60;
	["Chat"] = 33;
	["ClickDetector"] = 41;
	["CollectionService"] = 30;
	["Color3Value"] = 4;
	["ColorCorrectionEffect"] = 90;
	["ConeHandleAdornment"] = 54;
	["Configuration"] = 58;
	["ContentProvider"] = 72;
	["ContextActionService"] = 41;
	["CoreGui"] = 46;
	["CoreScript"] = 18;
	["CornerWedgePart"] = 1;
	["CustomEvent"] = 4;
	["CustomEventReceiver"] = 4;
	["CylinderHandleAdornment"] = 54;
	["CylinderMesh"] = 8;
	["CylindricalConstraint"] = 89;
	["Debris"] = 30;
	["Decal"] = 7;
	["Dialog"] = 62;
	["DialogChoice"] = 63;
	["DoubleConstrainedValue"] = 4;
	["Explosion"] = 36;
	["FileMesh"] = 8;
	["Fire"] = 61;
	["Flag"] = 38;
	["FlagStand"] = 39;
	["FloorWire"] = 4;
	["Folder"] = 70;
	["ForceField"] = 37;
	["Frame"] = 48;
	["GamePassService"] = 19;
	["Glue"] = 34;
	["GuiButton"] = 52;
	["GuiMain"] = 47;
	["GuiService"] = 47;
	["Handles"] = 53;
	["HapticService"] = 84;
	["Hat"] = 45;
	["HingeConstraint"] = 89;
	["Hint"] = 33;
	["HopperBin"] = 22;
	["HttpService"] = 76;
	["Humanoid"] = 9;
	["ImageButton"] = 52;
	["ImageLabel"] = 49;
	["InsertService"] = 72;
	["IntConstrainedValue"] = 4;
	["IntValue"] = 4;
	["JointInstance"] = 34;
	["JointsService"] = 34;
	["Keyframe"] = 60;
	["KeyframeSequence"] = 60;
	["KeyframeSequenceProvider"] = 60;
	["Lighting"] = 13;
	["LineHandleAdornment"] = 54;
	["LocalScript"] = 18;
	["LogService"] = 87;
	["MarketplaceService"] = 46;
	["Message"] = 33;
	["Model"] = 2;
	["ModuleScript"] = 71;
	["Motor"] = 34;
	["Motor6D"] = 34;
	["MoveToConstraint"] = 89;
	["NegateOperation"] = 78;
	["NetworkClient"] = 16;
	["NetworkReplicator"] = 29;
	["NetworkServer"] = 15;
	["NumberValue"] = 4;
	["ObjectValue"] = 4;
	["Pants"] = 44;
	["ParallelRampPart"] = 1;
	["Part"] = 1;
	["ParticleEmitter"] = 69;
	["PartPairLasso"] = 57;
	["PathfindingService"] = 37;
	["Platform"] = 35;
	["Player"] = 12;
	["PlayerGui"] = 46;
	["Players"] = 21;
	["PlayerScripts"] = 82;
	["PointLight"] = 13;
	["PointsService"] = 83;
	["Pose"] = 60;
	["PrismaticConstraint"] = 89;
	["PrismPart"] = 1;
	["PyramidPart"] = 1;
	["RayValue"] = 4;
	["ReflectionMetadata"] = 86;
	["ReflectionMetadataCallbacks"] = 86;
	["ReflectionMetadataClass"] = 86;
	["ReflectionMetadataClasses"] = 86;
	["ReflectionMetadataEnum"] = 86;
	["ReflectionMetadataEnumItem"] = 86;
	["ReflectionMetadataEnums"] = 86;
	["ReflectionMetadataEvents"] = 86;
	["ReflectionMetadataFunctions"] = 86;
	["ReflectionMetadataMember"] = 86;
	["ReflectionMetadataProperties"] = 86;
	["ReflectionMetadataYieldFunctions"] = 86;
	["RemoteEvent"] = 80;
	["RemoteFunction"] = 79;
	["ReplicatedFirst"] = 72;
	["ReplicatedStorage"] = 72;
	["RightAngleRampPart"] = 1;
	["RocketPropulsion"] = 14;
	["RodConstraint"] = 89;
	["RopeConstraint"] = 89;
	["Rotate"] = 34;
	["RotateP"] = 34;
	["RotateV"] = 34;
	["RunService"] = 66;
	["ScreenGui"] = 47;
	["Script"] = 6;
	["ScrollingFrame"] = 48;
	["Seat"] = 35;
	["Selection"] = 55;
	["SelectionBox"] = 54;
	["SelectionPartLasso"] = 57;
	["SelectionPointLasso"] = 57;
	["SelectionSphere"] = 54;
	["ServerScriptService"] = 0;
	["Shirt"] = 43;
	["ShirtGraphic"] = 40;
	["SkateboardPlatform"] = 35;
	["Sky"] = 28;
	["SlidingBallConstraint"] = 89;
	["Smoke"] = 59;
	["Snap"] = 34;
	["Sound"] = 11;
	["SoundService"] = 31;
	["Sparkles"] = 42;
	["SpawnLocation"] = 25;
	["SpecialMesh"] = 8;
	["SphereHandleAdornment"] = 54;
	["SpotLight"] = 13;
	["SpringConstraint"] = 89;
	["StarterCharacterScripts"] = 82;
	["StarterGear"] = 20;
	["StarterGui"] = 46;
	["StarterPack"] = 20;
	["StarterPlayer"] = 88;
	["StarterPlayerScripts"] = 82;
	["Status"] = 2;
	["StringValue"] = 4;
	["SunRaysEffect"] = 90;
	["SurfaceGui"] = 64;
	["SurfaceLight"] = 13;
	["SurfaceSelection"] = 55;
	["Team"] = 24;
	["Teams"] = 23;
	["TeleportService"] = 81;
	["Terrain"] = 65;
	["TerrainRegion"] = 65;
	["TestService"] = 68;
	["TextBox"] = 51;
	["TextButton"] = 51;
	["TextLabel"] = 50;
	["Texture"] = 10;
	["TextureTrail"] = 4;
	["Tool"] = 17;
	["TouchTransmitter"] = 37;
	["TrussPart"] = 1;
	["UnionOperation"] = 77;
	["UserInputService"] = 84;
	["Vector3Value"] = 4;
	["VehicleSeat"] = 35;
	["VelocityMotor"] = 34;
	["WedgePart"] = 1;
	["Weld"] = 34;
	["Workspace"] = 19;
}

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------

function Create(ty,data)
	local obj
	if type(ty) == 'string' then
		obj = Instance.new(ty)
	else
		obj = ty
	end
	for k, v in pairs(data) do
		if type(k) == 'number' then
			v.Parent = obj
		else
			obj[k] = v
		end
	end
	return obj
end

local barActive = false
local activeOptions = {}

function createDDown(dBut, callback,...)
	if barActive then
		for i,v in pairs(activeOptions) do
			v:Destroy()
		end
		activeOptions = {}
		barActive = false
		return
	else
		barActive = true
	end
	local slots = {...}
	local base = dBut
	for i,v in pairs(slots) do
		local newOption = base:Clone()
		newOption.ZIndex = 5
		newOption.Name = "Option "..tostring(i)
		newOption.Parent = base.Parent.Parent.Parent
		newOption.BackgroundTransparency = 0
		newOption.ZIndex = 2
		table.insert(activeOptions,newOption)
		newOption.Position = UDim2.new(-0.4, dBut.Position.X.Offset, dBut.Position.Y.Scale, dBut.Position.Y.Offset + (#activeOptions * dBut.Size.Y.Offset))
		newOption.Text = slots[i]
		newOption.MouseButton1Down:connect(function()
			dBut.Text = slots[i]
			callback(slots[i])
			for i,v in pairs(activeOptions) do
				v:Destroy()
			end
			activeOptions = {}
			barActive = false
		end)
	end
end

-- Connects a function to an event such that it fires asynchronously
function Connect(event,func)
	return event:connect(function(...)
		local a = {...}
		spawn(function() func(unpack(a)) end)
	end)
end

-- returns the ascendant ScreenGui of an object
function GetScreen(screen)
	if screen == nil then return nil end
	while not screen:IsA("ScreenGui") do
		screen = screen.Parent
		if screen == nil then return nil end
	end
	return screen
end

do
	local ZIndexLock = {}
	-- Sets the ZIndex of an object and its descendants. Objects are locked so
	-- that SetZIndexOnChanged doesn't spawn multiple threads that set the
	-- ZIndex of the same object.
	function SetZIndex(object,z)
		if not ZIndexLock[object] then
			ZIndexLock[object] = true
			if object:IsA'GuiObject' then
				object.ZIndex = z
			end
			local children = object:GetChildren()
			for i = 1,#children do
				SetZIndex(children[i],z)
			end
			ZIndexLock[object] = nil
		end
	end

	function SetZIndexOnChanged(object)
		return object.Changed:connect(function(p)
			if p == "ZIndex" then
				SetZIndex(object,object.ZIndex)
			end
		end)
	end
end

---- IconMap ----
-- Image size: 256px x 256px
-- Icon size: 16px x 16px
-- Padding between each icon: 2px
-- Padding around image edge: 1px
-- Total icons: 14 x 14 (196)
local Icon do
	local iconMap = 'http://www.roblox.com/asset/?id=' .. MAP_ID
	game:GetService('ContentProvider'):Preload(iconMap)
	local iconDehash do
		-- 14 x 14, 0-based input, 0-based output
		local f=math.floor
		function iconDehash(h)
			return f(h/14%14),f(h%14)
		end
	end

	function Icon(IconFrame,index,abc)
		local row,col = iconDehash(index)
		local mapSize = Vector2.new(256,256)
		local pad,border = 2,1
		local iconSize = 16

		local class = 'Frame'
		if type(IconFrame) == 'string' then
			class = IconFrame
			IconFrame = nil
		end

        if not IconFrame then
			IconFrame = Create(class,{
				Name = "Icon";
				BackgroundTransparency = 1;
                ClipsDescendants = true;
				Create('ImageLabel',{
					Name = "IconMap";
					Active = false;
                    BackgroundTransparency = 1;
					Image = iconMap;
					Size = UDim2.new(mapSize.x/iconSize,0,mapSize.y/iconSize,0);
				});
			})
		end
        if IconFrame:IsA'GuiButton' then
            IconFrame.AutoButtonColor = not abc;
        end
		IconFrame.IconMap.Position = UDim2.new(-col - (pad*(col+1) + border)/iconSize,0,-row - (pad*(row+1) + border)/iconSize,0)
		return IconFrame
	end
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
---- ScrollBar
do
	-- AutoButtonColor doesn't always reset properly
	local function ResetButtonColor(button)
		local active = button.Active
		button.Active = not active
		button.Active = active
	end

	local function ArrowGraphic(size,dir,scaled,template)
		local Frame = Create('Frame',{
			Name = "Arrow Graphic";
			BorderSizePixel = 0;
			Size = UDim2.new(0,size,0,size);
			Transparency = 1;
		})
		if not template then
			template = Instance.new("Frame")
			template.BorderSizePixel = 0
		end

		template.BackgroundColor3 = Color3.new(1, 1, 1);

		local transform
		if dir == nil or dir == 'Up' then
			function transform(p,s) return p,s end
		elseif dir == 'Down' then
			function transform(p,s) return UDim2.new(0,p.X.Offset,0,size-p.Y.Offset-1),s end
		elseif dir == 'Left' then
			function transform(p,s) return UDim2.new(0,p.Y.Offset,0,p.X.Offset),UDim2.new(0,s.Y.Offset,0,s.X.Offset) end
		elseif dir == 'Right' then
			function transform(p,s) return UDim2.new(0,size-p.Y.Offset-1,0,p.X.Offset),UDim2.new(0,s.Y.Offset,0,s.X.Offset) end
		end

		local scale
		if scaled then
			function scale(p,s) return UDim2.new(p.X.Offset/size,0,p.Y.Offset/size,0),UDim2.new(s.X.Offset/size,0,s.Y.Offset/size,0) end
		else
			function scale(p,s) return p,s end
		end

		local o = math.floor(size/4)
		if size%2 == 0 then
			local n = size/2-1
			for i = 0,n do
				local t = template:Clone()
				local p,s = scale(transform(
					UDim2.new(0,n-i,0,o+i),
					UDim2.new(0,(i+1)*2,0,1)
				))
				t.Position = p
				t.Size = s
				t.Parent = Frame
			end
		else
			local n = (size-1)/2
			for i = 0,n do
				local t = template:Clone()
				local p,s = scale(transform(
					UDim2.new(0,n-i,0,o+i),
					UDim2.new(0,i*2+1,0,1)
				))
				t.Position = p
				t.Size = s
				t.Parent = Frame
			end
		end
		if size%4 > 1 then
			local t = template:Clone()
			local p,s = scale(transform(
				UDim2.new(0,0,0,size-o-1),
				UDim2.new(0,size,0,1)
			))
			t.Position = p
			t.Size = s
			t.Parent = Frame
		end

		for i,v in pairs(Frame:GetChildren()) do
			v.BackgroundColor3 = Color3.new(1, 1, 1);
		end

		return Frame
	end


	local function GripGraphic(size,dir,spacing,scaled,template)
		local Frame = Create('Frame',{
			Name = "Grip Graphic";
			BorderSizePixel = 0;
			Size = UDim2.new(0,size.x,0,size.y);
			Transparency = 1;
		})
		if not template then
			template = Instance.new("Frame")
			template.BorderSizePixel = 0
		end

		spacing = spacing or 2

		local scale
		if scaled then
			function scale(p) return UDim2.new(p.X.Offset/size.x,0,p.Y.Offset/size.y,0) end
		else
			function scale(p) return p end
		end

		if dir == 'Vertical' then
			for i=0,size.x-1,spacing do
				local t = template:Clone()
				t.Size = scale(UDim2.new(0,1,0,size.y))
				t.Position = scale(UDim2.new(0,i,0,0))
				t.Parent = Frame
			end
		elseif dir == nil or dir == 'Horizontal' then
			for i=0,size.y-1,spacing do
				local t = template:Clone()
				t.Size = scale(UDim2.new(0,size.x,0,1))
				t.Position = scale(UDim2.new(0,0,0,i))
				t.Parent = Frame
			end
		end

		return Frame
	end

	local mt = {
		__index = {
			GetScrollPercent = function(self)
				return self.ScrollIndex/(self.TotalSpace-self.VisibleSpace)
			end;
			CanScrollDown = function(self)
				return self.ScrollIndex + self.VisibleSpace < self.TotalSpace
			end;
			CanScrollUp = function(self)
				return self.ScrollIndex > 0
			end;
			ScrollDown = function(self)
				self.ScrollIndex = self.ScrollIndex + self.PageIncrement
				self:Update()
			end;
			ScrollUp = function(self)
				self.ScrollIndex = self.ScrollIndex - self.PageIncrement
				self:Update()
			end;
			ScrollTo = function(self,index)
				self.ScrollIndex = index
				self:Update()
			end;
			SetScrollPercent = function(self,percent)
				self.ScrollIndex = math.floor((self.TotalSpace - self.VisibleSpace)*percent + 0.5)
				self:Update()
			end;
		};
	}
	mt.__index.CanScrollRight = mt.__index.CanScrollDown
	mt.__index.CanScrollLeft = mt.__index.CanScrollUp
	mt.__index.ScrollLeft = mt.__index.ScrollUp
	mt.__index.ScrollRight = mt.__index.ScrollDown

	local ScrollStyles = {
		Background      = Color3.fromRGB(233, 233, 233);
		Border          = Color3.fromRGB(149, 149, 149);
		Selected        = Color3.fromRGB( 63, 119, 189);
		BorderSelected  = Color3.fromRGB( 55, 106, 167);
		Text            = Color3.fromRGB(  0,   0,   0);
		TextDisabled    = Color3.fromRGB(128, 128, 128);
		TextSelected    = Color3.fromRGB(255, 255, 255);
		Button          = Color3.fromRGB( 35,  35,  35);
		ButtonBorder    = Color3.fromRGB(149, 149, 149);
		ButtonSelected  = Color3.fromRGB(255,   0,   0);
		Field           = Color3.fromRGB(255, 255, 255);
		FieldBorder     = Color3.fromRGB(191, 191, 191);
		TitleBackground = Color3.fromRGB(178, 178, 178);
	}

	function ScrollBar(horizontal)
		-- create row scroll bar
		local ScrollBarWidth = GUI_SIZE;
		local ScrollFrame = Create('Frame',{
			Name = "ScrollFrame";
			Position = horizontal and UDim2.new(0,0,1,-ScrollBarWidth) or UDim2.new(1,-ScrollBarWidth,0,0);
			Size = horizontal and UDim2.new(1,0,0,ScrollBarWidth) or UDim2.new(0,ScrollBarWidth,1,0);
			BackgroundTransparency = 1;
			Create('ImageButton',{
				Name = "ScrollDown";
				Position = horizontal and UDim2.new(1,-ScrollBarWidth,0,0) or UDim2.new(0,0,1,-ScrollBarWidth);
				Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
				BackgroundColor3 = ScrollStyles.Button;
				BorderColor3 = ScrollStyles.Border;
				BorderSizePixel = 0;
			});
			Create('ImageButton',{
				Name = "ScrollUp";
				Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
				BackgroundColor3 = ScrollStyles.Button;
				BorderColor3 = ScrollStyles.Border;
				BorderSizePixel = 0;
			});
			Create('ImageButton',{
				Name = "ScrollBar";
				Size = horizontal and UDim2.new(1,-ScrollBarWidth*2,1,0) or UDim2.new(1,0,1,-ScrollBarWidth*2);
				Position = horizontal and UDim2.new(0,ScrollBarWidth,0,0) or UDim2.new(0,0,0,ScrollBarWidth);
				AutoButtonColor = false;
				BackgroundColor3 = Color3.fromRGB(20, 20, 20);
				BorderColor3 = ScrollStyles.Border;
				BorderSizePixel = 0;
				Create('ImageButton',{
					Name = "ScrollThumb";
					AutoButtonColor = false;
					Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
					BackgroundColor3 = ScrollStyles.Button;
					BorderColor3 = ScrollStyles.Border;
					BorderSizePixel = 0;
				});
			});
		})

		local graphicTemplate = Create('Frame',{
			Name="Graphic";
			BorderSizePixel = 0;
			BackgroundColor3 = Color3.new(1, 1, 1);
		})
		local graphicSize = GUI_SIZE/2

		local ScrollDownFrame = ScrollFrame.ScrollDown
			local ScrollDownGraphic = ArrowGraphic(graphicSize,horizontal and 'Right' or 'Down',true,graphicTemplate)
			ScrollDownGraphic.Position = UDim2.new(0.5,-graphicSize/2,0.5,-graphicSize/2)
			ScrollDownGraphic.Parent = ScrollDownFrame
		local ScrollUpFrame = ScrollFrame.ScrollUp
			local ScrollUpGraphic = ArrowGraphic(graphicSize,horizontal and 'Left' or 'Up',true,graphicTemplate)
			ScrollUpGraphic.Position = UDim2.new(0.5,-graphicSize/2,0.5,-graphicSize/2)
			ScrollUpGraphic.Parent = ScrollUpFrame
		local ScrollBarFrame = ScrollFrame.ScrollBar
		local ScrollThumbFrame = ScrollBarFrame.ScrollThumb
		do
			local size = GUI_SIZE*3/8
			local Decal = GripGraphic(Vector2.new(size,size),horizontal and 'Vertical' or 'Horizontal',2,graphicTemplate)
			Decal.Position = UDim2.new(0.5,-size/2,0.5,-size/2)
			Decal.Parent = ScrollThumbFrame
		end

		local Class = setmetatable({
			GUI = ScrollFrame;
			ScrollIndex = 0;
			VisibleSpace = 0;
			TotalSpace = 0;
			PageIncrement = 1;
		},mt)

		local UpdateScrollThumb
		if horizontal then
			function UpdateScrollThumb()
				ScrollThumbFrame.Size = UDim2.new(Class.VisibleSpace/Class.TotalSpace,0,0,GUI_SIZE)
				if ScrollThumbFrame.AbsoluteSize.x < GUI_SIZE then
					ScrollThumbFrame.Size = UDim2.new(0,GUI_SIZE,0,GUI_SIZE)
				end
				local barSize = ScrollBarFrame.AbsoluteSize.x
				ScrollThumbFrame.Position = UDim2.new(Class:GetScrollPercent()*(barSize - ScrollThumbFrame.AbsoluteSize.x)/barSize,0,0,0)
			end
		else
			function UpdateScrollThumb()
				ScrollThumbFrame.Size = UDim2.new(0,GUI_SIZE,Class.VisibleSpace/Class.TotalSpace,0)
				if ScrollThumbFrame.AbsoluteSize.y < GUI_SIZE then
					ScrollThumbFrame.Size = UDim2.new(0,GUI_SIZE,0,GUI_SIZE)
				end
				local barSize = ScrollBarFrame.AbsoluteSize.y
				ScrollThumbFrame.Position = UDim2.new(0,0,Class:GetScrollPercent()*(barSize - ScrollThumbFrame.AbsoluteSize.y)/barSize,0)
			end
		end

		local lastDown
		local lastUp
		local scrollStyle = {BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=0}
		local scrollStyle_ds = {BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=0.7}

		local function Update()
			local t = Class.TotalSpace
			local v = Class.VisibleSpace
			local s = Class.ScrollIndex
			if v <= t then
				if s > 0 then
					if s + v > t then
						Class.ScrollIndex = t - v
					end
				else
					Class.ScrollIndex = 0
				end
			else
				Class.ScrollIndex = 0
			end

			if Class.UpdateCallback then
				if Class.UpdateCallback(Class) == false then
					return
				end
			end

			local down = Class:CanScrollDown()
			local up = Class:CanScrollUp()
			if down ~= lastDown then
				lastDown = down
				ScrollDownFrame.Active = down
				ScrollDownFrame.AutoButtonColor = down
				local children = ScrollDownGraphic:GetChildren()
				local style = down and scrollStyle or scrollStyle_ds
				for i = 1,#children do
					Create(children[i],style)
				end
			end
			if up ~= lastUp then
				lastUp = up
				ScrollUpFrame.Active = up
				ScrollUpFrame.AutoButtonColor = up
				local children = ScrollUpGraphic:GetChildren()
				local style = up and scrollStyle or scrollStyle_ds
				for i = 1,#children do
					Create(children[i],style)
				end
			end
			ScrollThumbFrame.Visible = down or up
			UpdateScrollThumb()
		end
		Class.Update = Update

		SetZIndexOnChanged(ScrollFrame)

		local MouseDrag = Create('ImageButton',{
			Name = "MouseDrag";
			Position = UDim2.new(-0.25,0,-0.25,0);
			Size = UDim2.new(1.5,0,1.5,0);
			Transparency = 1;
			AutoButtonColor = false;
			Active = true;
			ZIndex = 10;
		})

		local scrollEventID = 0
		ScrollDownFrame.MouseButton1Down:connect(function()
			scrollEventID = tick()
			local current = scrollEventID
			local up_con
			up_con = MouseDrag.MouseButton1Up:connect(function()
				scrollEventID = tick()
				MouseDrag.Parent = nil
				ResetButtonColor(ScrollDownFrame)
				up_con:disconnect(); drag = nil
			end)
			MouseDrag.Parent = GetScreen(ScrollFrame)
			Class:ScrollDown()
			wait(0.2) -- delay before auto scroll
			while scrollEventID == current do
				Class:ScrollDown()
				if not Class:CanScrollDown() then break end
				wait()
			end
		end)

		ScrollDownFrame.MouseButton1Up:connect(function()
			scrollEventID = tick()
		end)

		ScrollUpFrame.MouseButton1Down:connect(function()
			scrollEventID = tick()
			local current = scrollEventID
			local up_con
			up_con = MouseDrag.MouseButton1Up:connect(function()
				scrollEventID = tick()
				MouseDrag.Parent = nil
				ResetButtonColor(ScrollUpFrame)
				up_con:disconnect(); drag = nil
			end)
			MouseDrag.Parent = GetScreen(ScrollFrame)
			Class:ScrollUp()
			wait(0.2)
			while scrollEventID == current do
				Class:ScrollUp()
				if not Class:CanScrollUp() then break end
				wait()
			end
		end)

		ScrollUpFrame.MouseButton1Up:connect(function()
			scrollEventID = tick()
		end)

		if horizontal then
			ScrollBarFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local current = scrollEventID
				local up_con
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollUpFrame)
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
				if x > ScrollThumbFrame.AbsolutePosition.x then
					Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if x < ScrollThumbFrame.AbsolutePosition.x + ScrollThumbFrame.AbsoluteSize.x then break end
						Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
						wait()
					end
				else
					Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if x > ScrollThumbFrame.AbsolutePosition.x then break end
						Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
						wait()
					end
				end
			end)
		else
			ScrollBarFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local current = scrollEventID
				local up_con
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollUpFrame)
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
				if y > ScrollThumbFrame.AbsolutePosition.y then
					Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if y < ScrollThumbFrame.AbsolutePosition.y + ScrollThumbFrame.AbsoluteSize.y then break end
						Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
						wait()
					end
				else
					Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if y > ScrollThumbFrame.AbsolutePosition.y then break end
						Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
						wait()
					end
				end
			end)
		end

		if horizontal then
			ScrollThumbFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local mouse_offset = x - ScrollThumbFrame.AbsolutePosition.x
				local drag_con
				local up_con
				drag_con = MouseDrag.MouseMoved:connect(function(x,y)
					if not UserInputService:IsMouseButtonPressed'MouseButton1' then
						scrollEventID = tick()
						MouseDrag.Parent = nil
						ResetButtonColor(ScrollThumbFrame)
						drag_con:disconnect(); drag_con = nil
						up_con:disconnect(); drag = nil
					end
					local bar_abs_pos = ScrollBarFrame.AbsolutePosition.x
					local bar_drag = ScrollBarFrame.AbsoluteSize.x - ScrollThumbFrame.AbsoluteSize.x
					local bar_abs_one = bar_abs_pos + bar_drag
					x = x - mouse_offset
					x = x < bar_abs_pos and bar_abs_pos or x > bar_abs_one and bar_abs_one or x
					x = x - bar_abs_pos
					Class:SetScrollPercent(x/(bar_drag))
				end)
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollThumbFrame)
					drag_con:disconnect(); drag_con = nil
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
			end)
		else
			ScrollThumbFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local mouse_offset = y - ScrollThumbFrame.AbsolutePosition.y
				local drag_con
				local up_con
				drag_con = MouseDrag.MouseMoved:connect(function(x,y)
					if not UserInputService:IsMouseButtonPressed'MouseButton1' then
						scrollEventID = tick()
						MouseDrag.Parent = nil
						ResetButtonColor(ScrollThumbFrame)
						drag_con:disconnect(); drag_con = nil
						up_con:disconnect(); drag = nil
					end
					local bar_abs_pos = ScrollBarFrame.AbsolutePosition.y
					local bar_drag = ScrollBarFrame.AbsoluteSize.y - ScrollThumbFrame.AbsoluteSize.y
					local bar_abs_one = bar_abs_pos + bar_drag
					y = y - mouse_offset
					y = y < bar_abs_pos and bar_abs_pos or y > bar_abs_one and bar_abs_one or y
					y = y - bar_abs_pos
					Class:SetScrollPercent(y/(bar_drag))
				end)
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollThumbFrame)
					drag_con:disconnect(); drag_con = nil
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
			end)
		end

		function Class:Destroy()
			ScrollFrame:Destroy()
			MouseDrag:Destroy()
			for k in pairs(Class) do
				Class[k] = nil
			end
			setmetatable(Class,nil)
		end

		Update()

		return Class
	end
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
---- Explorer panel

local explorerPanel = D_E_X.ExplorerPanel
Create(explorerPanel,{
	BackgroundColor3 = GuiColor.Field;
	BorderColor3 = GuiColor.Border;
	Active = true;
})

local SettingsRemote = explorerPanel.Parent:WaitForChild("SettingsPanel"):WaitForChild("GetSetting")
local GetApiRemote = explorerPanel.Parent:WaitForChild("PropertiesFrame"):WaitForChild("GetApi")
local GetAwaitRemote = explorerPanel.Parent:WaitForChild("PropertiesFrame"):WaitForChild("GetAwaiting")
local bindSetAwaiting = explorerPanel.Parent:WaitForChild("PropertiesFrame"):WaitForChild("SetAwaiting")

local SaveInstanceWindow = explorerPanel.Parent:WaitForChild("SaveInstance")
local ConfirmationWindow = explorerPanel.Parent:WaitForChild("Confirmation")
local CautionWindow = explorerPanel.Parent:WaitForChild("Caution")
local TableCautionWindow = explorerPanel.Parent:WaitForChild("TableCaution")

local RemoteWindow = explorerPanel.Parent:WaitForChild("CallRemote")

local ScriptEditor = explorerPanel.Parent:WaitForChild("ScriptEditor")
local ScriptEditorEvent = ScriptEditor:WaitForChild("OpenScript")

local CurrentSaveInstanceWindow
local CurrentRemoteWindow

local lastSelectedNode

local DexStorage
local DexStorageMain
local DexStorageEnabled

if saveinstance then DexStorageEnabled = true end

if DexStorageEnabled then
	DexStorage = Instance.new("Folder")
	DexStorage.Name = "Dex"
	DexStorageMain = Instance.new("Folder", DexStorage)
	DexStorageMain.Name = "DexStorage"
end

local RunningScriptsStorage
local RunningScriptsStorageMain
local RunningScriptsStorageEnabled

if getscripts then RunningScriptsStorageEnabled = true end

if RunningScriptsStorageEnabled then
	RunningScriptsStorage = Instance.new("Folder")
	RunningScriptsStorage.Name = "Dex Internal Storage"
	RunningScriptsStorageMain = Instance.new("Folder", RunningScriptsStorage)
	RunningScriptsStorageMain.Name = "Running Scripts"
end

local UpvalueStorage
local UpvalueStorageVariables
local UpvalueStorageFunctions
local UpvalueStorageEnabled

if vars and funcs then UpvalueStorageEnabled = true end

if UpvalueStorageEnabled then
	UpvalueStorage = Instance.new('Folder')
	UpvalueStorage.Name = 'Upvalue Storage'
	UpvalueStorageVariables = Instance.new("Folder", UpvalueStorage)
	UpvalueStorageVariables.Name = "Upvalue Variables"
	UpvalueStorageFunctions = Instance.new("Folder", UpvalueStorage)
	UpvalueStorageFunctions.Name = "Upvalue Functions"
	for i, v in pairs(vars) do
		pcall(function()
			local n = Instance.new('StringValue', UpvalueStorageVariables)
			n.Name = tostring(i);
			n.Value = tostring(v);
		end)
	end
	for i, v in pairs(funcs) do
		pcall(function()
			local n = Instance.new('StringValue', UpvalueStorageFunctions)
			n.Name = tostring(i);
			n.Value = tostring(v);
		end)
	end
end

local listFrame = Create('Frame',{
	Name = "List";
	BackgroundTransparency = 1;
	ClipsDescendants = true;
	Position = UDim2.new(0,0,0,HEADER_SIZE);
	Size = UDim2.new(1,-GUI_SIZE,1,-HEADER_SIZE);
	Parent = explorerPanel;
})

local scrollBar = ScrollBar(false)
scrollBar.PageIncrement = 1
Create(scrollBar.GUI,{
	Position = UDim2.new(1,-GUI_SIZE,0,HEADER_SIZE);
	Size = UDim2.new(0,GUI_SIZE,1,-HEADER_SIZE);
	Parent = explorerPanel;
})

local scrollBarH = ScrollBar(true)
scrollBarH.PageIncrement = GUI_SIZE
Create(scrollBarH.GUI,{
	Position = UDim2.new(0,0,1,-GUI_SIZE);
	Size = UDim2.new(1,-GUI_SIZE,0,GUI_SIZE);
	Visible = false;
	Parent = explorerPanel;
})

local headerFrame = Create('Frame',{
	Name = "Header";
	BackgroundColor3 = GuiColor.Background;
	BorderColor3 = GuiColor.Border;
	Position = UDim2.new(0,0,0,0);
	Size = UDim2.new(1,0,0,HEADER_SIZE);
	Parent = explorerPanel;
	Create('TextLabel',{
		Text = "Explorer";
		BackgroundTransparency = 1;
		TextColor3 = GuiColor.Text;
		TextXAlignment = 'Left';
		Font = FONT;
		FontSize = FONT_SIZE;
		Position = UDim2.new(0,4,0,0);
		Size = UDim2.new(1,-4,0.5,0);
	});
})

local explorerFilter = 	Create('TextBox',{
	Text = "Filter Workspace";
	BackgroundTransparency = 0.8;
	TextColor3 = GuiColor.Text;
	TextXAlignment = 'Left';
	Font = FONT;
	FontSize = FONT_SIZE;
	Position = UDim2.new(0,4,0.5,0);
	Size = UDim2.new(1,-8,0.5,-2);
});
explorerFilter.Parent = headerFrame

SetZIndexOnChanged(explorerPanel)

local function CreateColor3(r, g, b) return Color3.new(r/255,g/255,b/255) end

local Styles = {
	Font = Enum.Font.Arial;
	Margin = 5;
	Black = CreateColor3(0,0,0);
	White = CreateColor3(32,32,32);
}

local Row = {
	Font = Styles.Font;
	FontSize = Enum.FontSize.Size14;
	TextXAlignment = Enum.TextXAlignment.Left;
	TextColor = Styles.Black;
	TextColorOver = Styles.White;
	TextLockedColor = CreateColor3(155,155,155);
	Height = 24;
	BorderColor = CreateColor3(216/4,216/4,216/4);
	BackgroundColor = Styles.White;
	BackgroundColorAlternate = CreateColor3(32, 32, 32);
	BackgroundColorMouseover = CreateColor3(40, 40, 40);
	TitleMarginLeft = 15;
}

local DropDown = {
	Font = Styles.Font;
	FontSize = Enum.FontSize.Size14;
	TextColor = CreateColor3(255,255,255);
	TextColorOver = Color3.new(1, 1, 1);
	TextXAlignment = Enum.TextXAlignment.Left;
	Height = 16;
	BackColor = Styles.White;
	BackColorOver = CreateColor3(197, 28, 70);
	BorderColor = CreateColor3(45,45,45);
	BorderSizePixel = 2;
	ArrowColor = CreateColor3(160/2,160/2,160/2);
	ArrowColorOver = Styles.Black;
}

local currentRightClickMenu
local CurrentInsertObjectWindow
local CurrentFunctionCallerWindow

local RbxApi

function ClassCanCreate(IName)
	local success,err = pcall(function() Instance.new(IName) end)
	if err then
		return false
	else
		return true
	end
end

function GetClasses()
	if RbxApi == nil then return {} end
	local classTable = {}
	for i,v in pairs(RbxApi.Classes) do
		if ClassCanCreate(v.Name) then
			table.insert(classTable,v.Name)
		end
	end
	return classTable
end

local function sortAlphabetic(t, property)
	table.sort(t, 
		function(x,y) return x[property] < y[property]
	end)
end

local function FunctionIsHidden(functionData)
	local tags = functionData["tags"]
	for _,name in pairs(tags) do
		if name == "deprecated"
			or name == "hidden"
			or name == "writeonly" then
			return true
		end
	end
	return false
end

local function GetAllFunctions(className)
	local class = RbxApi.Classes[className]
	local functions = {}
	
	if not class then return functions end
	
	while class do
		if class.Name == "Instance" then break end
		for _,nextFunction in pairs(class.Functions) do
			if not FunctionIsHidden(nextFunction) then
				table.insert(functions, nextFunction)
			end
		end
		class = RbxApi.Classes[class.Superclass]
	end
	
	sortAlphabetic(functions, "Name")

	return functions
end

function GetFunctions()
	if RbxApi == nil then return {} end
	local List = SelectionVar():Get()
	
	if #List == 0 then return end
	
	local MyObject = List[1]
	
	local functionTable = {}
	for i,v in pairs(GetAllFunctions(MyObject.ClassName)) do
		table.insert(functionTable,v)
	end
	return functionTable
end

function CreateInsertObjectMenu(choices, currentChoice, readOnly, onClick)
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local totalSize = explorerPanel.Parent.AbsoluteSize.y
	if #choices == 0 then return end
	
	table.sort(choices, function(a,b) return a < b end)

	local frame = Instance.new("Frame")	
	frame.Name = "InsertObject"
	frame.Size = UDim2.new(0, 200, 1, 0)
	frame.BackgroundTransparency = 1
	frame.Active = true
    local closeCon;
	local menu;
	local arrow;
	local expanded = false
	local margin = DropDown.BorderSizePixel;
	
	--[[
	local button = Instance.new("TextButton")
	button.Font = Row.Font
	button.FontSize = Row.FontSize
	button.TextXAlignment = Row.TextXAlignment
	button.BackgroundTransparency = 1
	button.TextColor3 = Row.TextColor
	if readOnly then
		button.TextColor3 = Row.TextLockedColor
	end
	button.Text = currentChoice
	button.Size = UDim2.new(1, -2 * Styles.Margin, 1, 0)
	button.Position = UDim2.new(0, Styles.Margin, 0, 0)
	button.Parent = frame
	--]]
	
	local function hideMenu()
		expanded = false
		--showArrow(DropDown.ArrowColor)
		if frame then 
			--frame:Destroy()
            CurrentInsertObjectWindow.Visible = false
        end
        if closeCon then
            closeCon:Disconnect()
            closeCon = nil;
        end
	end
	
	local function showMenu()
		expanded = true
		menu = Instance.new("ScrollingFrame")
		menu.Size = UDim2.new(0,200,1,0)
		menu.CanvasSize = UDim2.new(0, 200, 0, #choices * DropDown.Height)
		menu.Position = UDim2.new(0, margin, 0, 0)
		menu.BackgroundTransparency = 0
		menu.BackgroundColor3 = DropDown.BackColor
		menu.BorderColor3 = DropDown.BorderColor
		menu.BorderSizePixel = DropDown.BorderSizePixel
		menu.TopImage = "rbxasset://textures/blackBkg_square.png"
		menu.MidImage = "rbxasset://textures/blackBkg_square.png"
		menu.BottomImage = "rbxasset://textures/blackBkg_square.png"
		menu.Active = true
		menu.ZIndex = 5
		menu.Parent = frame
		
		--local parentFrameHeight = script.Parent.List.Size.Y.Offset
		--local rowHeight = mouse.Y
		--if (rowHeight + menu.Size.Y.Offset) > parentFrameHeight then
		--	menu.Position = UDim2.new(0, margin, 0, -1 * (#choices * DropDown.Height) - margin)
		--end
			
		local function choice(name)
			onClick(name)
			hideMenu()
		end
		
		for i,name in pairs(choices) do
			local option = CreateRightClickMenuItem(name, function()
				choice(name)
			end,1)
			option.Size = UDim2.new(1, 0, 0, 20)
			option.Position = UDim2.new(0, 0, 0, (i - 1) * DropDown.Height)
			option.ZIndex = menu.ZIndex
			option.Parent = menu
        end
        
        local function isInGui(frame)
			local mloc = UserInputService:GetMouseLocation();
			local mouse = Vector2.new(mloc.X, mloc.Y - 36);
			
			local x1, x2 = frame.AbsolutePosition.X, frame.AbsolutePosition.X + frame.AbsoluteSize.X;
			local y1, y2 = frame.AbsolutePosition.Y, frame.AbsolutePosition.Y + frame.AbsoluteSize.Y;
		
			return (mouse.X >= x1 and mouse.X <= x2) and (mouse.Y >= y1 and mouse.Y <= y2)
		end

        closeCon = UserInputService.InputBegan:connect(function(m)
			if m.UserInputType == Enum.UserInputType.MouseButton1 then
				if menu and (not isInGui(menu)) then
					hideMenu()
				end
			end
		end)
	end


	showMenu()

	
	return frame
end

function CreateFunctionCallerMenu(choices, currentChoice, readOnly, onClick)
	local mouse = game:GetService'Players'.LocalPlayer:GetMouse()
	local totalSize = explorerPanel.Parent.AbsoluteSize.y
	if #choices == 0 then return end
	
	table.sort(choices, function(a,b) return a.Name < b.Name end)

	local frame = Instance.new("Frame")	
	frame.Name = "InsertObject"
	frame.Size = UDim2.new(0, 200, 1, 0)
	frame.BackgroundTransparency = 1
	frame.Active = true
	
	local menu = nil
	local arrow = nil
	local expanded = false
	local margin = DropDown.BorderSizePixel;
	
	local function hideMenu()
		expanded = false
		--showArrow(DropDown.ArrowColor)
		if frame then 
			--frame:Destroy()
			CurrentInsertObjectWindow.Visible = false
		end
	end
	
	local function showMenu()
		expanded = true
		menu = Instance.new("ScrollingFrame")
		menu.Size = UDim2.new(0,300,1,0)
		menu.CanvasSize = UDim2.new(0, 300, 0, #choices * DropDown.Height)
		menu.Position = UDim2.new(0, margin, 0, 0)
		menu.BackgroundTransparency = 0
		menu.BackgroundColor3 = DropDown.BackColor
		menu.BorderColor3 = DropDown.BorderColor
		menu.BorderSizePixel = DropDown.BorderSizePixel
		menu.TopImage = "rbxasset://textures/blackBkg_square.png"
		menu.MidImage = "rbxasset://textures/blackBkg_square.png"
		menu.BottomImage = "rbxasset://textures/blackBkg_square.png"
		menu.Active = true
		menu.ZIndex = 5
		menu.Parent = frame
		
		--local parentFrameHeight = script.Parent.List.Size.Y.Offset
		--local rowHeight = mouse.Y
		--if (rowHeight + menu.Size.Y.Offset) > parentFrameHeight then
		--	menu.Position = UDim2.new(0, margin, 0, -1 * (#choices * DropDown.Height) - margin)
		--end
		
		local function GetParameters(functionData)
			local paraString = ""
			paraString = paraString.."("
			for i,v in pairs(functionData.Arguments) do
				paraString = paraString..v.Type.." "..v.Name
				if i < #functionData.Arguments then
					paraString = paraString..", "
				end
			end
			paraString = paraString..")"
			return paraString
		end
			
		local function choice(name)
			onClick(name)
			hideMenu()
		end
		
		for i,name in pairs(choices) do
			local option = CreateRightClickMenuItem(name.ReturnType.." "..name.Name..GetParameters(name), function()
				choice(name)
			end,2)
			option.Size = UDim2.new(1, 0, 0, 20)
			option.Position = UDim2.new(0, 0, 0, (i - 1) * DropDown.Height)
			option.ZIndex = menu.ZIndex
			option.Parent = menu
		end
	end


	showMenu()

	
	return frame
end

function CreateInsertObject()
	if not CurrentInsertObjectWindow then return end
	CurrentInsertObjectWindow.Visible = true
	if currentRightClickMenu and CurrentInsertObjectWindow.Visible then
		CurrentInsertObjectWindow.Position = UDim2.new(0,currentRightClickMenu.Position.X.Offset-currentRightClickMenu.Size.X.Offset-2,0,0)
	end
	if CurrentInsertObjectWindow.Visible then
		CurrentInsertObjectWindow.Parent = explorerPanel.Parent
	end
end

function CreateFunctionCaller()
	if CurrentFunctionCallerWindow then
		CurrentFunctionCallerWindow:Destroy()
		CurrentFunctionCallerWindow = nil
	end
	CurrentFunctionCallerWindow = CreateFunctionCallerMenu(
		GetFunctions(),
		"",
		false,
		function(option)
			CurrentFunctionCallerWindow:Destroy()
			CurrentFunctionCallerWindow = nil
			local list = SelectionVar():Get()
			for i = 1,#list do
				pcall(function() Instance.new(option,list[i]) end)
			end
			-- print(option.Name .. " selected to be called. Function caller being added soon, please wait!")
			--CallFunction()
			DestroyRightClick()
		end
	)
	if currentRightClickMenu and CurrentFunctionCallerWindow then
		CurrentFunctionCallerWindow.Position = UDim2.new(0,currentRightClickMenu.Position.X.Offset-currentRightClickMenu.Size.X.Offset*1.5-2,0,0)
	end
	if CurrentFunctionCallerWindow then
		CurrentFunctionCallerWindow.Parent = explorerPanel.Parent
	end
end


function GetMouseLocation()
	return UserInputService:GetMouseLocation() - Vector2.new(0, 36);
end

function MouseHoveringOver(GuiObject)
	local MLocation = GetMouseLocation();

	return (MLocation.x >= GuiObject.AbsolutePosition.X and MLocation.x <= (GuiObject.AbsolutePosition.X + GuiObject.AbsoluteSize.X)) and (MLocation.y >= GuiObject.AbsolutePosition.Y and MLocation.y <= (GuiObject.AbsolutePosition.Y + GuiObject.AbsoluteSize.Y));
end

function CreateRightClickMenuItem(text, onClick, insObj)
	local button = Instance.new("TextButton")
	button.Font = DropDown.Font
	button.FontSize = DropDown.FontSize
	button.TextColor3 = DropDown.TextColor
	button.TextXAlignment = DropDown.TextXAlignment
	button.BackgroundColor3 = DropDown.BackColor
	button.AutoButtonColor = false
	button.BorderSizePixel = 0
	button.Active = true
	button.Text = text
	button.Transparency = 1
	if insObj == 1 then
		local newIcon = Icon(nil,ExplorerIndex[text] or 0)
		newIcon.Position = UDim2.new(0,0,0,2)
		newIcon.Size = UDim2.new(0,16,0,16)
		newIcon.IconMap.ZIndex = 5
		newIcon.Parent = button
		button.Text = "\t\t"..button.Text
	elseif insObj == 2 then
		button.FontSize = Enum.FontSize.Size11
	end

	--[[spawn(function()
		while button.Parent ~= nil and button.Parent.Parent ~= nil do
			game:service'RunService'.Stepped:wait();
			if not MouseHoveringOver(button) then
				button.TextColor3 = DropDown.TextColor
				button.BackgroundColor3 = DropDown.BackColor
			end
		end
	end)]]
	
    button.MouseEnter:connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {TextColor3 = DropDown.TextColorOver, BackgroundColor3 = DropDown.BackColorOver}):Play()
		if not insObj and CurrentInsertObjectWindow then
			if CurrentInsertObjectWindow.Visible == false and button.Text == "Insert Object" then
				CreateInsertObject()
			elseif CurrentInsertObjectWindow.Visible and button.Text ~= "Insert Object" then
				CurrentInsertObjectWindow.Visible = false
			end
		end
		if not insObj then
			if CurrentFunctionCallerWindow and button.Text ~= "Call Function" then
				CurrentFunctionCallerWindow:Destroy()
				CurrentFunctionCallerWindow = nil
			elseif button.Text == "Call Function" then
				CreateFunctionCaller()
			end
		end
	end)
    button.MouseLeave:connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {TextColor3 = DropDown.TextColor, BackgroundColor3 = DropDown.BackColor}):Play()
	end)
	button.MouseButton1Click:connect(function()
		TweenService:Create(button, TweenInfo.new(0.1), {TextColor3 = DropDown.TextColor, BackgroundColor3 = DropDown.BackColor}):Play()
		onClick(text)
	end)	
	return button
end

function CreateRightClickMenu(choices, currentChoice, readOnly, onClick)
	local mouse = game:GetService'Players'.LocalPlayer:GetMouse()

	local frame = Instance.new("Frame")	
	frame.Name = "DropDown"
	frame.Size = UDim2.new(0, 200, 1, 0)
	frame.BackgroundTransparency = 1
	frame.Active = true
	local closeCons;
	local menu = nil
	local arrow = nil
	local expanded = false
	local margin = DropDown.BorderSizePixel;
	
	--[[
	local button = Instance.new("TextButton")
	button.Font = Row.Font
	button.FontSize = Row.FontSize
	button.TextXAlignment = Row.TextXAlignment
	button.BackgroundTransparency = 1
	button.TextColor3 = Row.TextColor
	if readOnly then
		button.TextColor3 = Row.TextLockedColor
	end
	button.Text = currentChoice
	button.Size = UDim2.new(1, -2 * Styles.Margin, 1, 0)
	button.Position = UDim2.new(0, Styles.Margin, 0, 0)
	button.Parent = frame
	--]]
	
	local function hideMenu()
		expanded = false
		--showArrow(DropDown.ArrowColor)
		if frame then 
			frame:Destroy()
			DestroyRightClick()
        end
        if closeCons then
            closeCons:Disconnect()
            closeCons = nil;
        end
	end
	
	local function showMenu()
		expanded = true
		menu = Instance.new("Frame")
		menu.Size = UDim2.new(0, 200, 0, #choices * DropDown.Height)
		menu.Position = UDim2.new(0, margin, 0, 5)
		menu.BackgroundTransparency = 0
		menu.BackgroundColor3 = DropDown.BackColor
		menu.BorderColor3 = DropDown.BorderColor
		menu.BorderSizePixel = DropDown.BorderSizePixel
		menu.Active = true
		menu.ZIndex = 5
		menu.Parent = frame
		
		--local parentFrameHeight = script.Parent.List.Size.Y.Offset
		--local rowHeight = mouse.Y
		--if (rowHeight + menu.Size.Y.Offset) > parentFrameHeight then
		--	menu.Position = UDim2.new(0, margin, 0, -1 * (#choices * DropDown.Height) - margin)
		--end
			
		local function choice(name)
			onClick(name)
			hideMenu()
		end
		
		for i,name in pairs(choices) do
			local option = CreateRightClickMenuItem(name, function()
				choice(name)
			end)
			option.Size = UDim2.new(1, 0, 0, 16)
			option.Position = UDim2.new(0, 0, 0, (i-1) * DropDown.Height)
			option.ZIndex = menu.ZIndex
            option.Parent = menu
            TweenService:Create(option, TweenInfo.new(0.1), {Transparency = 0.2}):Play()
        end
        local function isInGui(frame)
			local mloc = UserInputService:GetMouseLocation();
			local mouse = Vector2.new(mloc.X, mloc.Y - 36);
			
			local x1, x2 = frame.AbsolutePosition.X, frame.AbsolutePosition.X + frame.AbsoluteSize.X;
			local y1, y2 = frame.AbsolutePosition.Y, frame.AbsolutePosition.Y + frame.AbsoluteSize.Y;
		
			return (mouse.X >= x1 and mouse.X <= x2) and (mouse.Y >= y1 and mouse.Y <= y2)
		end

        closeCons = UserInputService.InputBegan:connect(function(m)
			if m.UserInputType == Enum.UserInputType.MouseButton1 then
				if menu and (not isInGui(menu)) then
					hideMenu()
				end
			end
		end)
	end


	showMenu()

	
	return frame
end

function checkMouseInGui(gui)
	if gui == nil then return false end
	local plrMouse = game:GetService'Players'.LocalPlayer:GetMouse()
	local guiPosition = gui.AbsolutePosition
	local guiSize = gui.AbsoluteSize	
	
	if plrMouse.X >= guiPosition.x and plrMouse.X <= guiPosition.x + guiSize.x and plrMouse.Y >= guiPosition.y and plrMouse.Y <= guiPosition.y + guiSize.y then
		return true
	else
		return false
	end
end

local clipboard = {}
local function delete(o)
	o.Parent = nil
end

local getTextWidth do
	local text = Create('TextLabel',{
		Name = "TextWidth";
		TextXAlignment = 'Left';
		TextYAlignment = 'Center';
		Font = FONT;
		FontSize = FONT_SIZE;
		Text = "";
		Position = UDim2.new(0,0,0,0);
		Size = UDim2.new(1,0,1,0);
		Visible = false;
		Parent = explorerPanel;
	})
	function getTextWidth(s)
		text.Text = s
		return text.TextBounds.x
	end
end

local nameScanned = false
-- Holds the game tree converted to a list.
local TreeList = {}
-- Matches objects to their tree node representation.
local NodeLookup = {}

local nodeWidth = 0

local QuickButtons = {}

function filteringWorkspace()
	if explorerFilter.Text ~= "" and explorerFilter.Text ~= "Filter Workspace" then
		return true
	end
	return false
end

function lookForAName(obj,name)
	for i,v in pairs(obj:GetDescendants()) do
		if string.find(string.lower(v.Name),string.lower(name)) then nameScanned = true end
		-- lookForAName(v,name)
	end
end

function scanName(obj)
	nameScanned = false
	if string.find(string.lower(obj.Name),string.lower(explorerFilter.Text)) then
		nameScanned = true
	else
		lookForAName(obj,explorerFilter.Text)
	end
	return nameScanned
end

function updateActions()
	for i,v in pairs(QuickButtons) do
		v.Toggle(v.Cond());
	end
end

local updateList,rawUpdateList,updateScroll,rawUpdateSize do
	local function r(t)
		for i = 1,#t do
			if not filteringWorkspace() or scanName(t[i].Object) then
				TreeList[#TreeList+1] = t[i]

				local w = (t[i].Depth)*(2+ENTRY_PADDING+GUI_SIZE) + 2 + ENTRY_SIZE + 4 + getTextWidth(t[i].Object.Name) + 4
				if w > nodeWidth then
					nodeWidth = w
				end
				if t[i].Expanded or filteringWorkspace() then
					r(t[i])
				end
			end
		end
	end

	function rawUpdateSize()
		scrollBarH.TotalSpace = nodeWidth
		scrollBarH.VisibleSpace = listFrame.AbsoluteSize.x
		scrollBarH:Update()
		local visible = scrollBarH:CanScrollDown() or scrollBarH:CanScrollUp()
		scrollBarH.GUI.Visible = visible

		listFrame.Size = UDim2.new(1,-GUI_SIZE,1,-GUI_SIZE*(visible and 1 or 0) - HEADER_SIZE)

		scrollBar.VisibleSpace = math.ceil(listFrame.AbsoluteSize.y/ENTRY_BOUND)
		scrollBar.GUI.Size = UDim2.new(0,GUI_SIZE,1,-GUI_SIZE*(visible and 1 or 0) - HEADER_SIZE)
		
		scrollBar.TotalSpace = #TreeList+1
		scrollBar:Update()
	end

	function rawUpdateList()
		-- Clear then repopulate the entire list. It appears to be fast enough.
		TreeList = {}
		nodeWidth = 0
		r(NodeLookup[workspace.Parent])
		if DexStorageEnabled then
			r(NodeLookup[DexStorage])
		end
		if RunningScriptsStorageEnabled then
			r(NodeLookup[RunningScriptsStorage])
		end
		if UpvalueStorageEnabled then
			r(NodeLookup[UpvalueStorage])
		end
		rawUpdateSize()
		updateActions()
	end

	-- Adding or removing large models will cause many updates to occur. We
	-- can reduce the number of updates by creating a delay, then dropping any
	-- updates that occur during the delay.
	local updatingList = false
	function updateList()
		if updatingList then return end
		updatingList = true
		wait(2.25)
		updatingList = false
		rawUpdateList()
	end

	local updatingScroll = false
	function updateScroll()
		if updatingScroll then return end
		updatingScroll = true
		wait(2.25)
		updatingScroll = false
		scrollBar:Update()
	end
end

local Selection do
	local bindGetSelection = explorerPanel:FindFirstChild("GetSelection")
	if not bindGetSelection then
		bindGetSelection = Create('BindableFunction',{Name = "GetSelection"})
		bindGetSelection.Parent = explorerPanel
	end

	local bindSetSelection = explorerPanel:FindFirstChild("SetSelection")
	if not bindSetSelection then
		bindSetSelection = Create('BindableFunction',{Name = "SetSelection"})
		bindSetSelection.Parent = explorerPanel
	end

	local bindSelectionChanged = explorerPanel:FindFirstChild("SelectionChanged")
	if not bindSelectionChanged then
		bindSelectionChanged = Create('BindableEvent',{Name = "SelectionChanged"})
		bindSelectionChanged.Parent = explorerPanel
	end

	local SelectionList = {}
	local SelectionSet = {}
	local Updates = true
	Selection = {
		Selected = SelectionSet;
		List = SelectionList;
	}

	local function addObject(object)
		-- list update
		local lupdate = false
		-- scroll update
		local supdate = false

		if not SelectionSet[object] then
			local node = NodeLookup[object]
			if node then
				table.insert(SelectionList,object)
				SelectionSet[object] = true
				node.Selected = true

				-- expand all ancestors so that selected node becomes visible
				node = node.Parent
				while node do
					if not node.Expanded then
						node.Expanded = true
						lupdate = true
					end
					node = node.Parent
				end
				supdate = true
			end
		end
		return lupdate,supdate
	end

	function Selection:Set(objects)
		local lupdate = false
		local supdate = false

		if #SelectionList > 0 then
			for i = 1,#SelectionList do
				local object = SelectionList[i]
				local node = NodeLookup[object]
				if node then
					node.Selected = false
					SelectionSet[object] = nil
				end
			end

			SelectionList = {}
			Selection.List = SelectionList
			supdate = true
		end

		for i = 1,#objects do
			local l,s = addObject(objects[i])
			lupdate = l or lupdate
			supdate = s or supdate
		end

		if lupdate then
			rawUpdateList()
			supdate = true
		elseif supdate then
			scrollBar:Update()
		end

		if supdate then
			bindSelectionChanged:Fire()
			updateActions()
		end
	end

	function Selection:Add(object)
		local l,s = addObject(object)
		if l then
			rawUpdateList()
			if Updates then
				bindSelectionChanged:Fire()
				updateActions()
			end
		elseif s then
			scrollBar:Update()
			if Updates then
				bindSelectionChanged:Fire()
				updateActions()
			end
		end
	end
	
	function Selection:StopUpdates()
		Updates = false
	end
	
	function Selection:ResumeUpdates()
		Updates = true
		bindSelectionChanged:Fire()
		updateActions()
	end

	function Selection:Remove(object,noupdate)
		if SelectionSet[object] then
			local node = NodeLookup[object]
			if node then
				node.Selected = false
				SelectionSet[object] = nil
				for i = 1,#SelectionList do
					if SelectionList[i] == object then
						table.remove(SelectionList,i)
						break
					end
				end

				if not noupdate then
					scrollBar:Update()
				end
				bindSelectionChanged:Fire()
				updateActions()
			end
		end
	end

	function Selection:Get()
		local list = {}
		for i = 1,#SelectionList do
			list[i] = SelectionList[i]
		end
		return list
	end

	bindSetSelection.OnInvoke = function(...)
		Selection:Set(...)
	end

	bindGetSelection.OnInvoke = function()
		return Selection:Get()
	end
end

UserInputService.InputBegan:Connect(function(inp,gpe)
    if not gpe and inp.KeyCode == Enum.KeyCode.Delete then
        if not Option.Modifiable then return end
		local list = Selection:Get()
		for i = 1,#list do
			pcall(delete,list[i])
		end
		Selection:Set({})
    end
end)

function CreateCaution(title,msg)
	local newCaution = CautionWindow:Clone()
	newCaution.Title.Text = title
	newCaution.MainWindow.Desc.Text = msg
	newCaution.Parent = explorerPanel.Parent
	newCaution.Visible = true
	newCaution.MainWindow.Ok.MouseButton1Up:connect(function()
		newCaution:Destroy()
	end)
end

function CreateTableCaution(title,msg)
	if type(msg) ~= "table" then return CreateCaution(title,tostring(msg)) end
	local newCaution = TableCautionWindow:Clone()
	newCaution.Title.Text = title
	
	local TableList = newCaution.MainWindow.TableResults
	local TableTemplate = newCaution.MainWindow.TableTemplate
	
	for i,v in pairs(msg) do
		local newResult = TableTemplate:Clone()
		newResult.Type.Text = type(v)
		newResult.Value.Text = tostring(v)
		newResult.Position = UDim2.new(0,0,0,#TableList:GetChildren() * 20)
		newResult.Parent = TableList
		TableList.CanvasSize = UDim2.new(0,0,0,#TableList:GetChildren() * 20)
		newResult.Visible = true
	end
	newCaution.Parent = explorerPanel.Parent
	newCaution.Visible = true
	newCaution.MainWindow.Ok.MouseButton1Up:connect(function()
		newCaution:Destroy()
	end)
end

local function Split(str, delimiter)
	local start = 1
	local t = {}
	while true do
		local pos = string.find (str, delimiter, start, true)
		if not pos then
			break
		end
		table.insert (t, string.sub (str, start, pos - 1))
		start = pos + string.len (delimiter)
	end
	table.insert (t, string.sub (str, start))
	return t
end

local function ToValue(value,type)
	if type == "Vector2" then
		local list = Split(value,",")
		if #list < 2 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		return Vector2.new(x,y)
	elseif type == "Vector3" then
		local list = Split(value,",")
		if #list < 3 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		local z = tonumber(list[3]) or 0
		return Vector3.new(x,y,z)
	elseif type == "Color3" then
		local list = Split(value,",")
		if #list < 3 then return nil end
		local r = tonumber(list[1]) or 0
		local g = tonumber(list[2]) or 0
		local b = tonumber(list[3]) or 0
		return Color3.new(r/255,g/255, b/255)
	elseif type == "UDim2" then
		local list = Split(string.gsub(string.gsub(value, "{", ""),"}",""),",")
		if #list < 4 then return nil end
		local xScale = tonumber(list[1]) or 0
		local xOffset = tonumber(list[2]) or 0
		local yScale = tonumber(list[3]) or 0
		local yOffset = tonumber(list[4]) or 0
		return UDim2.new(xScale, xOffset, yScale, yOffset)
	elseif type == "Number" then
		return tonumber(value)
	elseif type == "String" then
		return value
	elseif type == "NumberRange" then
		local list = Split(value,",")
		if #list == 1 then
			if tonumber(list[1]) == nil then return nil end
			local newVal = tonumber(list[1]) or 0
			return NumberRange.new(newVal)
		end
		if #list < 2 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		return NumberRange.new(x,y)
	elseif type == "Script" then
		local success,err = ypcall(function()
		_G.D_E_X_DONOTUSETHISPLEASE = nil
		loadstring(
			"_G.D_E_X_DONOTUSETHISPLEASE = "..value
		)()
		return _G.D_E_X_DONOTUSETHISPLEASE
		end)
		if err then
			return nil
		end
	else
		return nil
	end
end

local function ToPropValue(value,type)
	if type == "Vector2" then
		local list = Split(value,",")
		if #list < 2 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		return Vector2.new(x,y)
	elseif type == "Vector3" then
		local list = Split(value,",")
		if #list < 3 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		local z = tonumber(list[3]) or 0
		return Vector3.new(x,y,z)
	elseif type == "Color3" then
		local list = Split(value,",")
		if #list < 3 then return nil end
		local r = tonumber(list[1]) or 0
		local g = tonumber(list[2]) or 0
		local b = tonumber(list[3]) or 0
		return Color3.new(r/255,g/255, b/255)
	elseif type == "UDim2" then
		local list = Split(string.gsub(string.gsub(value, "{", ""),"}",""),",")
		if #list < 4 then return nil end
		local xScale = tonumber(list[1]) or 0
		local xOffset = tonumber(list[2]) or 0
		local yScale = tonumber(list[3]) or 0
		local yOffset = tonumber(list[4]) or 0
		return UDim2.new(xScale, xOffset, yScale, yOffset)
	elseif type == "Content" then
		return value
	elseif type == "float" or type == "int" or type == "double" then
		return tonumber(value)
	elseif type == "string" then
		return value
	elseif type == "NumberRange" then
		local list = Split(value,",")
		if #list == 1 then
			if tonumber(list[1]) == nil then return nil end
			local newVal = tonumber(list[1]) or 0
			return NumberRange.new(newVal)
		end
		if #list < 2 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		return NumberRange.new(x,y)
	elseif string.sub(value,1,4) == "Enum" then
		local getEnum = value
		while true do
			local x,y = string.find(getEnum,".")
			if y then
				getEnum = string.sub(getEnum,y+1)
			else
				break
			end
		end
		-- print(getEnum)
		return getEnum
	else
		return nil
	end
end

function PromptRemoteCaller(inst)
	if CurrentRemoteWindow then
		CurrentRemoteWindow:Destroy()
		CurrentRemoteWindow = nil
	end
	CurrentRemoteWindow = RemoteWindow:Clone()
	CurrentRemoteWindow.Parent = explorerPanel.Parent
	CurrentRemoteWindow.Visible = true
	
	local displayValues = false
	
	local ArgumentList = CurrentRemoteWindow.MainWindow.Arguments
	local ArgumentTemplate = CurrentRemoteWindow.MainWindow.ArgumentTemplate
	
	if inst:IsA("RemoteEvent") then
		CurrentRemoteWindow.Title.Text = "Fire Event"
		CurrentRemoteWindow.MainWindow.Ok.Text = "Fire"
		CurrentRemoteWindow.MainWindow.DisplayReturned.Visible = false
		CurrentRemoteWindow.MainWindow.Desc2.Visible = false
	end
	
	local newArgument = ArgumentTemplate:Clone()
	newArgument.Parent = ArgumentList
	newArgument.Visible = true
	newArgument.Type.MouseButton1Down:connect(function()
		createDDown(newArgument.Type,function(choice)
			newArgument.Type.Text = choice
		end,"Script","Number","String","Color3","Vector3","Vector2","UDim2","NumberRange")
	end)
	
	CurrentRemoteWindow.MainWindow.Ok.MouseButton1Up:connect(function()
		if CurrentRemoteWindow and inst.Parent ~= nil then
			local MyArguments = {}
			for i,v in pairs(ArgumentList:GetChildren()) do
				table.insert(MyArguments,ToValue(v.Value.Text,v.Type.Text))
			end
			if inst:IsA("RemoteFunction") then
				if displayValues then
					spawn(function()
						local myResults = inst:InvokeServer(unpack(MyArguments))
						if myResults then
							CreateTableCaution("Remote Caller",myResults)
						else
							CreateCaution("Remote Caller","This remote did not return anything.")
						end
					end)
				else
					spawn(function()
						inst:InvokeServer(unpack(MyArguments))
					end)
				end
			else
				inst:FireServer(unpack(MyArguments))
			end
			CurrentRemoteWindow:Destroy()
			CurrentRemoteWindow = nil
		end
	end)
	
	CurrentRemoteWindow.MainWindow.Add.MouseButton1Up:connect(function()
		if CurrentRemoteWindow then
			local newArgument = ArgumentTemplate:Clone()
			newArgument.Position = UDim2.new(0,0,0,#ArgumentList:GetChildren() * 20)
			newArgument.Parent = ArgumentList
			ArgumentList.CanvasSize = UDim2.new(0,0,0,#ArgumentList:GetChildren() * 20)
			newArgument.Visible = true
			newArgument.Type.MouseButton1Down:connect(function()
				createDDown(newArgument.Type,function(choice)
					newArgument.Type.Text = choice
				end,"Script","Number","String","Color3","Vector3","Vector2","UDim2","NumberRange")
			end)
		end
	end)
	
	CurrentRemoteWindow.MainWindow.Subtract.MouseButton1Up:connect(function()
		if CurrentRemoteWindow then
			if #ArgumentList:GetChildren() > 1 then
				ArgumentList:GetChildren()[#ArgumentList:GetChildren()]:Destroy()
				ArgumentList.CanvasSize = UDim2.new(0,0,0,#ArgumentList:GetChildren() * 20)
			end
		end
	end)
	
	CurrentRemoteWindow.MainWindow.Cancel.MouseButton1Up:connect(function()
		if CurrentRemoteWindow then
			CurrentRemoteWindow:Destroy()
			CurrentRemoteWindow = nil
		end
	end)
	
	CurrentRemoteWindow.MainWindow.DisplayReturned.MouseButton1Up:connect(function()
		if displayValues then
			displayValues = false
			CurrentRemoteWindow.MainWindow.DisplayReturned.enabled.Visible = false
		else
			displayValues = true
			CurrentRemoteWindow.MainWindow.DisplayReturned.enabled.Visible = true
		end
	end)
end

function PromptSaveInstance(inst)
	if not SaveInstance and not _G.SaveInstance then CreateCaution("SaveInstance Missing","You do not have the SaveInstance function installed. Please go to RaspberryPi's thread to retrieve it.") return end
	if CurrentSaveInstanceWindow then
		CurrentSaveInstanceWindow:Destroy()
		CurrentSaveInstanceWindow = nil
		if explorerPanel.Parent:FindFirstChild("SaveInstanceOverwriteCaution") then
			explorerPanel.Parent.SaveInstanceOverwriteCaution:Destroy()
		end
	end
	CurrentSaveInstanceWindow = SaveInstanceWindow:Clone()
	CurrentSaveInstanceWindow.Parent = explorerPanel.Parent
	CurrentSaveInstanceWindow.Visible = true
	
	local filename = CurrentSaveInstanceWindow.MainWindow.FileName
	local saveObjects = true
	local overwriteCaution = false
	
	CurrentSaveInstanceWindow.MainWindow.Save.MouseButton1Up:connect(function()
		if readfile and getelysianpath then
			if readfile(getelysianpath()..filename.Text..".rbxmx") then
				if not overwriteCaution then
					overwriteCaution = true
					local newCaution = ConfirmationWindow:Clone()
					newCaution.Name = "SaveInstanceOverwriteCaution"
					newCaution.MainWindow.Desc.Text = "The file, "..filename.Text..".rbxmx, already exists. Overwrite?"
					newCaution.Parent = explorerPanel.Parent
					newCaution.Visible = true
					newCaution.MainWindow.Yes.MouseButton1Up:connect(function()
						ypcall(function()
							SaveInstance(inst,filename.Text..".rbxmx",not saveObjects)
						end)
						overwriteCaution = false
						newCaution:Destroy()
						if CurrentSaveInstanceWindow then
							CurrentSaveInstanceWindow:Destroy()
							CurrentSaveInstanceWindow = nil
						end
					end)
					newCaution.MainWindow.No.MouseButton1Up:connect(function()
						overwriteCaution = false
						newCaution:Destroy()
					end)
				end
			else
				ypcall(function()
					SaveInstance(inst,filename.Text..".rbxmx",not saveObjects)
				end)
				if CurrentSaveInstanceWindow then
					CurrentSaveInstanceWindow:Destroy()
					CurrentSaveInstanceWindow = nil
					if explorerPanel.Parent:FindFirstChild("SaveInstanceOverwriteCaution") then
						explorerPanel.Parent.SaveInstanceOverwriteCaution:Destroy()
					end
				end
			end
		else
			ypcall(function()
				if SaveInstance then
					SaveInstance(inst,filename.Text..".rbxmx",not saveObjects)
				else
					_G.SaveInstance(inst,filename.Text,not saveObjects)
				end
			end)
			if CurrentSaveInstanceWindow then
				CurrentSaveInstanceWindow:Destroy()
				CurrentSaveInstanceWindow = nil
				if explorerPanel.Parent:FindFirstChild("SaveInstanceOverwriteCaution") then
					explorerPanel.Parent.SaveInstanceOverwriteCaution:Destroy()
				end
			end
		end
	end)
	CurrentSaveInstanceWindow.MainWindow.Cancel.MouseButton1Up:connect(function()
		if CurrentSaveInstanceWindow then
			CurrentSaveInstanceWindow:Destroy()
			CurrentSaveInstanceWindow = nil
			if explorerPanel.Parent:FindFirstChild("SaveInstanceOverwriteCaution") then
				explorerPanel.Parent.SaveInstanceOverwriteCaution:Destroy()
			end
		end
	end)
	CurrentSaveInstanceWindow.MainWindow.SaveObjects.MouseButton1Up:connect(function()
		if saveObjects then
			saveObjects = false
			CurrentSaveInstanceWindow.MainWindow.SaveObjects.enabled.Visible = false
		else
			saveObjects = true
			CurrentSaveInstanceWindow.MainWindow.SaveObjects.enabled.Visible = true
		end
	end)
end

function DestroyRightClick()
	if currentRightClickMenu then
		currentRightClickMenu:Destroy()
		currentRightClickMenu = nil
	end
	if CurrentInsertObjectWindow and CurrentInsertObjectWindow.Visible then
		CurrentInsertObjectWindow.Visible = false
	end
end



function rightClickMenu(sObj)
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	
    local options = {
        'Cut',
		'Copy',
		'Copy Path',
		'Paste Into',
		'Duplicate',
        'Delete',
        'Select Children'
    }
    function IsAc(typ)
        local list = Selection:Get()
	    for i = 1,#list do
            if list[i]:IsA(typ) then
                return true
            end
        end
        return false
    end
    if IsAc('BasePart') then
        table.insert(options, 'Teleport To')
    end
    if IsAc('LocalScript') or IsAc('ModuleScript') then
        table.insert(options, 'View Script')
		table.insert(options, 'Save Script')
		table.insert(options, 'Dump Script')
    end
    if IsAc('RemoteEvent') or IsAc('RemoteFunction') then
		table.insert(options, 'Call Remote')
		table.insert(options, 'Spy Remote')
    end
	currentRightClickMenu = CreateRightClickMenu(options, "", false,
		function(option)
			if option == "Cut" then
				if not Option.Modifiable then return end
				clipboard = {}
				local list = Selection.List
				local cut = {}
				for i = 1,#list do
					local obj = list[i]:Clone()
					if obj then
						table.insert(clipboard,obj)
						table.insert(cut,list[i])
					end
				end
				for i = 1,#cut do
					pcall(delete,cut[i])
				end
				updateActions()
			elseif option == "Copy" then
				if not Option.Modifiable then return end
				clipboard = {}
				local list = Selection.List
				for i = 1,#list do
					table.insert(clipboard,list[i]:Clone())
				end
				updateActions()
			elseif option == "Paste Into" then
				if not Option.Modifiable then return end
				local parent = Selection.List[1] or workspace
				for i = 1,#clipboard do
					clipboard[i]:Clone().Parent = parent
				end
			elseif option == "Duplicate" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				for i = 1,#list do
					list[i]:Clone().Parent = Selection.List[1].Parent or workspace
				end
			elseif option == "Delete" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				for i = 1,#list do
					pcall(delete,list[i])
				end
				Selection:Set({})
			elseif option == "Group" then
				if not Option.Modifiable then return end
				local newModel = Instance.new("Model")
				local list = Selection:Get()
				newModel.Parent = Selection.List[1].Parent or workspace
				for i = 1,#list do
					list[i].Parent = newModel
				end
				Selection:Set({})
			elseif option == "Ungroup" then
				if not Option.Modifiable then return end
				local ungrouped = {}
				local list = Selection:Get()
				for i = 1,#list do
					if list[i]:IsA("Model") then
						for i2,v2 in pairs(list[i]:GetChildren()) do
							v2.Parent = list[i].Parent or workspace
							table.insert(ungrouped,v2)
						end		
						pcall(delete,list[i])			
					end
				end
				Selection:Set({})
				if SettingsRemote:Invoke("SelectUngrouped") then
					for i,v in pairs(ungrouped) do
						Selection:Add(v)
					end
				end
			elseif option == "Select Children" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				Selection:Set({})
				Selection:StopUpdates()
				for i = 1,#list do
					for i2,v2 in pairs(list[i]:GetChildren()) do
						Selection:Add(v2)
					end
				end
				Selection:ResumeUpdates()
			elseif option == "Teleport To" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				for i = 1,#list do
					if list[i]:IsA("BasePart") then
						pcall(function()
							game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = list[i].CFrame
						end)
						break
					end
				end
			elseif option == "Dump Script" then
				if not Option.Modifiable then return; end;
				local list = Selection:Get()
				scriptDumper.Enabled = true;
				log(list[#list]);
			elseif option == "Spy Remote" then
				if not Option.Modifiable then return; end;
				local list = Selection:Get();
				dexSpy.Enabled = true;
				currentRemote = list[#list];
			elseif option == "Insert Part" then
				if not Option.Modifiable then return end
				local insertedParts = {}
				local list = Selection:Get()
				for i = 1,#list do
					pcall(function()
						local newPart = Instance.new("Part")
						newPart.Parent = list[i]
						newPart.CFrame = CFrame.new(game:GetService'Players'.LocalPlayer.Character.Head.Position) + Vector3.new(0,3,0)
						table.insert(insertedParts,newPart)
					end)
				end
			elseif option == "Copy Path" then
                if not Option.Modifiable then return; end; 
				local function reconstructPath(path)
					local matches = {};
					for v in path:gmatch("(.-)%.") do
						table.insert(matches, v);
                    end;
                    if #matches >= 1 then
					    local startIndex, endIndex = path:find(matches[#matches]);
                        table.insert(matches, path:sub(endIndex + 2, #path));
                    end;
					local str = "";
					for i, v in pairs(matches) do
						if (not v:find("%s")) and (not v:find("!")) and (not v:find("?")) then
							if i ~= 1 then
								str = str .. "." .. v;
							else
								str = str .. ':GetService("' .. v .. '")';
							end;
						else
							str = str .. '["' .. v .. '"]'  
						end;
					end;
					str = "game" .. str;
					return str;
				end;
				local list = Selection:Get();
				local copied = "";
                for i = 1, #list do
					if list[i]:GetFullName():find("%.") then
						if i == 1 then
							copied = copied .. reconstructPath(list[i]:GetFullName());
						else
							copied = copied .. "\n" .. reconstructPath(list[i]:GetFullName());
						end;
					else
						if i == 1 then
							copied = copied .. 'game:GetService("' .. list[i]:GetFullName() .. '")';
						else
							copied = copied .. "\n" .. 'game:GetService("' .. list[i]:GetFullName() .. '")';
						end;
                    end;
				end;
				setclipboard(copied);
			elseif option == "Save Instance" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				if #list == 1 then
					list[1].Archivable = true
					ypcall(function()PromptSaveInstance(list[1]:Clone())end)
				elseif #list > 1 then
					local newModel = Instance.new("Model")
					newModel.Name = "SavedInstances"
					for i = 1,#list do
						ypcall(function()
							list[i].Archivable = true
							list[i]:Clone().Parent = newModel
						end)
					end
					PromptSaveInstance(newModel)
				end
			elseif option == "Call Remote" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				for i = 1,#list do
					if list[i]:IsA("RemoteFunction") or list[i]:IsA("RemoteEvent") then
						PromptRemoteCaller(list[i])
						break
					end
				end
			elseif option == "Save Script" then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				for i = 1,#list do
					if list[i]:IsA("LocalScript") or list[i]:IsA("ModuleScript") then
						if Synapse then
							Synapse:WriteFile(game.PlaceId .. '_' .. list[i].Name:gsub('%W', '') .. '_' .. math.random(100000, 999999) .. '.lua', decompile(list[i]))
						elseif writefile then
							writefile(game.PlaceId .. '_' .. list[i].Name:gsub('%W', '') .. '_' .. math.random(100000, 999999) .. '.lua', decompile(list[i]));
						end
					end
				end
			elseif option == "View Script" then
				-- if not Option.Modifiable then return end
				local list = Selection:Get()
				for i = 1,#list do
					if list[i]:IsA("LocalScript") or list[i]:IsA("ModuleScript") then
						ScriptEditorEvent:Fire(list[i])
					end
				end
			elseif option == 'Try Get Values' then
				for i, sObj in pairs(Selection:Get()) do
					if vars[sObj.Name] or funcs[sObj.Name] then
						local var = vars[sObj.Name] or funcs[sObj.Name]
						if var then
							if type(var) == 'table' then
								local T = var;
								-- table.sort(T, cmp)
								for i,v in pairs(T) do
									local n = Instance.new('StringValue', sObj);
									n.Name = tostring(i);
									local a, b = pcall(function()
										return tostring(v);
									end)
									n.Value = a and b or '.undefined';
									if (type(v) == 'function') then
										funcs[i] = v;
									else
										vars[i] = v;
									end
								end
							elseif type(var) == 'function' then
								local T = debug.getupvalues(var);
								-- table.sort(T, cmp)
								for i,v in pairs(T) do
									local n = Instance.new('StringValue', sObj);
									n.Name = tostring(i);
									local a, b = pcall(function()
										return tostring(v);
									end)
									n.Value = a and b or '.undefined';
									if (type(v) == 'function') then
										funcs[i] = v;
									else
										vars[i] = v;
									end
								end
							end
						end
					end
					if typeof(sObj) == 'Instance' and (sObj:IsA'LocalScript' or sObj:IsA'ModuleScript') then
						do -- get script env values
							local T = getsenv(sObj);
							for i,v in pairs(T) do
								if not sObj:FindFirstChild(tostring(i)) then
									local n = Instance.new('StringValue', sObj);
									n.Name = tostring(i);
									local a, b = pcall(function()
										return tostring(v);
									end)
									n.Value = a and b or '.undefined';
									if (type(v) == 'function') then
										funcs[i] = v;
										for fn, p in pairs(debug.getupvalues(v)) do
											if not sObj:FindFirstChild(tostring(fn)) then
												local n = Instance.new('StringValue', sObj);
												n.Name = tostring(fn);
												local a, b = pcall(function()
													return tostring(p);
												end)
												n.Value = a and b or '.undefined';
												if (type(p) == 'function') then
													funcs[fn] = p;
												else
													vars[fn] = p;
												end
											end
										end
									else
										vars[i] = v;
									end
								end
							end
						end
						--[[do -- attempt to get upvalue variables
							for i,v in pairs(getreg()) do
								if typeof(v) == 'function' then
									local T = debug.getupvalues(v);
									for i,v in pairs(T) do
										if not sObj:FindFirstChild(tostring(i)) then
											local n = Instance.new('StringValue', sObj);
											n.Name = tostring(i);
											local a, b = pcall(function()
												return tostring(v);
											end)
											n.Value = a and b or '.undefined';
											if (type(v) == 'function') then
												for _, p in pairs(debug.getupvalues(v)) do
													if not sObj:FindFirstChild(tostring(_)) then
														local n = Instance.new('StringValue', sObj);
														n.Name = tostring(_);
														local a, b = pcall(function()
															return tostring(p);
														end)
														n.Value = a and b or '.undefined';
													end
												end
											end
										end
									end
								end
							end
						end]]
					end
				end
			elseif option == 'Dump Function' then
				if funcs[sObj.Name] then
					local var = funcs[sObj.Name]
					if var then
						if type(var) == 'function' then
							if writefile then
								writefile(game.PlaceId .. '_' .. 'DF' .. '_' .. math.random(100000, 999999) .. '.lua', decompile(var));
							end
						end
					end
				end
			elseif option == 'Refresh Instances' then
				for i,v in pairs(getscripts()) do
					if v ~= RunningScriptsStorage and v ~= DexStorage and v ~= UpvalueStorage then
						if (v:IsA'LocalScript' or v:IsA'ModuleScript' or v:IsA'Script') then
							v.Archivable = true;
							local ls = v:clone()
							if v:IsA'LocalScript' or v:IsA'Script' then ls.Disabled = true; end
							ls.Parent = RunningScriptsStorageMain
						end
					end
				end
			elseif option == 'Track' then
				if not Option.Modifiable then return end
				local list = Selection:Get()
				for i = 1,#list do
					pcall(function()
						local name = list[i].Name;
						if list[i].Parent:FindFirstChildOfClass'Humanoid' then
							name = list[i].Parent.Name;
						end
						_G.Track(list[i], name, list[i].BrickColor.Color);
					end)
				end
			end
	end)
	currentRightClickMenu.Parent = explorerPanel.Parent
	currentRightClickMenu.Position = UDim2.new(0,mouse.X,0,mouse.Y)
	if currentRightClickMenu.AbsolutePosition.X + currentRightClickMenu.AbsoluteSize.X > explorerPanel.AbsolutePosition.X + explorerPanel.AbsoluteSize.X then
		currentRightClickMenu.Position = UDim2.new(0, explorerPanel.AbsolutePosition.X + explorerPanel.AbsoluteSize.X - currentRightClickMenu.AbsoluteSize.X, 0, mouse.Y)
	end
end

local function cancelReparentDrag()end
local function cancelSelectDrag()end
do
	local listEntries = {}
	local nameConnLookup = {}

	local mouseDrag = Create('ImageButton',{
		Name = "MouseDrag";
		Position = UDim2.new(-0.25,0,-0.25,0);
		Size = UDim2.new(1.5,0,1.5,0);
		Transparency = 1;
		AutoButtonColor = false;
		Active = true;
		ZIndex = 10;
	})
	local function dragSelect(last,add,button)
		local connDrag
		local conUp

		conDrag = mouseDrag.MouseMoved:connect(function(x,y)
			local pos = Vector2.new(x,y) - listFrame.AbsolutePosition
			local size = listFrame.AbsoluteSize
			if pos.x < 0 or pos.x > size.x or pos.y < 0 or pos.y > size.y then return end

			local i = math.ceil(pos.y/ENTRY_BOUND) + scrollBar.ScrollIndex
			-- Mouse may have made a large step, so interpolate between the
			-- last index and the current.
			for n = i<last and i or last, i>last and i or last do
				local node = TreeList[n]
				if node then
					if add then
						Selection:Add(node.Object)
					else
						Selection:Remove(node.Object)
					end
				end
			end
			last = i
		end)

		function cancelSelectDrag()
			mouseDrag.Parent = nil
			conDrag:disconnect()
			conUp:disconnect()
			function cancelSelectDrag()end
		end

		conUp = mouseDrag[button]:connect(cancelSelectDrag)

		mouseDrag.Parent = GetScreen(listFrame)
	end

	local function dragReparent(object,dragGhost,clickPos,ghostOffset)
		local connDrag
		local conUp
		local conUp2

		local parentIndex = nil
		local dragged = false

		local parentHighlight = Create('Frame',{
			Transparency = 1;
			Visible = false;
			Create('Frame',{
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(0,0,0);
				BackgroundTransparency = 0.1;
				Position = UDim2.new(0,0,0,0);
				Size = UDim2.new(1,0,0,1);
			});
			Create('Frame',{
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(0,0,0);
				BackgroundTransparency = 0.1;
				Position = UDim2.new(1,0,0,0);
				Size = UDim2.new(0,1,1,0);
			});
			Create('Frame',{
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(0,0,0);
				BackgroundTransparency = 0.1;
				Position = UDim2.new(0,0,1,0);
				Size = UDim2.new(1,0,0,1);
			});
			Create('Frame',{
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(0,0,0);
				BackgroundTransparency = 0.1;
				Position = UDim2.new(0,0,0,0);
				Size = UDim2.new(0,1,1,0);
			});
		})
		SetZIndex(parentHighlight,9)

		conDrag = mouseDrag.MouseMoved:connect(function(x,y)
			local dragPos = Vector2.new(x,y)
			if dragged then
				local pos = dragPos - listFrame.AbsolutePosition
				local size = listFrame.AbsoluteSize

				parentIndex = nil
				parentHighlight.Visible = false
				if pos.x >= 0 and pos.x <= size.x and pos.y >= 0 and pos.y <= size.y + ENTRY_SIZE*2 then
					local i = math.ceil(pos.y/ENTRY_BOUND-2)
					local node = TreeList[i + scrollBar.ScrollIndex]
					if node and node.Object ~= object and not object:IsAncestorOf(node.Object) then
						parentIndex = i
						local entry = listEntries[i]
						if entry then
							parentHighlight.Visible = true
							parentHighlight.Position = UDim2.new(0,1,0,entry.AbsolutePosition.y-listFrame.AbsolutePosition.y)
							parentHighlight.Size = UDim2.new(0,size.x-4,0,entry.AbsoluteSize.y)
						end
					end
				end

				dragGhost.Position = UDim2.new(0,dragPos.x+ghostOffset.x,0,dragPos.y+ghostOffset.y)
			elseif (clickPos-dragPos).magnitude > 8 then
				dragged = true
				SetZIndex(dragGhost,9)
				dragGhost.IndentFrame.Transparency = 0.25
				dragGhost.IndentFrame.EntryText.TextColor3 = GuiColor.TextSelected
				dragGhost.Position = UDim2.new(0,dragPos.x+ghostOffset.x,0,dragPos.y+ghostOffset.y)
				dragGhost.Parent = GetScreen(listFrame)
				parentHighlight.Parent = listFrame
			end
		end)

		function cancelReparentDrag()
			mouseDrag.Parent = nil
			conDrag:disconnect()
			conUp:disconnect()
			conUp2:disconnect()
			dragGhost:Destroy()
			parentHighlight:Destroy()
			function cancelReparentDrag()end
		end

		local wasSelected = Selection.Selected[object]
		if not wasSelected and Option.Selectable then
			Selection:Set({object})
		end

		conUp = mouseDrag.MouseButton1Up:connect(function()
			cancelReparentDrag()
			if dragged then
				if parentIndex then
					local parentNode = TreeList[parentIndex + scrollBar.ScrollIndex]
					if parentNode then
						parentNode.Expanded = true

						local parentObj = parentNode.Object
						local function parent(a,b)
							a.Parent = b
						end
						if Option.Selectable then
							local list = Selection.List
							for i = 1,#list do
								pcall(parent,list[i],parentObj)
							end
						else
							pcall(parent,object,parentObj)
						end
					end
				end
			else
				-- do selection click
				if wasSelected and Option.Selectable then
					Selection:Set({})
				end
			end
		end)
		conUp2 = mouseDrag.MouseButton2Down:connect(function()
			cancelReparentDrag()
		end)

		mouseDrag.Parent = GetScreen(listFrame)
	end

	local entryTemplate = Create('ImageButton',{
		Name = "Entry";
		Transparency = 1;
		AutoButtonColor = false;
		Position = UDim2.new(0,0,0,0);
		Size = UDim2.new(1,0,0,ENTRY_SIZE);
		Create('Frame',{
			Name = "IndentFrame";
			BackgroundTransparency = 1;
			BackgroundColor3 = GuiColor.Selected;
			BorderColor3 = GuiColor.BorderSelected;
			Position = UDim2.new(0,0,0,0);
			Size = UDim2.new(1,0,1,0);
			Create(Icon('ImageButton',0, true),{
				Name = "Expand";
				AutoButtonColor = false;
				Position = UDim2.new(0,-GUI_SIZE,0.5,-GUI_SIZE/2);
				Size = UDim2.new(0,GUI_SIZE,0,GUI_SIZE);
			});
			Create(Icon(nil,0),{
				Name = "ExplorerIcon";
				Position = UDim2.new(0,2+ENTRY_PADDING,0.5,-GUI_SIZE/2);
				Size = UDim2.new(0,GUI_SIZE,0,GUI_SIZE);
			});
			Create('TextLabel',{
				Name = "EntryText";
				BackgroundTransparency = 1;
				TextColor3 = GuiColor.Text;
				TextXAlignment = 'Left';
				TextYAlignment = 'Center';
				Font = FONT;
				FontSize = FONT_SIZE;
				Text = "";
				Position = UDim2.new(0,2+ENTRY_SIZE+4,0,0);
				Size = UDim2.new(1,-2,1,0);
			});
		});
	})

	function scrollBar.UpdateCallback(self)
		for i = 1,self.VisibleSpace do
			local node = TreeList[i + self.ScrollIndex]
			if node then
				local entry = listEntries[i]
				if not entry then
					entry = Create(entryTemplate:Clone(),{
						Position = UDim2.new(0,2,0,ENTRY_BOUND*(i-1)+2);
						Size = UDim2.new(0,nodeWidth,0,ENTRY_SIZE);
						ZIndex = listFrame.ZIndex;
					})
					listEntries[i] = entry

					local expand = entry.IndentFrame.Expand
					expand.MouseEnter:connect(function()
						local node = TreeList[i + self.ScrollIndex]
						if #node > 0 then
							if node.Expanded then
                                local earrow = Icon(expand,NODE_EXPANDED)
                                TweenService:Create(earrow.IconMap, TweenInfo.new(0.1), {ImageColor3 = Color3.fromRGB(197, 28, 70)}):Play()
							else
                                local earrow = Icon(expand,NODE_COLLAPSED)
                                TweenService:Create(earrow.IconMap, TweenInfo.new(0.1), {ImageColor3 = Color3.fromRGB(197, 28, 70)}):Play()
							end
						end
					end)
					expand.MouseLeave:connect(function()
						local node = TreeList[i + self.ScrollIndex]
						if #node > 0 then
							if node.Expanded then
                                local earrow = Icon(expand,NODE_EXPANDED)
                                TweenService:Create(earrow.IconMap, TweenInfo.new(0.1), {ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
							else
                                local earrow = Icon(expand,NODE_COLLAPSED)
                                TweenService:Create(earrow.IconMap, TweenInfo.new(0.1), {ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
							end
						end
					end)
					expand.MouseButton1Down:connect(function()
						local node = TreeList[i + self.ScrollIndex]
						if #node > 0 then
							node.Expanded = not node.Expanded
							if node.Object == explorerPanel.Parent and node.Expanded then
								CreateCaution("Warning","Please be careful when editing instances inside here, this is like the System32 of Dex and modifying objects here can break Dex.")
							end
							-- use raw update so the list updates instantly
							rawUpdateList()
						end
					end)

					entry.MouseButton1Down:connect(function(x,y)
						local node = TreeList[i + self.ScrollIndex]
						DestroyRightClick()
						if GetAwaitRemote:Invoke() then
							bindSetAwaiting:Fire(node.Object)
							return
						end
						
						if not HoldingShift then
							lastSelectedNode = i + self.ScrollIndex
						end
						
						if HoldingShift and not filteringWorkspace() then
							if lastSelectedNode then
								if i + self.ScrollIndex - lastSelectedNode > 0 then
									Selection:StopUpdates()
									for i2 = 1, i + self.ScrollIndex - lastSelectedNode do
										local newNode = TreeList[lastSelectedNode + i2]
										if newNode then
											Selection:Add(newNode.Object)
										end
									end
									Selection:ResumeUpdates()
								else
									Selection:StopUpdates()
									for i2 = i + self.ScrollIndex - lastSelectedNode, 1 do
										local newNode = TreeList[lastSelectedNode + i2]
										if newNode then
											Selection:Add(newNode.Object)
										end
									end
									Selection:ResumeUpdates()
								end
							end
							return
						end
						
						if HoldingCtrl then
							if Selection.Selected[node.Object] then
								Selection:Remove(node.Object)
							else
								Selection:Add(node.Object)
							end
							return
						end
						if Option.Modifiable then
							local pos = Vector2.new(x,y)
							dragReparent(node.Object,entry:Clone(),pos,entry.AbsolutePosition-pos)
						elseif Option.Selectable then
							if Selection.Selected[node.Object] then
								Selection:Set({})
							else
								Selection:Set({node.Object})
							end
							dragSelect(i+self.ScrollIndex,true,'MouseButton1Up')
						end
					end)

					entry.MouseButton2Down:connect(function()
						if not Option.Selectable then return end
						
						DestroyRightClick()
						
						curSelect = entry
						
						local node = TreeList[i + self.ScrollIndex]
						
						if GetAwaitRemote:Invoke() then
							bindSetAwaiting:Fire(node.Object)
							return
						end
						
						if not Selection.Selected[node.Object] then
							Selection:Set({node.Object})
						end
					end)
					
					
					entry.MouseButton2Up:connect(function()
						if not Option.Selectable then return end
						
						local node = TreeList[i + self.ScrollIndex]
						
						if checkMouseInGui(curSelect) then
							rightClickMenu(node.Object)
						end
					end)

					entry.Parent = listFrame
				end

				entry.Visible = true

				local object = node.Object

				-- update expand icon
				if #node == 0 then
					entry.IndentFrame.Expand.Visible = false
				elseif node.Expanded then
					Icon(entry.IndentFrame.Expand,NODE_EXPANDED)
					entry.IndentFrame.Expand.Visible = true
				else
					Icon(entry.IndentFrame.Expand,NODE_COLLAPSED)
					entry.IndentFrame.Expand.Visible = true
				end

				-- update explorer icon
				Icon(entry.IndentFrame.ExplorerIcon,ExplorerIndex[object.ClassName] or 0)

				-- update indentation
				local w = (node.Depth)*(2+ENTRY_PADDING+GUI_SIZE)
				entry.IndentFrame.Position = UDim2.new(0,w,0,0)
				entry.IndentFrame.Size = UDim2.new(1,-w,1,0)

				-- update name change detection
				if nameConnLookup[entry] then
					nameConnLookup[entry]:disconnect()
				end
				local text = entry.IndentFrame.EntryText
				text.Text = object.Name
				nameConnLookup[entry] = node.Object.Changed:connect(function(p)
					if p == 'Name' then
						text.Text = object.Name
					end
				end)

				-- update selection
				entry.IndentFrame.Transparency = node.Selected and 0 or 1
				text.TextColor3 = GuiColor[node.Selected and 'TextSelected' or 'Text']

				entry.Size = UDim2.new(0,nodeWidth,0,ENTRY_SIZE)
			elseif listEntries[i] then
				listEntries[i].Visible = false
			end
		end
		for i = self.VisibleSpace+1,self.TotalSpace do
			local entry = listEntries[i]
			if entry then
				listEntries[i] = nil
				entry:Destroy()
			end
		end
	end

	function scrollBarH.UpdateCallback(self)
		for i = 1,scrollBar.VisibleSpace do
			local node = TreeList[i + scrollBar.ScrollIndex]
			if node then
				local entry = listEntries[i]
				if entry then
					entry.Position = UDim2.new(0,2 - scrollBarH.ScrollIndex,0,ENTRY_BOUND*(i-1)+2)
				end
			end
		end
	end

	Connect(listFrame.Changed,function(p)
		if p == 'AbsoluteSize' then
			rawUpdateSize()
		end
	end)

	local wheelAmount = 6
	
	explorerPanel.MouseWheelForward:connect(function()
		if input ~= nil and input.down ~= nil and input.down.leftshift then
			if scrollBarH.VisibleSpace - 1 > wheelAmount then
				scrollBarH:ScrollTo(scrollBarH.ScrollIndex - wheelAmount)
			else
				scrollBarH:ScrollTo(scrollBarH.ScrollIndex - scrollBarH.VisibleSpace)
			end
		else
			if scrollBar.VisibleSpace - 1 > wheelAmount then
				scrollBar:ScrollTo(scrollBar.ScrollIndex - wheelAmount)
			else
				scrollBar:ScrollTo(scrollBar.ScrollIndex - scrollBar.VisibleSpace)
			end
		end
	end)
	explorerPanel.MouseWheelBackward:connect(function()
		if input ~= nil and input.down ~= nil and input.down.leftshift then
			if scrollBarH.VisibleSpace - 1 > wheelAmount then
				scrollBarH:ScrollTo(scrollBarH.ScrollIndex + wheelAmount)
			else
				scrollBarH:ScrollTo(scrollBarH.ScrollIndex + scrollBarH.VisibleSpace)
			end
		else
			if scrollBar.VisibleSpace - 1 > wheelAmount then
				scrollBar:ScrollTo(scrollBar.ScrollIndex + wheelAmount)
			else
				scrollBar:ScrollTo(scrollBar.ScrollIndex + scrollBar.VisibleSpace)
			end
		end
	end)
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
---- Object detection

-- Inserts `v` into `t` at `i`. Also sets `Index` field in `v`.
local function insert(t,i,v)
	for n = #t,i,-1 do
		local v = t[n]
		v.Index = n+1
		t[n+1] = v
	end
	v.Index = i
	t[i] = v
end

-- Removes `i` from `t`. Also sets `Index` field in removed value.
local function remove(t,i)
	local v = t[i]
	for n = i+1,#t do
		local v = t[n]
		v.Index = n-1
		t[n-1] = v
	end
	t[#t] = nil
	v.Index = 0
	return v
end

-- Returns how deep `o` is in the tree.
local function depth(o)
	local d = -1
	while o do
		o = o.Parent
		d = d + 1
	end
	return d
end


local connLookup = {}

-- Returns whether a node would be present in the tree list
local function nodeIsVisible(node)
	local visible = true
	node = node.Parent
	while node and visible do
		visible = visible and node.Expanded
		node = node.Parent
	end
	return visible
end

-- Removes an object's tree node. Called when the object stops existing in the
-- game tree.
local function removeObject(object)
	local objectNode = NodeLookup[object]
	if not objectNode then
		return
	end

	local visible = nodeIsVisible(objectNode)

	Selection:Remove(object,true)

	local parent = objectNode.Parent
	remove(parent,objectNode.Index)
	NodeLookup[object] = nil
	connLookup[object]:disconnect()
	connLookup[object] = nil

	if visible then
		updateList()
	elseif nodeIsVisible(parent) then
		updateScroll()
	end
end

-- Moves a tree node to a new parent. Called when an existing object's parent
-- changes.
local function moveObject(object,parent)
	local objectNode = NodeLookup[object]
	if not objectNode then
		return
	end

	local parentNode = NodeLookup[parent]
	if not parentNode then
		return
	end

	local visible = nodeIsVisible(objectNode)

	remove(objectNode.Parent,objectNode.Index)
	objectNode.Parent = parentNode

	objectNode.Depth = depth(object)
	local function r(node,d)
		for i = 1,#node do
			node[i].Depth = d
			r(node[i],d+1)
		end
	end
	r(objectNode,objectNode.Depth+1)

	insert(parentNode,#parentNode+1,objectNode)

	if visible or nodeIsVisible(objectNode) then
		updateList()
	elseif nodeIsVisible(objectNode.Parent) then
		updateScroll()
	end
end

-- ScriptContext['/Libraries/LibraryRegistration/LibraryRegistration']
-- This RobloxLocked object lets me index its properties for some reason

local function check(object)
	return object.AncestryChanged
end

-- Creates a new tree node from an object. Called when an object starts
-- existing in the game tree.
local function addObject(object,noupdate)
	if script then
		-- protect against naughty RobloxLocked objects
		local s = pcall(check,object)
		if not s then
			return
		end
	end

	local parentNode = NodeLookup[object.Parent]
	if not parentNode then
		return
	end

	local objectNode = {
		Object = object;
		Parent = parentNode;
		Index = 0;
		Expanded = false;
		Selected = false;
		Depth = depth(object);
	}

	connLookup[object] = Connect(object.AncestryChanged,function(c,p)
		if c == object then
			if p == nil then
				removeObject(c)
			else
				moveObject(c,p)
			end
		end
	end)

	NodeLookup[object] = objectNode
	insert(parentNode,#parentNode+1,objectNode)

	if not noupdate then
		if nodeIsVisible(objectNode) then
			updateList()
		elseif nodeIsVisible(objectNode.Parent) then
			updateScroll()
		end
	end
end

local function makeObject(obj,par)
	local newObject = Instance.new(obj.ClassName)
	for i,v in pairs(obj.Properties) do
		ypcall(function()
			local newProp
			newProp = ToPropValue(v.Value,v.Type)
			newObject[v.Name] = newProp
		end)
	end
	newObject.Parent = par
end

local function writeObject(obj)
	local newObject = {ClassName = obj.ClassName, Properties = {}}
	for i,v in pairs(RbxApi.GetProperties(obj.className)) do
		if v["Name"] ~= "Parent" then
			table.insert(newObject.Properties,{Name = v["Name"], Type = v["ValueType"], Value = tostring(obj[v["Name"]])})
		end
	end
	return newObject
end

local function buildDexStorage()
	--[[local localDexStorage
	
	local success,err = ypcall(function()
		localDexStorage = game:GetObjects("rbxasset://DexStorage.rbxm")
	end)
	
	if success and localDexStorage then
		for i,v in pairs(localDexStorage:GetChildren()) do
			ypcall(function()
				v.Parent = DexStorageMain
			end)
		end
	end]]
	
	updateDexStorageListeners()
	--[[
	local localDexStorage = readfile(getelysianpath().."DexStorage.txt")--game:GetService("CookiesService"):GetCookieValue("DexStorage")
	--local success,err = pcall(function()
		if localDexStorage then
			local objTable = game:GetService("HttpService"):JSONDecode(localDexStorage)
			for i,v in pairs(objTable) do
				makeObject(v,DexStorageMain)
			end
		end
	--end)
	--]]
end

local dexStorageDebounce = false
local dexStorageListeners = {}

local function updateDexStorage()
	if dexStorageDebounce then return end
	dexStorageDebounce = true	
	
	wait()
	
	pcall(function()
		saveinstance("content//DexStorage.rbxm",DexStorageMain)
	end)
	
	updateDexStorageListeners()
	
	dexStorageDebounce = false
	--[[
	local success,err = ypcall(function()
		local objs = {}
		for i,v in pairs(DexStorageMain:GetChildren()) do
			table.insert(objs,writeObject(v))
		end
		writefile(getelysianpath().."DexStorage.txt",game:GetService("HttpService"):JSONEncode(objs))
		--game:GetService("CookiesService"):SetCookieValue("DexStorage",game:GetService("HttpService"):JSONEncode(objs))
	end)
	if err then
		CreateCaution("DexStorage Save Fail!","DexStorage broke! If you see this message, report to Raspberry Pi!")
	end
	print("hi")
	--]]
end

function updateDexStorageListeners()
	for i,v in pairs(dexStorageListeners) do
		v:Disconnect()
	end
	dexStorageListeners = {}
	for i,v in pairs(DexStorageMain:GetChildren()) do
		pcall(function()
			local ev = v.Changed:connect(updateDexStorage)
			table.insert(dexStorageListeners,ev)
		end)
	end
end

do
	NodeLookup[workspace.Parent] = {
		Object = workspace.Parent;
		Parent = nil;
		Index = 0;
		Expanded = true;
	}
	
	if DexStorageEnabled then
		NodeLookup[DexStorage] = {
			Object = DexStorage;
			Parent = nil;
			Index = 0;
			Expanded = true;
		}
	end
	
	if RunningScriptsStorageEnabled then
		NodeLookup[RunningScriptsStorage] = {
			Object = RunningScriptsStorage;
			Parent = nil;
			Index = 0;
			Expanded = true;
		}
	end

	if UpvalueStorageEnabled then
		NodeLookup[UpvalueStorage] = {
			Object = UpvalueStorage;
			Parent = nil;
			Index = 0;
			Expanded = true;
		}
	end

	Connect(game.DescendantAdded,addObject)
	Connect(game.DescendantRemoving,removeObject)
	
	if DexStorageEnabled then
		--[[
		if readfile(getelysianpath().."DexStorage.txt") == nil then
			writefile(getelysianpath().."DexStorage.txt","")
		end
		--]]
		
		buildDexStorage()
	
		Connect(DexStorage.DescendantAdded,addObject)
		Connect(DexStorage.DescendantRemoving,removeObject)
	
		Connect(DexStorage.DescendantAdded,updateDexStorage)
		Connect(DexStorage.DescendantRemoving,updateDexStorage)
	end

	if UpvalueStorageEnabled then
		Connect(UpvalueStorageVariables.DescendantAdded,addObject)
		Connect(UpvalueStorageVariables.DescendantRemoving,removeObject)
	
		Connect(UpvalueStorageFunctions.DescendantAdded,addObject)
		Connect(UpvalueStorageFunctions.DescendantRemoving,removeObject)
	end
	
	if RunningScriptsStorageEnabled then
		Connect(RunningScriptsStorage.DescendantAdded,addObject)
		Connect(RunningScriptsStorage.DescendantRemoving,removeObject)		
		
		--[[ local currentTable = get_nil_instances()
		
		spawn(function()
			while true do
				if #currentTable ~= #get_nil_instances() then
					currentTable = get_nil_instances()
					--RunningScriptsStorageMain:ClearAllChildren()
					for i,v in pairs(get_nil_instances() do
						if v ~= RunningScriptsStorage and v ~= DexStorage and v ~= UpvalueStorage then
							pcall(function()
								v.Parent = RunningScriptsStorageMain
							end)
						end
					end
				end
				wait(60)
			end
		end)]]
	end

	local function get(o)
		return o:GetDescendants()
	end

	local function r(o)
		local s,children = pcall(get,o)
		if s then
			for i = 1,#children do
				addObject(children[i],true)
				-- r(children[i])
			end
		end
	end

	r(workspace.Parent)

	if DexStorageEnabled then
		r(DexStorage)
	end
	if RunningScriptsStorageEnabled then
		r(RunningScriptsStorage)
	end
	if UpvalueStorageEnabled then
		r(UpvalueStorage)
	end

	scrollBar.VisibleSpace = math.ceil(listFrame.AbsoluteSize.y/ENTRY_BOUND)
	updateList()
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
---- Actions

local actionButtons do
	actionButtons = {}

	local totalActions = 1
	local currentActions = totalActions
	local function makeButton(icon,over,name,vis,cond)
		local buttonEnabled = false
		
		local button = Create(Icon('ImageButton',icon),{
			Name = name .. "Button";
			Visible = Option.Modifiable and Option.Selectable;
			Position = UDim2.new(1,-(GUI_SIZE+2)*currentActions+2,0.25,-GUI_SIZE/2);
			Size = UDim2.new(0,GUI_SIZE,0,GUI_SIZE);
			Parent = headerFrame;
		})

		local tipText = Create('TextLabel',{
			Name = name .. "Text";
			Text = name;
			Visible = false;
			BackgroundTransparency = 1;
			TextXAlignment = 'Right';
			Font = FONT;
			FontSize = FONT_SIZE;
			Position = UDim2.new(0,0,0,0);
			Size = UDim2.new(1,-(GUI_SIZE+2)*totalActions,1,0);
			Parent = headerFrame;
		})

		
		button.MouseEnter:connect(function()
			if buttonEnabled then
				button.BackgroundTransparency = 0.9
			end
			--Icon(button,over)
			--tipText.Visible = true
		end)
		button.MouseLeave:connect(function()
			button.BackgroundTransparency = 1
			--Icon(button,icon)
			--tipText.Visible = false
		end)

		currentActions = currentActions + 1
		actionButtons[#actionButtons+1] = {Obj = button,Cond = cond}
		QuickButtons[#actionButtons+1] = {Obj = button,Cond = cond, Toggle = function(on)
			if on then
				buttonEnabled = true
				Icon(button,over)
			else
				buttonEnabled = false
				Icon(button,icon)
			end
		end}
		return button
	end

	--local clipboard = {}
	local function delete(o)
		o.Parent = nil
	end
	
	makeButton(ACTION_EDITQUICKACCESS,ACTION_EDITQUICKACCESS,"Options",true,function()return true end).MouseButton1Click:connect(function()
		
	end)
	

	-- DELETE
	makeButton(ACTION_DELETE,ACTION_DELETE_OVER,"Delete",true,function() return #Selection:Get() > 0 end).MouseButton1Click:connect(function()
		if not Option.Modifiable then return end
		local list = Selection:Get()
		for i = 1,#list do
			pcall(delete,list[i])
		end
		Selection:Set({})
	end)
	
	-- PASTE
	makeButton(ACTION_PASTE,ACTION_PASTE_OVER,"Paste",true,function() return #Selection:Get() > 0 and #clipboard > 0 end).MouseButton1Click:connect(function()
		if not Option.Modifiable then return end
		local parent = Selection.List[1] or workspace
		for i = 1,#clipboard do
			clipboard[i]:Clone().Parent = parent
		end
	end)
	
	-- COPY
	makeButton(ACTION_COPY,ACTION_COPY_OVER,"Copy",true,function() return #Selection:Get() > 0 end).MouseButton1Click:connect(function()
		if not Option.Modifiable then return end
		clipboard = {}
		local list = Selection.List
		for i = 1,#list do
			table.insert(clipboard,list[i]:Clone())
		end
		updateActions()
	end)
	
	-- CUT
	makeButton(ACTION_CUT,ACTION_CUT_OVER,"Cut",true,function() return #Selection:Get() > 0 end).MouseButton1Click:connect(function()
		if not Option.Modifiable then return end
		clipboard = {}
		local list = Selection.List
		local cut = {}
		for i = 1,#list do
			local obj = list[i]:Clone()
			if obj then
				table.insert(clipboard,obj)
				table.insert(cut,list[i])
			end
		end
		for i = 1,#cut do
			pcall(delete,cut[i])
		end
		updateActions()
	end)
	
	-- FREEZE
	makeButton(ACTION_FREEZE,ACTION_FREEZE,"Freeze",true,function() return true end)
	
	-- ADD/REMOVE STARRED
	makeButton(ACTION_ADDSTAR,ACTION_ADDSTAR_OVER,"Star",true,function() return #Selection:Get() > 0 end)
	
	-- STARRED
	makeButton(ACTION_STARRED,ACTION_STARRED,"Starred",true,function() return true end)


	-- SORT
	-- local actionSort = makeButton(ACTION_SORT,ACTION_SORT_OVER,"Sort")
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
---- Option Bindables

do
	local optionCallback = {
		Modifiable = function(value)
			for i = 1,#actionButtons do
				actionButtons[i].Obj.Visible = value and Option.Selectable
			end
			cancelReparentDrag()
		end;
		Selectable = function(value)
			for i = 1,#actionButtons do
				actionButtons[i].Obj.Visible = value and Option.Modifiable
			end
			cancelSelectDrag()
			Selection:Set({})
		end;
	}

	local bindSetOption = explorerPanel:FindFirstChild("SetOption")
	if not bindSetOption then
		bindSetOption = Create('BindableFunction',{Name = "SetOption"})
		bindSetOption.Parent = explorerPanel
	end

	bindSetOption.OnInvoke = function(optionName,value)
		if optionCallback[optionName] then
			Option[optionName] = value
			optionCallback[optionName](value)
		end
	end

	local bindGetOption = explorerPanel:FindFirstChild("GetOption")
	if not bindGetOption then
		bindGetOption = Create('BindableFunction',{Name = "GetOption"})
		bindGetOption.Parent = explorerPanel
	end

	bindGetOption.OnInvoke = function(optionName)
		if optionName then
			return Option[optionName]
		else
			local options = {}
			for k,v in pairs(Option) do
				options[k] = v
			end
			return options
		end
	end
end

function SelectionVar()
	return Selection
end

Input.InputBegan:connect(function(key)
	if key.KeyCode == Enum.KeyCode.LeftControl then
		HoldingCtrl = true
	end
	if key.KeyCode == Enum.KeyCode.LeftShift then
		HoldingShift = true
	end
end)

Input.InputEnded:connect(function(key)
	if key.KeyCode == Enum.KeyCode.LeftControl then
		HoldingCtrl = false
	end
	if key.KeyCode == Enum.KeyCode.LeftShift then
		HoldingShift = false
	end
end)

while RbxApi == nil do
	RbxApi = GetApiRemote:Invoke()
	wait()
end

explorerFilter.FocusLost:connect(function()
	rawUpdateList()
end)

--[[local lastType = 0

explorerFilter.Changed:connect(function(prop)
	if prop == "Text" then
		if tick() - lastType > 1 then
			rawUpdateList()
		end
		lastType = tick()
	end
end)]]

CurrentInsertObjectWindow = CreateInsertObjectMenu(
	GetClasses(),
	"",
	false,
	function(option)
		CurrentInsertObjectWindow.Visible = false
		local list = SelectionVar():Get()
		for i = 1,#list do
			pcall(function() Instance.new(option,list[i]) end)
		end
		DestroyRightClick()
	end
)
end)
spawn(function()
	--[[
	
Change log:

09/18
	Fixed checkbox mouseover sprite
	Encapsulated checkbox creation into separate method
	Fixed another checkbox issue

09/15
	Invalid input is ignored instead of setting to default of that data type
	Consolidated control methods and simplified them
	All input goes through ToValue method
	Fixed position of BrickColor palette
	Made DropDown appear above row if it would otherwise exceed the page height
	Cleaned up stylesheets

09/14
	Made properties window scroll when mouse wheel scrolled
	Object/Instance and Color3 data types handled properly
	Multiple BrickColor controls interfering with each other fixed
	Added support for Content data type
	
--]]

wait(0.2)

-- Services
local Teams = game:GetService("Teams")
local Workspace = game:GetService("Workspace")
local Debris = game:GetService("Debris")
local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Functions
function httpGet(url)
	return game:HttpGet(url,true)
end

-- RbxApi Stuff
local maxChunkSize = 100 * 1000
local ApiJson
if script:FindFirstChild("RawApiJson") then
	ApiJson = script.RawApiJson
else
	ApiJson = ""
end



function getCurrentApiJson()
	return game:HttpGet("https://anaminus.github.io/rbx/json/api/latest.json", true);
end

function splitStringIntoChunks(jsonStr)
	-- Splits up a string into a table with a given size
	local t = {}
	for i = 1, math.ceil(string.len(jsonStr)/maxChunkSize) do
		local str = jsonStr:sub((i-1)*maxChunkSize+1, i*maxChunkSize)
		table.insert(t, str)
	end
	return t
end

local jsonToParse = getCurrentApiJson()
local apiChunks = splitStringIntoChunks(jsonToParse)

function getRbxApi()
--[[
	Api.Classes
	Api.Enums
	Api.GetProperties(className)
	Api.IsEnum(valueType)
--]]

-- Services
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Remotes
--local Remotes = ReplicatedStorage:WaitForChild("OnlineStudio"):WaitForChild("Remotes")
--local GetApiJsonFunction = Remotes:WaitForChild("GetApiJson")

-- Functions
local JsonDecode = function(s) return HttpService:JSONDecode(s) end

local function GetApiRemoteFunction(index)
	if (apiChunks[index]) then 
		return apiChunks[index], #apiChunks
	else
		return nil
	end
end

local function getApiJson()
	local apiTable = {}
	local firstPage, pageCount = GetApiRemoteFunction(1)
	table.insert(apiTable, firstPage)
	for i = 2, pageCount do
		--print("Fetching API page # " .. tostring(i))
		local result = GetApiRemoteFunction(i)
		table.insert(apiTable, result)
	end
	return table.concat(apiTable)
end

local json = getApiJson()
local apiDump =  JsonDecode(json)

local Classes = {}
local Enums = {}

local function sortAlphabetic(t, property)
	table.sort(t, 
		function(x,y) return x[property] < y[property]
	end)
end

local function isEnum(name)
	return Enums[name] ~= nil
end

local function getProperties(className)
	local class = Classes[className]
	local properties = {}
	
	if not class then return properties end
	
	while class do
		for _,property in pairs(class.Properties) do
			table.insert(properties, property)
		end
		class = Classes[class.Superclass]
	end
	
	sortAlphabetic(properties, "Name")

	return properties
end

for _,item in pairs(apiDump) do
	local itemType = item.type
-- Classes --
	if (itemType == 'Class') then
		Classes[item.Name] = item
		item.Properties = {}
		item.Functions = {}
		item.YieldFunctions = {}
		item.Events = {}
		item.Callbacks = {}
-- Members --
	elseif (itemType == 'Property') then
		table.insert(Classes[item.Class].Properties, item)
	elseif (itemType == 'Function') then
		table.insert(Classes[item.Class].Functions, item)
	elseif (itemType == 'YieldFunction') then
		table.insert(Classes[item.Class].YieldFunctions, item)
	elseif (itemType == 'Event') then
		table.insert(Classes[item.Class].Events, item)
	elseif (itemType == 'Callback') then
		table.insert(Classes[item.Class].Callbacks, item)
-- Enums --
	elseif (itemType == 'Enum') then
		Enums[item.Name] = item
		item.EnumItems = {}
	elseif (itemType == 'EnumItem') then
		Enums[item.Enum].EnumItems[item.Name] = item
	end
end

return {
	Classes = Classes;
	Enums = Enums;
	GetProperties = getProperties;
	IsEnum = isEnum;
}
end

-- Modules
local Permissions = {CanEdit = true}
local RbxApi = getRbxApi()

--[[
	RbxApi.Classes
	RbxApi.Enums
	RbxApi.GetProperties(className)
	RbxApi.IsEnum(valueType)
--]]

-- Styles

local function CreateColor3(r, g, b) return Color3.new(r/255,g/255,b/255) end

local Styles = {
	Font = Enum.Font.Arial;
	Margin = 5;
	Black = CreateColor3(0,0,0);
	White = CreateColor3(32,32,32);
}

local Row = {
	Font = Styles.Font;
	FontSize = Enum.FontSize.Size14;
	TextXAlignment = Enum.TextXAlignment.Left;
	TextColor = Color3.fromRGB(244,244,244);
	TextColorOver = Color3.fromRGB(244,244,244);
	TextLockedColor = CreateColor3(230,230,230);
	Height = 24;
	BorderColor = CreateColor3(216/4,216/4,216/4);
	BackgroundColor = Styles.White;
	BackgroundColorAlternate = CreateColor3(32, 32, 32);
	BackgroundColorMouseover = CreateColor3(40, 40, 40);
	TitleMarginLeft = 15;
}

local DropDown = {
	Font = Styles.Font;
	FontSize = Enum.FontSize.Size14;
	TextColor = CreateColor3(255,255,255);
	TextColorOver = Color3.new(1, 1, 1);
	TextXAlignment = Enum.TextXAlignment.Left;
	Height = 16;
	BackColor = Styles.White;
	BackColorOver = CreateColor3(197, 28, 70); 
	BorderColor = CreateColor3(45,45,45);
	BorderSizePixel = 2;
	ArrowColor = CreateColor3(160/2,160/2,160/2);
	ArrowColorOver = Styles.Black;
}

local BrickColors = {
	BoxSize = 13;
	BorderSizePixel = 1;
	BorderColor = CreateColor3(160,160,160);
	FrameColor = CreateColor3(160,160,160);
	Size = 20;
	Padding = 4;
	ColorsPerRow = 8;
	OuterBorder = 1;
	OuterBorderColor = Styles.Black;
}

wait(1)

local Gui = D_E_X
local PropertiesFrame = Gui:WaitForChild("PropertiesFrame")
local ExplorerFrame = Gui:WaitForChild("ExplorerPanel")

local bindGetSelection = ExplorerFrame.GetSelection
local bindSelectionChanged = ExplorerFrame.SelectionChanged
local bindGetApi = PropertiesFrame.GetApi
local bindGetAwait = PropertiesFrame.GetAwaiting
local bindSetAwait = PropertiesFrame.SetAwaiting

local ContentUrl = ContentProvider.BaseUrl .. "asset/?id="

local SettingsRemote = Gui:WaitForChild("SettingsPanel"):WaitForChild("GetSetting")

local propertiesSearch = PropertiesFrame.Header.TextBox

local AwaitingObjectValue = false
local AwaitingObjectObj
local AwaitingObjectProp

function searchingProperties()
	if propertiesSearch.Text ~= "" and propertiesSearch.Text ~= "Search Properties" then
		return true
	end
	return false
end

local function GetSelection()
	local selection = bindGetSelection:Invoke()
	if #selection == 0 then
		return nil
	else
		return selection
	end 
end

-- Number

local function Round(number, decimalPlaces)
	return tonumber(string.format("%." .. (decimalPlaces or 0) .. "f", number))
end

-- Strings

local function Split(str, delimiter)
	local start = 1
	local t = {}
	while true do
		local pos = string.find (str, delimiter, start, true)
		if not pos then
			break
		end
		table.insert (t, string.sub (str, start, pos - 1))
		start = pos + string.len (delimiter)
	end
	table.insert (t, string.sub (str, start))
	return t
end

-- Data Type Handling

local function ToString(value, type)
	if type == "float" then
		return tostring(Round(value,2))
	elseif type == "Content" then
		if string.find(value,"/asset") then
			local match = string.find(value, "=") + 1
			local id = string.sub(value, match)
			return id
		else
			return tostring(value)
		end
	elseif type == "Vector2" then
		local x = value.x
		local y = value.y
		return string.format("%g, %g", x,y)
	elseif type == "Vector3" then
		local x = value.x
		local y = value.y
		local z = value.z
		return string.format("%g, %g, %g", x,y,z)
	elseif type == "Color3" then
		local r = value.r
		local g = value.g
		local b = value.b
		return string.format("%d, %d, %d", r*255,g*255,b*255)
	elseif type == "UDim2" then
		local xScale = value.X.Scale
		local xOffset = value.X.Offset
		local yScale = value.Y.Scale
		local yOffset = value.Y.Offset
		return string.format("{%d, %d}, {%d, %d}", xScale, xOffset, yScale, yOffset)
	else
		return tostring(value)
	end
end

local function ToValue(value,type)
	if type == "Vector2" then
		local list = Split(value,",")
		if #list < 2 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		return Vector2.new(x,y)
	elseif type == "Vector3" then
		local list = Split(value,",")
		if #list < 3 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		local z = tonumber(list[3]) or 0
		return Vector3.new(x,y,z)
	elseif type == "Color3" then
		local list = Split(value,",")
		if #list < 3 then return nil end
		local r = tonumber(list[1]) or 0
		local g = tonumber(list[2]) or 0
		local b = tonumber(list[3]) or 0
		return Color3.new(r/255,g/255, b/255)
	elseif type == "UDim2" then
		local list = Split(string.gsub(string.gsub(value, "{", ""),"}",""),",")
		if #list < 4 then return nil end
		local xScale = tonumber(list[1]) or 0
		local xOffset = tonumber(list[2]) or 0
		local yScale = tonumber(list[3]) or 0
		local yOffset = tonumber(list[4]) or 0
		return UDim2.new(xScale, xOffset, yScale, yOffset)
	elseif type == "Content" then
		if tonumber(value) ~= nil then
			value = ContentUrl .. value
		end
		return value
	elseif type == "float" or type == "int" or type == "double" then
		return tonumber(value)
	elseif type == "string" then
		return value
	elseif type == "NumberRange" then
		local list = Split(value,",")
		if #list == 1 then
			if tonumber(list[1]) == nil then return nil end
			local newVal = tonumber(list[1]) or 0
			return NumberRange.new(newVal)
		end
		if #list < 2 then return nil end
		local x = tonumber(list[1]) or 0
		local y = tonumber(list[2]) or 0
		return NumberRange.new(x,y)
	else
		return nil
	end
end


-- Tables

local function CopyTable(T)
  local t2 = {}
  for k,v in pairs(T) do
    t2[k] = v
  end
  return t2
end

local function SortTable(T)
	table.sort(T, 
		function(x,y) return x.Name < y.Name
	end)
end

-- Spritesheet
local Sprite = {
	Width = 13;
	Height = 13;
}

local Spritesheet = {
	Image = "http://www.roblox.com/asset/?id=128896947";
	Height = 256;
	Width = 256;
}

local Images = {
	"unchecked",
	"checked",
	"unchecked_over",
	"checked_over",
	"unchecked_disabled",
	"checked_disabled"
}

local function SpritePosition(spriteName)
	local x = 0
	local y = 0
	for i,v in pairs(Images) do
		if (v == spriteName) then
			return {x, y}
		end
		x = x + Sprite.Height
		if (x + Sprite.Width) > Spritesheet.Width then
			x = 0
			y = y + Sprite.Height
		end
	end
end

local function GetCheckboxImageName(checked, readOnly, mouseover)
	if checked then
		if readOnly then
			return "checked_disabled"
		elseif mouseover then
			return "checked_over"
		else
			return "checked"
		end
	else
		if readOnly then
			return "unchecked_disabled"
		elseif mouseover then
			return "unchecked_over"
		else
			return "unchecked"
		end
	end
end

local MAP_ID = 418720155

-- Gui Controls --

---- IconMap ----
-- Image size: 256px x 256px
-- Icon size: 16px x 16px
-- Padding between each icon: 2px
-- Padding around image edge: 1px
-- Total icons: 14 x 14 (196)
local Icon do
	local iconMap = 'http://www.roblox.com/asset/?id=' .. MAP_ID
	game:GetService('ContentProvider'):Preload(iconMap)
	local iconDehash do
		-- 14 x 14, 0-based input, 0-based output
		local f=math.floor
		function iconDehash(h)
			return f(h/14%14),f(h%14)
		end
	end

	function Icon(IconFrame,index)
		local row,col = iconDehash(index)
		local mapSize = Vector2.new(256,256)
		local pad,border = 2,1
		local iconSize = 16

		local class = 'Frame'
		if type(IconFrame) == 'string' then
			class = IconFrame
			IconFrame = nil
		end

		if not IconFrame then
			IconFrame = Create(class,{
				Name = "Icon";
				BackgroundTransparency = 1;
				ClipsDescendants = true;
				Create('ImageLabel',{
					Name = "IconMap";
					Active = false;
					BackgroundTransparency = 1;
					Image = iconMap;
					Size = UDim2.new(mapSize.x/iconSize,0,mapSize.y/iconSize,0);
				});
			})
		end

		IconFrame.IconMap.Position = UDim2.new(-col - (pad*(col+1) + border)/iconSize,0,-row - (pad*(row+1) + border)/iconSize,0)
		return IconFrame
	end
end

local function CreateCell()
	local tableCell = Instance.new("Frame")
	tableCell.Size = UDim2.new(0.5, -1, 1, 0)
	tableCell.BackgroundColor3 = Row.BackgroundColor
	tableCell.BorderColor3 = Row.BorderColor
	return tableCell
end
	
local function CreateLabel(readOnly)
	local label = Instance.new("TextLabel")
	label.Font = Row.Font
	label.FontSize = Row.FontSize
	label.TextXAlignment = Row.TextXAlignment
	label.BackgroundTransparency = 1
	
	if readOnly then
		label.TextColor3 = Row.TextLockedColor
	else
		label.TextColor3 = Row.TextColor
	end
	return label
end

local function CreateTextButton(readOnly, onClick)
	local button = Instance.new("TextButton")
	button.Font = Row.Font
	button.FontSize = Row.FontSize
	button.TextXAlignment = Row.TextXAlignment
	button.BackgroundTransparency = 1
	if readOnly then
		button.TextColor3 = Row.TextLockedColor
	else
		button.TextColor3 = Row.TextColor
		button.MouseButton1Click:connect(function()
			onClick()
		end)
	end
	return button
end

local function CreateObject(readOnly)
	local button = Instance.new("TextButton")
	button.Font = Row.Font
	button.FontSize = Row.FontSize
	button.TextXAlignment = Row.TextXAlignment
	button.BackgroundTransparency = 1
	if readOnly then
		button.TextColor3 = Row.TextLockedColor
	else
		button.TextColor3 = Row.TextColor
	end
	local cancel = Create(Icon('ImageButton',177),{
		Name = "Cancel";
		Visible = false;
		Position = UDim2.new(1,-20,0,0);
		Size = UDim2.new(0,20,0,20);
		Parent = button;
	})
	return button
end

local function CreateTextBox(readOnly)
	if readOnly then
		local box = CreateLabel(readOnly)
		return box
	else
		local box = Instance.new("TextBox")
		if not SettingsRemote:Invoke("ClearProps") then
			box.ClearTextOnFocus = false
		end
		box.Font = Row.Font
		box.FontSize = Row.FontSize
		box.TextXAlignment = Row.TextXAlignment
		box.BackgroundTransparency = 1
		box.TextColor3 = Row.TextColor
		return box
	end
end

local function CreateDropDownItem(text, onClick)
	local button = Instance.new("TextButton")
	button.Font = DropDown.Font
	button.FontSize = DropDown.FontSize
	button.TextColor3 = DropDown.TextColor
	button.TextXAlignment = DropDown.TextXAlignment
	button.BackgroundColor3 = DropDown.BackColor
	button.AutoButtonColor = false
	button.BorderSizePixel = 0
	button.Active = true
	button.Text = text
	
	button.MouseEnter:connect(function()
		button.TextColor3 = DropDown.TextColorOver
		button.BackgroundColor3 = DropDown.BackColorOver
	end)
	button.MouseLeave:connect(function()
		button.TextColor3 = DropDown.TextColor
		button.BackgroundColor3 = DropDown.BackColor
	end)
	button.MouseButton1Click:connect(function()
		onClick(text)
	end)	
	return button
end

local function CreateDropDown(choices, currentChoice, readOnly, onClick)
	local frame = Instance.new("Frame")	
	frame.Name = "DropDown"
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundTransparency = 1
	frame.Active = true
	
	local menu = nil
	local arrow = nil
	local expanded = false
	local margin = DropDown.BorderSizePixel;
	
	local button = Instance.new("TextButton")
	button.Font = Row.Font
	button.FontSize = Row.FontSize
	button.TextXAlignment = Row.TextXAlignment
	button.BackgroundTransparency = 1
	button.TextColor3 = Row.TextColor
	if readOnly then
		button.TextColor3 = Row.TextLockedColor
	end
	button.Text = currentChoice
	button.Size = UDim2.new(1, -2 * Styles.Margin, 1, 0)
	button.Position = UDim2.new(0, Styles.Margin, 0, 0)
	button.Parent = frame
	
	local function showArrow(color)
		if arrow then arrow:Destroy() end
		
		local graphicTemplate = Create('Frame',{
			Name="Graphic";
			BorderSizePixel = 0;
			BackgroundColor3 = Color3.new(1, 1, 1);
		})
		local graphicSize = 16/2
		
		arrow = ArrowGraphic(graphicSize,'Down',true,graphicTemplate)
		arrow.Position = UDim2.new(1,-graphicSize * 2,0.5,-graphicSize/2)
		arrow.Parent = frame
	end
	
	local function hideMenu()
		expanded = false
		showArrow(DropDown.ArrowColor)
		if menu then menu:Destroy() end
	end
	
	local function showMenu()
		expanded = true
		menu = Instance.new("Frame")
		menu.Size = UDim2.new(1, -2 * margin, 0, #choices * DropDown.Height)
		menu.Position = UDim2.new(0, margin, 0, Row.Height + margin)
		menu.BackgroundTransparency = 0
		menu.BackgroundColor3 = DropDown.BackColor
		menu.BorderColor3 = DropDown.BorderColor
		menu.BorderSizePixel = DropDown.BorderSizePixel
		menu.Active = true
		menu.ZIndex = 5
		menu.Parent = frame
		
		local parentFrameHeight = menu.Parent.Parent.Parent.Parent.Size.Y.Offset
		local rowHeight = menu.Parent.Parent.Parent.Position.Y.Offset
		if (rowHeight + menu.Size.Y.Offset) > math.max(parentFrameHeight,PropertiesFrame.AbsoluteSize.y) then
			menu.Position = UDim2.new(0, margin, 0, -1 * (#choices * DropDown.Height) - margin)
		end
			
		local function choice(name)
			onClick(name)
			hideMenu()
		end
		
		for i,name in pairs(choices) do
			local option = CreateDropDownItem(name, function()
				choice(name)
			end)
			option.Size = UDim2.new(1, 0, 0, 16)
			option.Position = UDim2.new(0, 0, 0, (i - 1) * DropDown.Height)
			option.ZIndex = menu.ZIndex
			option.Parent = menu
		end
	end
	
	showArrow(DropDown.ArrowColor)
	
	if not readOnly then
		
		button.MouseEnter:connect(function()
			button.TextColor3 = Row.TextColor
		end)
		button.MouseLeave:connect(function()
			button.TextColor3 = Row.TextColor
		end)
		button.MouseButton1Click:connect(function()
			if expanded then
				hideMenu()
			else
				showMenu()
			end
		end)
	end
	
	return frame,button
end

local function CreateBrickColor(readOnly, onClick)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1,0,1,0)
	frame.BackgroundTransparency = 1
	
	local colorPalette = Instance.new("Frame")
	colorPalette.BackgroundTransparency = 0
	colorPalette.SizeConstraint = Enum.SizeConstraint.RelativeXX
	colorPalette.Size = UDim2.new(1, -2 * BrickColors.OuterBorder, 1, -2 * BrickColors.OuterBorder)
	colorPalette.BorderSizePixel = BrickColors.BorderSizePixel
	colorPalette.BorderColor3 = BrickColors.BorderColor
	colorPalette.Position = UDim2.new(0, BrickColors.OuterBorder, 0, BrickColors.OuterBorder + Row.Height)
	colorPalette.ZIndex = 5
	colorPalette.Visible = false
	colorPalette.BorderSizePixel = BrickColors.OuterBorder
	colorPalette.BorderColor3 = BrickColors.OuterBorderColor
	colorPalette.Parent = frame
	
	local function show()
		colorPalette.Visible = true
	end
	
	local function hide()
		colorPalette.Visible = false
	end
	
	local function toggle()
		colorPalette.Visible = not colorPalette.Visible
	end
	
	local colorBox = Instance.new("TextButton", frame)
	colorBox.Position = UDim2.new(0, Styles.Margin, 0, Styles.Margin)
	colorBox.Size = UDim2.new(0, BrickColors.BoxSize, 0, BrickColors.BoxSize)
	colorBox.Text = ""
	colorBox.MouseButton1Click:connect(function()
		if not readOnly then
			toggle()
		end
	end)
	
	if readOnly then
		colorBox.AutoButtonColor = false
	end
	
	local spacingBefore = (Styles.Margin * 2) + BrickColors.BoxSize
	
	local propertyLabel = CreateTextButton(readOnly, function()
		if not readOnly then
			toggle()
		end
	end)
	propertyLabel.Size = UDim2.new(1, (-1 * spacingBefore) - Styles.Margin, 1, 0)
	propertyLabel.Position = UDim2.new(0, spacingBefore, 0, 0)
	propertyLabel.Parent = frame
	
	local size = (1 / BrickColors.ColorsPerRow)
	
	for index = 0, 127 do
		local brickColor = BrickColor.palette(index)
		local color3 = brickColor.Color
		
		local x = size * (index % BrickColors.ColorsPerRow)
		local y = size * math.floor(index / BrickColors.ColorsPerRow)
	
		local brickColorBox = Instance.new("TextButton")
		brickColorBox.Text = ""
		brickColorBox.Size = UDim2.new(size,0,size,0)
		brickColorBox.BackgroundColor3 = color3
		brickColorBox.Position = UDim2.new(x, 0, y, 0)
		brickColorBox.ZIndex = colorPalette.ZIndex
		brickColorBox.Parent = colorPalette
	
		brickColorBox.MouseButton1Click:connect(function()
			hide()
			onClick(brickColor)
		end)
	end
	
	return frame,propertyLabel,colorBox
end

local function CreateColor3Control(readOnly, onClick)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1,0,1,0)
	frame.BackgroundTransparency = 1
	
	local colorBox = Instance.new("TextButton", frame)
	colorBox.Position = UDim2.new(0, Styles.Margin, 0, Styles.Margin)
	colorBox.Size = UDim2.new(0, BrickColors.BoxSize, 0, BrickColors.BoxSize)
	colorBox.Text = ""
	colorBox.AutoButtonColor = false
	
	local spacingBefore = (Styles.Margin * 2) + BrickColors.BoxSize
	local box = CreateTextBox(readOnly)
	box.Size = UDim2.new(1, (-1 * spacingBefore) - Styles.Margin, 1, 0)
	box.Position = UDim2.new(0, spacingBefore, 0, 0)
	box.Parent = frame
	
	return frame,box,colorBox
end

function CreateCheckbox(value, readOnly, onClick)
	local checked = value
	local mouseover = false

	local checkboxFrame = Instance.new("ImageButton")
	checkboxFrame.Size = UDim2.new(0, Sprite.Width, 0, Sprite.Height)
	checkboxFrame.BackgroundTransparency = 1
	checkboxFrame.ClipsDescendants = true
	--checkboxFrame.Position = UDim2.new(0, Styles.Margin, 0, Styles.Margin)

	local spritesheetImage = Instance.new("Frame", checkboxFrame);
	spritesheetImage.Name = "SpritesheetImageLabel";
	spritesheetImage.Size = UDim2.new(0, Spritesheet.Width, 0, Spritesheet.Height);
	spritesheetImage.BorderSizePixel = 0;
	spritesheetImage.BackgroundColor3 = Color3.fromRGB(113, 45, 59);

	local checkedImage = Instance.new("Frame", checkboxFrame);
	checkedImage.Name = "CheckedImageLabel";
	checkedImage.AnchorPoint = Vector2.new(0.5, 0.5);
	checkedImage.Position = UDim2.new(0.5, 0, 0.5, 0);
	checkedImage.Size = UDim2.new(0, 9, 0, 9);
	checkedImage.BorderSizePixel = 0;
	checkedImage.BackgroundColor3 = Color3.fromRGB(197, 28, 70);
	checkedImage.Visible = checked;
	
	local function updateSprite()
		checkedImage.Visible = checked;
	end
	
	local function setValue(val)
		checked = val
		updateSprite()
	end

	if not readOnly then
		--checkboxFrame.MouseEnter:connect(function() mouseover = true updateSprite() end)
		--checkboxFrame.MouseLeave:connect(function() mouseover = false updateSprite() end)
		checkboxFrame.MouseButton1Click:connect(function()
			onClick(checked)
		end)
	end
	
	updateSprite()
	
	return checkboxFrame, setValue
end



-- Code for handling controls of various data types --

local Controls = {}

Controls["default"] = function(object, propertyData, readOnly)
	local propertyName = propertyData["Name"]
	local propertyType = propertyData["ValueType"]
	
	local box = CreateTextBox(readOnly)
	box.Size = UDim2.new(1, -2 * Styles.Margin, 1, 0)
	box.Position = UDim2.new(0, Styles.Margin, 0, 0)

	local function update()
		local value = object[propertyName]
		box.Text = ToString(value, propertyType)
	end
	
	if not readOnly then
		box.FocusLost:connect(function(enterPressed)
			Set(object, propertyData, ToValue(box.Text,propertyType))
			update()
		end)
	end
	
	update()
	
	object.Changed:connect(function(property)
		if (property == propertyName) then
			update()
		end
	end)
	
	return box
end

Controls["bool"] = function(object, propertyData, readOnly)
	local propertyName = propertyData["Name"]
	local checked = object[propertyName]
	
	local checkbox, setValue = CreateCheckbox(checked, readOnly, function(value)
		Set(object, propertyData, not checked)
	end)
	checkbox.Position = UDim2.new(0, Styles.Margin, 0, Styles.Margin)
	
	setValue(checked)
	
	local function update()
		checked = object[propertyName]
		setValue(checked)
	end
	
	object.Changed:connect(function(property)
		if (property == propertyName) then
			update()
		end
	end)
	
	if object:IsA("BoolValue") then
		object.Changed:connect(function(val)
			update()
		end)
	end
	
	update()
	
	return checkbox
end

Controls["BrickColor"] = function(object, propertyData, readOnly)
	local propertyName = propertyData["Name"]

	local frame,label,brickColorBox = CreateBrickColor(readOnly, function(brickColor)
		Set(object, propertyData, brickColor)
	end)
	
	local function update()
		local value = object[propertyName]
		brickColorBox.BackgroundColor3 = value.Color
		label.Text = tostring(value)
	end
	
	update()
	
	object.Changed:connect(function(property)
		if (property == propertyName) then
			update()
		end
	end)
	
	return frame
end

Controls["Color3"] = function(object, propertyData, readOnly)
	local propertyName = propertyData["Name"]

	local frame,textBox,colorBox = CreateColor3Control(readOnly)
	
	textBox.FocusLost:connect(function(enterPressed)
		Set(object, propertyData, ToValue(textBox.Text,"Color3"))
		local value = object[propertyName]
		colorBox.BackgroundColor3 = value
		textBox.Text = ToString(value, "Color3")
	end)
			
	local function update()
		local value = object[propertyName]
		colorBox.BackgroundColor3 = value
		textBox.Text = ToString(value, "Color3")
	end
	
	update()
	
	object.Changed:connect(function(property)
		if (property == propertyName) then
			update()
		end
	end)
	
	return frame
end

Controls["Enum"] = function(object, propertyData, readOnly)
	local propertyName = propertyData["Name"]
	local propertyType = propertyData["ValueType"]
	
	local enumName = object[propertyName].Name
	
	local enumNames = {}
	for _,enum in pairs(Enum[tostring(propertyType)]:GetEnumItems()) do
		table.insert(enumNames, enum.Name)
	end
	
	local dropdown, propertyLabel = CreateDropDown(enumNames, enumName, readOnly, function(value)
		Set(object, propertyData, value)
	end)
	--dropdown.Parent = frame
	
	local function update()
		local value = object[propertyName].Name
		propertyLabel.Text = tostring(value)
	end
	
	update()
	
	object.Changed:connect(function(property)
		if (property == propertyName) then
			update()
		end
	end)
	
	return dropdown
end

Controls["Object"] = function(object, propertyData, readOnly)
	local propertyName = propertyData["Name"]
	local propertyType = propertyData["ValueType"]
	
	local box = CreateObject(readOnly,function()end)
	box.Size = UDim2.new(1, -2 * Styles.Margin, 1, 0)
	box.Position = UDim2.new(0, Styles.Margin, 0, 0)

	local function update()
		if AwaitingObjectObj == object then
			if AwaitingObjectValue == true then
				box.Text = "Select an Object"
				return
			end
		end
		local value = object[propertyName]
		box.Text = ToString(value, propertyType)
	end
	
	if not readOnly then
		box.MouseButton1Click:connect(function()
			if AwaitingObjectValue then
				AwaitingObjectValue = false
				update()
				return
			end
			AwaitingObjectValue = true
			AwaitingObjectObj = object
			AwaitingObjectProp = propertyData
			box.Text = "Select an Object"
		end)
		
		box.Cancel.Visible = true
		box.Cancel.MouseButton1Click:connect(function()
			object[propertyName] = nil
		end)
	end
	
	update()
	
	object.Changed:connect(function(property)
		if (property == propertyName) then
			update()
		end
	end)
	
	if object:IsA("ObjectValue") then
		object.Changed:connect(function(val)
			update()
		end)
	end
	
	return box
end

function GetControl(object, propertyData, readOnly)
	local propertyType = propertyData["ValueType"]
	local control = nil
	
	if Controls[propertyType] then
		control = Controls[propertyType](object, propertyData, readOnly)
	elseif RbxApi.IsEnum(propertyType) then
		control = Controls["Enum"](object, propertyData, readOnly)
	else
		control = Controls["default"](object, propertyData, readOnly)
	end
	return control
end
-- Permissions

function CanEditObject(object)
	local player = Players.LocalPlayer
	local character = player.Character
	return Permissions.CanEdit
end

function CanEditProperty(object,propertyData)
	local tags = propertyData["tags"]
	for _,name in pairs(tags) do
		if name == "readonly" then
			return false
		end
	end
	return CanEditObject(object)
end

--RbxApi
local function PropertyIsHidden(propertyData)
	local tags = propertyData["tags"]
	for _,name in pairs(tags) do
		if name == "deprecated"
			or name == "hidden"
			or name == "writeonly" then
			return true
		end
	end
	return false
end

function Set(object, propertyData, value)
	local propertyName = propertyData["Name"]
	local propertyType = propertyData["ValueType"]
	
	if value == nil then return end
	
	for i,v in pairs(GetSelection()) do
		if CanEditProperty(v,propertyData) then
			pcall(function()
				--print("Setting " .. propertyName .. " to " .. tostring(value))
				v[propertyName] = value
			end)
		end
	end
end

function CreateRow(object, propertyData, isAlternateRow)
	local propertyName = propertyData["Name"]
	local propertyType = propertyData["ValueType"]
	local propertyValue = object[propertyName]
	--rowValue, rowValueType, isAlternate
	local backColor = Row.BackgroundColor;
	if (isAlternateRow) then
		backColor = Row.BackgroundColorAlternate
	end
	
	local readOnly = not CanEditProperty(object, propertyData)
	if propertyType == "Instance" or propertyName == "Parent" then readOnly = true end

	local rowFrame = Instance.new("Frame")
	rowFrame.Size = UDim2.new(1,0,0,Row.Height)
	rowFrame.BackgroundTransparency = 1
	rowFrame.Name = 'Row'

	local propertyLabelFrame = CreateCell()
	propertyLabelFrame.Parent = rowFrame
	propertyLabelFrame.ClipsDescendants = true
	
	local propertyLabel = CreateLabel(readOnly)
	propertyLabel.Text = propertyName
	propertyLabel.Size = UDim2.new(1, -1 * Row.TitleMarginLeft, 1, 0)
	propertyLabel.Position = UDim2.new(0, Row.TitleMarginLeft, 0, 0)
	propertyLabel.Parent = propertyLabelFrame

	local propertyValueFrame = CreateCell()
	propertyValueFrame.Size = UDim2.new(0.5, -1, 1, 0)
	propertyValueFrame.Position = UDim2.new(0.5, 0, 0, 0)
	propertyValueFrame.Parent = rowFrame

	local control = GetControl(object, propertyData, readOnly)
	control.Parent = propertyValueFrame

	rowFrame.MouseEnter:connect(function()
		propertyLabelFrame.BackgroundColor3 = Row.BackgroundColorMouseover
		propertyValueFrame.BackgroundColor3 = Row.BackgroundColorMouseover
	end)
	rowFrame.MouseLeave:connect(function()
		propertyLabelFrame.BackgroundColor3 = backColor
		propertyValueFrame.BackgroundColor3 = backColor
	end)
	
	propertyLabelFrame.BackgroundColor3 = backColor
	propertyValueFrame.BackgroundColor3 = backColor
	
	return rowFrame
end

function ClearPropertiesList()
	for _,instance in pairs(ContentFrame:GetChildren()) do
		instance:Destroy()
	end
end

local selection = Gui:FindFirstChild("Selection", 1)

function displayProperties(props)
	for i,v in pairs(props) do
		pcall(function()
			local a = CreateRow(v.object, v.propertyData, ((numRows % 2) == 0))
			a.Position = UDim2.new(0,0,0,numRows*Row.Height)
			a.Parent = ContentFrame
			numRows = numRows + 1
		end)
	end
end

function checkForDupe(prop,props)
	for i,v in pairs(props) do
		if v.propertyData.Name == prop.Name and v.propertyData.ValueType == prop.ValueType then
			return true
		end
	end
	return false
end

function sortProps(t)
	table.sort(t, 
		function(x,y) return x.propertyData.Name < y.propertyData.Name
	end)
end

function showProperties(obj)
	ClearPropertiesList()
	if obj == nil then return end
	local propHolder = {}
	local foundProps = {}
	numRows = 0
	for _,nextObj in pairs(obj) do
		if not foundProps[nextObj.className] then
			foundProps[nextObj.className] = true
			for i,v in pairs(RbxApi.GetProperties(nextObj.className)) do
				local suc, err = pcall(function()
					if not (PropertyIsHidden(v)) and not checkForDupe(v,propHolder) then
						if string.find(string.lower(v.Name),string.lower(propertiesSearch.Text)) or not searchingProperties() then
							table.insert(propHolder,{propertyData = v, object = nextObj})
						end
					end
				end)
				--[[if not suc then 
					warn("Problem getting the value of property " .. v.Name .. " | " .. err)
				end	--]]
			end
		end
	end
	sortProps(propHolder)
	displayProperties(propHolder)
	ContentFrame.Size = UDim2.new(1, 0, 0, numRows * Row.Height)
	scrollBar.ScrollIndex = 0
	scrollBar.TotalSpace = numRows * Row.Height
	scrollBar.Update()
end

----------------------------------------------------------------
-----------------------SCROLLBAR STUFF--------------------------
----------------------------------------------------------------
----------------------------------------------------------------
local ScrollBarWidth = 16

local ScrollStyles = {
	Background      = Color3.fromRGB(233, 233, 233);
	Border          = Color3.fromRGB(149, 149, 149);
	Selected        = Color3.fromRGB( 63, 119, 189);
	BorderSelected  = Color3.fromRGB( 55, 106, 167);
	Text            = Color3.fromRGB(  0,   0,   0);
	TextDisabled    = Color3.fromRGB(128, 128, 128);
	TextSelected    = Color3.fromRGB(255, 255, 255);
	Button          = Color3.fromRGB( 35,  35,  35);
	ButtonBorder    = Color3.fromRGB(149, 149, 149);
	ButtonSelected  = Color3.fromRGB(255,   0,   0);
	Field           = Color3.fromRGB(255, 255, 255);
	FieldBorder     = Color3.fromRGB(191, 191, 191);
	TitleBackground = Color3.fromRGB(178, 178, 178);
}
do
	local ZIndexLock = {}
	function SetZIndex(object,z)
		if not ZIndexLock[object] then
			ZIndexLock[object] = true
			if object:IsA'GuiObject' then
				object.ZIndex = z
			end
			local children = object:GetChildren()
			for i = 1,#children do
				SetZIndex(children[i],z)
			end
			ZIndexLock[object] = nil
		end
	end
end
function SetZIndexOnChanged(object)
	return object.Changed:connect(function(p)
		if p == "ZIndex" then
			SetZIndex(object,object.ZIndex)
		end
	end)
end
function Create(ty,data)
	local obj
	if type(ty) == 'string' then
		obj = Instance.new(ty)
	else
		obj = ty
	end
	for k, v in pairs(data) do
		if type(k) == 'number' then
			v.Parent = obj
		else
			obj[k] = v
		end
	end
	return obj
end
-- returns the ascendant ScreenGui of an object
function GetScreen(screen)
	if screen == nil then return nil end
	while not screen:IsA("ScreenGui") do
		screen = screen.Parent
		if screen == nil then return nil end
	end
	return screen
end
-- AutoButtonColor doesn't always reset properly
function ResetButtonColor(button)
	local active = button.Active
	button.Active = not active
	button.Active = active
end

function ArrowGraphic(size,dir,scaled,template)
	local Frame = Create('Frame',{
		Name = "Arrow Graphic";
		BorderSizePixel = 0;
		Size = UDim2.new(0,size,0,size);
		Transparency = 1;
	})
	if not template then
		template = Instance.new("Frame")
		template.BorderSizePixel = 0
	end

	template.BackgroundColor3 = Color3.new(1, 1, 1);

	local transform
	if dir == nil or dir == 'Up' then
		function transform(p,s) return p,s end
	elseif dir == 'Down' then
		function transform(p,s) return UDim2.new(0,p.X.Offset,0,size-p.Y.Offset-1),s end
	elseif dir == 'Left' then
		function transform(p,s) return UDim2.new(0,p.Y.Offset,0,p.X.Offset),UDim2.new(0,s.Y.Offset,0,s.X.Offset) end
	elseif dir == 'Right' then
		function transform(p,s) return UDim2.new(0,size-p.Y.Offset-1,0,p.X.Offset),UDim2.new(0,s.Y.Offset,0,s.X.Offset) end
	end

	local scale
	if scaled then
		function scale(p,s) return UDim2.new(p.X.Offset/size,0,p.Y.Offset/size,0),UDim2.new(s.X.Offset/size,0,s.Y.Offset/size,0) end
	else
		function scale(p,s) return p,s end
	end

	local o = math.floor(size/4)
	if size%2 == 0 then
		local n = size/2-1
		for i = 0,n do
			local t = template:Clone()
			local p,s = scale(transform(
				UDim2.new(0,n-i,0,o+i),
				UDim2.new(0,(i+1)*2,0,1)
			))
			t.Position = p
			t.Size = s
			t.Parent = Frame
		end
	else
		local n = (size-1)/2
		for i = 0,n do
			local t = template:Clone()
			local p,s = scale(transform(
				UDim2.new(0,n-i,0,o+i),
				UDim2.new(0,i*2+1,0,1)
			))
			t.Position = p
			t.Size = s
			t.Parent = Frame
		end
	end
	if size%4 > 1 then
		local t = template:Clone()
		local p,s = scale(transform(
			UDim2.new(0,0,0,size-o-1),
			UDim2.new(0,size,0,1)
		))
		t.Position = p
		t.Size = s
		t.Parent = Frame
	end

	for i,v in pairs(Frame:GetChildren()) do
		v.BackgroundColor3 = Color3.new(1, 1, 1);
	end

	return Frame
end

function GripGraphic(size,dir,spacing,scaled,template)
	local Frame = Create('Frame',{
		Name = "Grip Graphic";
		BorderSizePixel = 0;
		Size = UDim2.new(0,size.x,0,size.y);
		Transparency = 1;
	})
	if not template then
		template = Instance.new("Frame")
		template.BorderSizePixel = 0
	end

	spacing = spacing or 2

	local scale
	if scaled then
		function scale(p) return UDim2.new(p.X.Offset/size.x,0,p.Y.Offset/size.y,0) end
	else
		function scale(p) return p end
	end

	if dir == 'Vertical' then
		for i=0,size.x-1,spacing do
			local t = template:Clone()
			t.Size = scale(UDim2.new(0,1,0,size.y))
			t.Position = scale(UDim2.new(0,i,0,0))
			t.Parent = Frame
		end
	elseif dir == nil or dir == 'Horizontal' then
		for i=0,size.y-1,spacing do
			local t = template:Clone()
			t.Size = scale(UDim2.new(0,size.x,0,1))
			t.Position = scale(UDim2.new(0,0,0,i))
			t.Parent = Frame
		end
	end

	return Frame
end

do
	local mt = {
		__index = {
			GetScrollPercent = function(self)
				return self.ScrollIndex/(self.TotalSpace-self.VisibleSpace)
			end;
			CanScrollDown = function(self)
				return self.ScrollIndex + self.VisibleSpace < self.TotalSpace
			end;
			CanScrollUp = function(self)
				return self.ScrollIndex > 0
			end;
			ScrollDown = function(self)
				self.ScrollIndex = self.ScrollIndex + self.PageIncrement
				self:Update()
			end;
			ScrollUp = function(self)
				self.ScrollIndex = self.ScrollIndex - self.PageIncrement
				self:Update()
			end;
			ScrollTo = function(self,index)
				self.ScrollIndex = index
				self:Update()
			end;
			SetScrollPercent = function(self,percent)
				self.ScrollIndex = math.floor((self.TotalSpace - self.VisibleSpace)*percent + 0.5)
				self:Update()
			end;
		};
	}
	mt.__index.CanScrollRight = mt.__index.CanScrollDown
	mt.__index.CanScrollLeft = mt.__index.CanScrollUp
	mt.__index.ScrollLeft = mt.__index.ScrollUp
	mt.__index.ScrollRight = mt.__index.ScrollDown

	function ScrollBar(horizontal)
		-- create row scroll bar
		local ScrollFrame = Create('Frame',{
			Name = "ScrollFrame";
			Position = horizontal and UDim2.new(0,0,1,-ScrollBarWidth) or UDim2.new(1,-ScrollBarWidth,0,0);
			Size = horizontal and UDim2.new(1,0,0,ScrollBarWidth) or UDim2.new(0,ScrollBarWidth,1,0);
			BackgroundTransparency = 1;
			Create('ImageButton',{
				Name = "ScrollDown";
				Position = horizontal and UDim2.new(1,-ScrollBarWidth,0,0) or UDim2.new(0,0,1,-ScrollBarWidth);
				Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
				BackgroundColor3 = ScrollStyles.Button;
				BorderColor3 = ScrollStyles.Border;
				BorderSizePixel = 0;
			});
			Create('ImageButton',{
				Name = "ScrollUp";
				Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
				BackgroundColor3 = ScrollStyles.Button;
				BorderColor3 = ScrollStyles.Border;
				BorderSizePixel = 0;
			});
			Create('ImageButton',{
				Name = "ScrollBar";
				Size = horizontal and UDim2.new(1,-ScrollBarWidth*2,1,0) or UDim2.new(1,0,1,-ScrollBarWidth*2);
				Position = horizontal and UDim2.new(0,ScrollBarWidth,0,0) or UDim2.new(0,0,0,ScrollBarWidth);
				AutoButtonColor = false;
				BackgroundColor3 = Color3.fromRGB(20, 20, 20);
				BorderColor3 = ScrollStyles.Border;
				BorderSizePixel = 0;
				Create('ImageButton',{
					Name = "ScrollThumb";
					AutoButtonColor = false;
					Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
					BackgroundColor3 = ScrollStyles.Button;
					BorderColor3 = ScrollStyles.Border;
					BorderSizePixel = 0;
				});
			});
		})

		local graphicTemplate = Create('Frame',{
			Name="Graphic";
			BorderSizePixel = 0;
			BackgroundColor3 = Color3.new(1, 1, 1);
		})
		local graphicSize = ScrollBarWidth/2

		local ScrollDownFrame = ScrollFrame.ScrollDown
			local ScrollDownGraphic = ArrowGraphic(graphicSize,horizontal and 'Right' or 'Down',true,graphicTemplate)
			ScrollDownGraphic.Position = UDim2.new(0.5,-graphicSize/2,0.5,-graphicSize/2)
			ScrollDownGraphic.Parent = ScrollDownFrame
		local ScrollUpFrame = ScrollFrame.ScrollUp
			local ScrollUpGraphic = ArrowGraphic(graphicSize,horizontal and 'Left' or 'Up',true,graphicTemplate)
			ScrollUpGraphic.Position = UDim2.new(0.5,-graphicSize/2,0.5,-graphicSize/2)
			ScrollUpGraphic.Parent = ScrollUpFrame
		local ScrollBarFrame = ScrollFrame.ScrollBar
		local ScrollThumbFrame = ScrollBarFrame.ScrollThumb
		do
			local size = ScrollBarWidth*3/8
			local Decal = GripGraphic(Vector2.new(size,size),horizontal and 'Vertical' or 'Horizontal',2,graphicTemplate)
			Decal.Position = UDim2.new(0.5,-size/2,0.5,-size/2)
			Decal.Parent = ScrollThumbFrame
		end

		local MouseDrag = Create('ImageButton',{
			Name = "MouseDrag";
			Position = UDim2.new(-0.25,0,-0.25,0);
			Size = UDim2.new(1.5,0,1.5,0);
			Transparency = 1;
			AutoButtonColor = false;
			Active = true;
			ZIndex = 10;
		})

		local Class = setmetatable({
			GUI = ScrollFrame;
			ScrollIndex = 0;
			VisibleSpace = 0;
			TotalSpace = 0;
			PageIncrement = 1;
		},mt)

		local UpdateScrollThumb
		if horizontal then
			function UpdateScrollThumb()
				ScrollThumbFrame.Size = UDim2.new(Class.VisibleSpace/Class.TotalSpace,0,0,ScrollBarWidth)
				if ScrollThumbFrame.AbsoluteSize.x < ScrollBarWidth then
					ScrollThumbFrame.Size = UDim2.new(0,ScrollBarWidth,0,ScrollBarWidth)
				end
				local barSize = ScrollBarFrame.AbsoluteSize.x
				ScrollThumbFrame.Position = UDim2.new(Class:GetScrollPercent()*(barSize - ScrollThumbFrame.AbsoluteSize.x)/barSize,0,0,0)
			end
		else
			function UpdateScrollThumb()
				ScrollThumbFrame.Size = UDim2.new(0,ScrollBarWidth,Class.VisibleSpace/Class.TotalSpace,0)
				if ScrollThumbFrame.AbsoluteSize.y < ScrollBarWidth then
					ScrollThumbFrame.Size = UDim2.new(0,ScrollBarWidth,0,ScrollBarWidth)
				end
				local barSize = ScrollBarFrame.AbsoluteSize.y
				ScrollThumbFrame.Position = UDim2.new(0,0,Class:GetScrollPercent()*(barSize - ScrollThumbFrame.AbsoluteSize.y)/barSize,0)
			end
		end

		local lastDown
		local lastUp
		local scrollStyle = {BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=0}
		local scrollStyle_ds = {BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=0.7}

		local function Update()
			local t = Class.TotalSpace
			local v = Class.VisibleSpace
			local s = Class.ScrollIndex
			if v <= t then
				if s > 0 then
					if s + v > t then
						Class.ScrollIndex = t - v
					end
				else
					Class.ScrollIndex = 0
				end
			else
				Class.ScrollIndex = 0
			end

			if Class.UpdateCallback then
				if Class.UpdateCallback(Class) == false then
					return
				end
			end

			local down = Class:CanScrollDown()
			local up = Class:CanScrollUp()
			if down ~= lastDown then
				lastDown = down
				ScrollDownFrame.Active = down
				ScrollDownFrame.AutoButtonColor = down
				local children = ScrollDownGraphic:GetChildren()
				local style = down and scrollStyle or scrollStyle_ds
				for i = 1,#children do
					Create(children[i],style)
				end
			end
			if up ~= lastUp then
				lastUp = up
				ScrollUpFrame.Active = up
				ScrollUpFrame.AutoButtonColor = up
				local children = ScrollUpGraphic:GetChildren()
				local style = up and scrollStyle or scrollStyle_ds
				for i = 1,#children do
					Create(children[i],style)
				end
			end
			ScrollThumbFrame.Visible = down or up
			UpdateScrollThumb()
		end
		Class.Update = Update

		SetZIndexOnChanged(ScrollFrame)

		local scrollEventID = 0
		ScrollDownFrame.MouseButton1Down:connect(function()
			scrollEventID = tick()
			local current = scrollEventID
			local up_con
			up_con = MouseDrag.MouseButton1Up:connect(function()
				scrollEventID = tick()
				MouseDrag.Parent = nil
				ResetButtonColor(ScrollDownFrame)
				up_con:disconnect(); drag = nil
			end)
			MouseDrag.Parent = GetScreen(ScrollFrame)
			Class:ScrollDown()
			wait(0.2) -- delay before auto scroll
			while scrollEventID == current do
				Class:ScrollDown()
				if not Class:CanScrollDown() then break end
				wait()
			end
		end)

		ScrollDownFrame.MouseButton1Up:connect(function()
			scrollEventID = tick()
		end)

		ScrollUpFrame.MouseButton1Down:connect(function()
			scrollEventID = tick()
			local current = scrollEventID
			local up_con
			up_con = MouseDrag.MouseButton1Up:connect(function()
				scrollEventID = tick()
				MouseDrag.Parent = nil
				ResetButtonColor(ScrollUpFrame)
				up_con:disconnect(); drag = nil
			end)
			MouseDrag.Parent = GetScreen(ScrollFrame)
			Class:ScrollUp()
			wait(0.2)
			while scrollEventID == current do
				Class:ScrollUp()
				if not Class:CanScrollUp() then break end
				wait()
			end
		end)

		ScrollUpFrame.MouseButton1Up:connect(function()
			scrollEventID = tick()
		end)

		if horizontal then
			ScrollBarFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local current = scrollEventID
				local up_con
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollUpFrame)
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
				if x > ScrollThumbFrame.AbsolutePosition.x then
					Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if x < ScrollThumbFrame.AbsolutePosition.x + ScrollThumbFrame.AbsoluteSize.x then break end
						Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
						wait()
					end
				else
					Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if x > ScrollThumbFrame.AbsolutePosition.x then break end
						Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
						wait()
					end
				end
			end)
		else
			ScrollBarFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local current = scrollEventID
				local up_con
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollUpFrame)
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
				if y > ScrollThumbFrame.AbsolutePosition.y then
					Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if y < ScrollThumbFrame.AbsolutePosition.y + ScrollThumbFrame.AbsoluteSize.y then break end
						Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
						wait()
					end
				else
					Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if y > ScrollThumbFrame.AbsolutePosition.y then break end
						Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
						wait()
					end
				end
			end)
		end

		if horizontal then
			ScrollThumbFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local mouse_offset = x - ScrollThumbFrame.AbsolutePosition.x
				local drag_con
				local up_con
				drag_con = MouseDrag.MouseMoved:connect(function(x,y)
					if not UserInputService:IsMouseButtonPressed'MouseButton1' then
						scrollEventID = tick()
						MouseDrag.Parent = nil
						ResetButtonColor(ScrollThumbFrame)
						drag_con:disconnect(); drag_con = nil
						up_con:disconnect(); drag = nil
					end
					local bar_abs_pos = ScrollBarFrame.AbsolutePosition.x
					local bar_drag = ScrollBarFrame.AbsoluteSize.x - ScrollThumbFrame.AbsoluteSize.x
					local bar_abs_one = bar_abs_pos + bar_drag
					x = x - mouse_offset
					x = x < bar_abs_pos and bar_abs_pos or x > bar_abs_one and bar_abs_one or x
					x = x - bar_abs_pos
					Class:SetScrollPercent(x/(bar_drag))
				end)
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollThumbFrame)
					drag_con:disconnect(); drag_con = nil
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
			end)
		else
			ScrollThumbFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local mouse_offset = y - ScrollThumbFrame.AbsolutePosition.y
				local drag_con
				local up_con
				drag_con = MouseDrag.MouseMoved:connect(function(x,y)
					if not UserInputService:IsMouseButtonPressed'MouseButton1' then
						scrollEventID = tick()
						MouseDrag.Parent = nil
						ResetButtonColor(ScrollThumbFrame)
						drag_con:disconnect(); drag_con = nil
						up_con:disconnect(); drag = nil
					end
					local bar_abs_pos = ScrollBarFrame.AbsolutePosition.y
					local bar_drag = ScrollBarFrame.AbsoluteSize.y - ScrollThumbFrame.AbsoluteSize.y
					local bar_abs_one = bar_abs_pos + bar_drag
					y = y - mouse_offset
					y = y < bar_abs_pos and bar_abs_pos or y > bar_abs_one and bar_abs_one or y
					y = y - bar_abs_pos
					Class:SetScrollPercent(y/(bar_drag))
				end)
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollThumbFrame)
					drag_con:disconnect(); drag_con = nil
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
			end)
		end

		function Class:Destroy()
			ScrollFrame:Destroy()
			MouseDrag:Destroy()
			for k in pairs(Class) do
				Class[k] = nil
			end
			setmetatable(Class,nil)
		end

		Update()

		return Class
	end
end

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(1, -1 * ScrollBarWidth, 1, 0)
MainFrame.Position = UDim2.new(0, 0, 0, 0)
MainFrame.BackgroundTransparency = 1
MainFrame.ClipsDescendants = true
MainFrame.Parent = PropertiesFrame

ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, 0, 0, 0)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

scrollBar = ScrollBar(false)
scrollBar.PageIncrement = 1
Create(scrollBar.GUI,{
	Position = UDim2.new(1,-ScrollBarWidth,0,0);
	Size = UDim2.new(0,ScrollBarWidth,1,0);
	Parent = PropertiesFrame;
})

scrollBarH = ScrollBar(true)
scrollBarH.PageIncrement = ScrollBarWidth
Create(scrollBarH.GUI,{
	Position = UDim2.new(0,0,1,-ScrollBarWidth);
	Size = UDim2.new(1,-ScrollBarWidth,0,ScrollBarWidth);
	Visible = false;
	Parent = PropertiesFrame;
})

do
	local listEntries = {}
	local nameConnLookup = {}
	
	function scrollBar.UpdateCallback(self)
		scrollBar.TotalSpace = ContentFrame.AbsoluteSize.Y
		scrollBar.VisibleSpace = MainFrame.AbsoluteSize.Y
		ContentFrame.Position = UDim2.new(ContentFrame.Position.X.Scale,ContentFrame.Position.X.Offset,0,-1*scrollBar.ScrollIndex)
	end

	function scrollBarH.UpdateCallback(self)
		
	end

	MainFrame.Changed:connect(function(p)
		if p == 'AbsoluteSize' then
			scrollBarH.VisibleSpace = math.ceil(MainFrame.AbsoluteSize.x)
			scrollBarH:Update()
			scrollBar.VisibleSpace = math.ceil(MainFrame.AbsoluteSize.y)
			scrollBar:Update()
		end
	end)

	local wheelAmount = Row.Height
	PropertiesFrame.MouseWheelForward:connect(function()
		if input ~= nil and input.down ~= nil and input.down.leftshift then
			if scrollBarH.VisibleSpace - 1 > wheelAmount then
				scrollBarH:ScrollTo(scrollBarH.ScrollIndex - wheelAmount)
			else
				scrollBarH:ScrollTo(scrollBarH.ScrollIndex - scrollBarH.VisibleSpace)
			end
		else
			if scrollBar.VisibleSpace - 1 > wheelAmount then
				scrollBar:ScrollTo(scrollBar.ScrollIndex - wheelAmount)
			else
				scrollBar:ScrollTo(scrollBar.ScrollIndex - scrollBar.VisibleSpace)
			end
		end
	end)
	PropertiesFrame.MouseWheelBackward:connect(function()
		if input ~= nil and input.down ~= nil and input.down.leftshift then
			if scrollBarH.VisibleSpace - 1 > wheelAmount then
				scrollBarH:ScrollTo(scrollBarH.ScrollIndex + wheelAmount)
			else
				scrollBarH:ScrollTo(scrollBarH.ScrollIndex + scrollBarH.VisibleSpace)
			end
		else
			if scrollBar.VisibleSpace - 1 > wheelAmount then
				scrollBar:ScrollTo(scrollBar.ScrollIndex + wheelAmount)
			else
				scrollBar:ScrollTo(scrollBar.ScrollIndex + scrollBar.VisibleSpace)
			end
		end
	end)
end

scrollBar.VisibleSpace = math.ceil(MainFrame.AbsoluteSize.y)
scrollBar:Update()

showProperties(GetSelection())

bindSelectionChanged.Event:connect(function()
	showProperties(GetSelection())
end)

bindSetAwait.Event:connect(function(obj)
	if AwaitingObjectValue then
		AwaitingObjectValue = false
		local mySel = obj
		if mySel then
			pcall(function()
				Set(AwaitingObjectObj, AwaitingObjectProp, mySel)
			end)
		end
	end
end)

propertiesSearch.Changed:connect(function(prop)
	if prop == "Text" then
		showProperties(GetSelection())
	end
end)

bindGetApi.OnInvoke = function()
	return RbxApi
end

bindGetAwait.OnInvoke = function()
	return AwaitingObjectValue
end
end)
spawn(function()

local top = D_E_X.ScriptEditor

local editorGrid = top:WaitForChild("EditorGrid")

local currentSource = ""
local currentScrName = "";

local currentEditor = {
	x = 0,
	y = 0
}

local mouse = game:GetService'Players'.LocalPlayer:GetMouse()

local topBar = top:WaitForChild("TopBar")
local scriptBar = topBar:WaitForChild("ScriptBar")
local scriptBarLeft = topBar:WaitForChild("ScriptBarLeft")
local scriptBarRight = topBar:WaitForChild("ScriptBarRight")
local clipboardButton = topBar:WaitForChild("Clipboard")
local saveScriptButton = topBar:FindFirstChild("SaveScript")

local entryTemplate = topBar:WaitForChild("Entry")

local openEvent = top:WaitForChild("OpenScript")

local closeButton = top:WaitForChild("Close")

local memoryScripts = {}

local editingIndex = 0

-- Scrollbar

local ScrollBarWidth = 16

local ScrollStyles = {
	Background      = Color3.fromRGB(233, 233, 233);
	Border          = Color3.fromRGB( 20,  20,  20);
	Selected        = Color3.fromRGB( 63, 119, 189);
	BorderSelected  = Color3.fromRGB( 55, 106, 167);
	Text            = Color3.fromRGB(  0,   0,   0);
	TextDisabled    = Color3.fromRGB(128, 128, 128);
	TextSelected    = Color3.fromRGB(255, 255, 255);
	Button          = Color3.fromRGB( 35,  35,  35);
	ButtonBorder    = Color3.fromRGB(149, 149, 149);
	ButtonSelected  = Color3.fromRGB(255,   0,   0);
	Field           = Color3.fromRGB(255, 255, 255);
	FieldBorder     = Color3.fromRGB(191, 191, 191);
	TitleBackground = Color3.fromRGB(178, 178, 178);
}
do
	local ZIndexLock = {}
	function SetZIndex(object,z)
		if not ZIndexLock[object] then
			ZIndexLock[object] = true
			if object:IsA'GuiObject' then
				object.ZIndex = z
			end
			local children = object:GetChildren()
			for i = 1,#children do
				SetZIndex(children[i],z)
			end
			ZIndexLock[object] = nil
		end
	end
end
function SetZIndexOnChanged(object)
	return object.Changed:connect(function(p)
		if p == "ZIndex" then
			SetZIndex(object,object.ZIndex)
		end
	end)
end
function Create(ty,data)
	local obj
	if type(ty) == 'string' then
		obj = Instance.new(ty)
	else
		obj = ty
	end
	for k, v in pairs(data) do
		if type(k) == 'number' then
			v.Parent = obj
		else
			obj[k] = v
		end
	end
	return obj
end
-- returns the ascendant ScreenGui of an object
function GetScreen(screen)
	if screen == nil then return nil end
	while not screen:IsA("ScreenGui") do
		screen = screen.Parent
		if screen == nil then return nil end
	end
	return screen
end
-- AutoButtonColor doesn't always reset properly
function ResetButtonColor(button)
	local active = button.Active
	button.Active = not active
	button.Active = active
end

function ArrowGraphic(size,dir,scaled,template)
	local Frame = Create('Frame',{
		Name = "Arrow Graphic";
		BorderSizePixel = 0;
		Size = UDim2.new(0,size,0,size);
		Transparency = 1;
	})
	if not template then
		template = Instance.new("Frame")
		template.BorderSizePixel = 0
	end

	template.BackgroundColor3 = Color3.new(1, 1, 1);

	local transform
	if dir == nil or dir == 'Up' then
		function transform(p,s) return p,s end
	elseif dir == 'Down' then
		function transform(p,s) return UDim2.new(0,p.X.Offset,0,size-p.Y.Offset-1),s end
	elseif dir == 'Left' then 
		function transform(p,s) return UDim2.new(0,p.Y.Offset,0,p.X.Offset),UDim2.new(0,s.Y.Offset,0,s.X.Offset) end
	elseif dir == 'Right' then
		function transform(p,s) return UDim2.new(0,size-p.Y.Offset-1,0,p.X.Offset),UDim2.new(0,s.Y.Offset,0,s.X.Offset) end
	end

	local scale
	if scaled then
		function scale(p,s) return UDim2.new(p.X.Offset/size,0,p.Y.Offset/size,0),UDim2.new(s.X.Offset/size,0,s.Y.Offset/size,0) end
	else
		function scale(p,s) return p,s end
	end

	local o = math.floor(size/4)
	if size%2 == 0 then
		local n = size/2-1
		for i = 0,n do
			local t = template:Clone()
			local p,s = scale(transform(
				UDim2.new(0,n-i,0,o+i),
				UDim2.new(0,(i+1)*2,0,1)
			))
			t.Position = p
			t.Size = s
			t.Parent = Frame
		end
	else
		local n = (size-1)/2
		for i = 0,n do
			local t = template:Clone()
			local p,s = scale(transform(
				UDim2.new(0,n-i,0,o+i),
				UDim2.new(0,i*2+1,0,1)
			))
			t.Position = p
			t.Size = s
			t.Parent = Frame
		end
	end
	if size%4 > 1 then
		local t = template:Clone()
		local p,s = scale(transform(
			UDim2.new(0,0,0,size-o-1),
			UDim2.new(0,size,0,1)
		))
		t.Position = p
		t.Size = s
		t.Parent = Frame
	end

	for i,v in pairs(Frame:GetChildren()) do
		v.BackgroundColor3 = Color3.new(1, 1, 1);
	end

	return Frame
end

function GripGraphic(size,dir,spacing,scaled,template)
	local Frame = Create('Frame',{
		Name = "Grip Graphic";
		BorderSizePixel = 0;
		Size = UDim2.new(0,size.x,0,size.y);
		Transparency = 1;
	})
	if not template then
		template = Instance.new("Frame")
		template.BorderSizePixel = 0
	end

	spacing = spacing or 2

	local scale
	if scaled then
		function scale(p) return UDim2.new(p.X.Offset/size.x,0,p.Y.Offset/size.y,0) end
	else
		function scale(p) return p end
	end

	if dir == 'Vertical' then
		for i=0,size.x-1,spacing do
			local t = template:Clone()
			t.Size = scale(UDim2.new(0,1,0,size.y))
			t.Position = scale(UDim2.new(0,i,0,0))
			t.Parent = Frame
		end
	elseif dir == nil or dir == 'Horizontal' then
		for i=0,size.y-1,spacing do
			local t = template:Clone()
			t.Size = scale(UDim2.new(0,size.x,0,1))
			t.Position = scale(UDim2.new(0,0,0,i))
			t.Parent = Frame
		end
	end

	return Frame
end

do
	local mt = {
		__index = {
			GetScrollPercent = function(self)
				return self.ScrollIndex/(self.TotalSpace-self.VisibleSpace)
			end;
			CanScrollDown = function(self)
				return self.ScrollIndex + self.VisibleSpace < self.TotalSpace
			end;
			CanScrollUp = function(self)
				return self.ScrollIndex > 0
			end;
			ScrollDown = function(self)
				self.ScrollIndex = self.ScrollIndex + self.PageIncrement
				self:Update()
			end;
			ScrollUp = function(self)
				self.ScrollIndex = self.ScrollIndex - self.PageIncrement
				self:Update()
			end;
			ScrollTo = function(self,index)
				self.ScrollIndex = index
				self:Update()
			end;
			SetScrollPercent = function(self,percent)
				self.ScrollIndex = math.floor((self.TotalSpace - self.VisibleSpace)*percent + 0.5)
				self:Update()
			end;
		};
	}
	mt.__index.CanScrollRight = mt.__index.CanScrollDown
	mt.__index.CanScrollLeft = mt.__index.CanScrollUp
	mt.__index.ScrollLeft = mt.__index.ScrollUp
	mt.__index.ScrollRight = mt.__index.ScrollDown

	function ScrollBar(horizontal)
		-- create row scroll bar
		local ScrollFrame = Create('Frame',{
			Name = "ScrollFrame";
			Position = horizontal and UDim2.new(0,0,1,-ScrollBarWidth) or UDim2.new(1,-ScrollBarWidth,0,0);
			Size = horizontal and UDim2.new(1,0,0,ScrollBarWidth) or UDim2.new(0,ScrollBarWidth,1,0);
			BackgroundTransparency = 1;
			Create('ImageButton',{
				Name = "ScrollDown";
				Position = horizontal and UDim2.new(1,-ScrollBarWidth,0,0) or UDim2.new(0,0,1,-ScrollBarWidth);
				Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
				BackgroundColor3 = ScrollStyles.Button;
				BorderColor3 = ScrollStyles.Border;
				BorderSizePixel = 0;
			});
			Create('ImageButton',{
				Name = "ScrollUp";
				Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
				BackgroundColor3 = ScrollStyles.Button;
				BorderColor3 = ScrollStyles.Border;
				BorderSizePixel = 0;
			});
			Create('ImageButton',{
				Name = "ScrollBar";
				Size = horizontal and UDim2.new(1,-ScrollBarWidth*2,1,0) or UDim2.new(1,0,1,-ScrollBarWidth*2);
				Position = horizontal and UDim2.new(0,ScrollBarWidth,0,0) or UDim2.new(0,0,0,ScrollBarWidth);
				AutoButtonColor = false;
				BackgroundColor3 = Color3.fromRGB(20, 20, 20);
				BorderColor3 = ScrollStyles.Border;
				BorderSizePixel = 0;
				Create('ImageButton',{
					Name = "ScrollThumb";
					AutoButtonColor = false;
					Size = UDim2.new(0, ScrollBarWidth, 0, ScrollBarWidth);
					BackgroundColor3 = ScrollStyles.Button;
					BorderColor3 = ScrollStyles.Border;
					BorderSizePixel = 0;
				});
			});
		})

		local graphicTemplate = Create('Frame',{
			Name="Graphic";
			BorderSizePixel = 0;
			BackgroundColor3 = Color3.new(1, 1, 1);
		})
		local graphicSize = ScrollBarWidth/2

		local ScrollDownFrame = ScrollFrame.ScrollDown
			local ScrollDownGraphic = ArrowGraphic(graphicSize,horizontal and 'Right' or 'Down',true,graphicTemplate)
			ScrollDownGraphic.Position = UDim2.new(0.5,-graphicSize/2,0.5,-graphicSize/2)
			ScrollDownGraphic.Parent = ScrollDownFrame
		local ScrollUpFrame = ScrollFrame.ScrollUp
			local ScrollUpGraphic = ArrowGraphic(graphicSize,horizontal and 'Left' or 'Up',true,graphicTemplate)
			ScrollUpGraphic.Position = UDim2.new(0.5,-graphicSize/2,0.5,-graphicSize/2)
			ScrollUpGraphic.Parent = ScrollUpFrame
		local ScrollBarFrame = ScrollFrame.ScrollBar
		local ScrollThumbFrame = ScrollBarFrame.ScrollThumb
		do
			local size = ScrollBarWidth*3/8
			local Decal = GripGraphic(Vector2.new(size,size),horizontal and 'Vertical' or 'Horizontal',2,graphicTemplate)
			Decal.Position = UDim2.new(0.5,-size/2,0.5,-size/2)
			Decal.Parent = ScrollThumbFrame
		end

		local MouseDrag = Create('ImageButton',{
			Name = "MouseDrag";
			Position = UDim2.new(-0.25,0,-0.25,0);
			Size = UDim2.new(1.5,0,1.5,0);
			Transparency = 1;
			AutoButtonColor = false;
			Active = true;
			ZIndex = 10;
		})

		local Class = setmetatable({
			GUI = ScrollFrame;
			ScrollIndex = 0;
			VisibleSpace = 0;
			TotalSpace = 0;
			PageIncrement = 1;
		},mt)

		local UpdateScrollThumb
		if horizontal then
			function UpdateScrollThumb()
				ScrollThumbFrame.Size = UDim2.new(Class.VisibleSpace/Class.TotalSpace,0,0,ScrollBarWidth)
				if ScrollThumbFrame.AbsoluteSize.x < ScrollBarWidth then
					ScrollThumbFrame.Size = UDim2.new(0,ScrollBarWidth,0,ScrollBarWidth)
				end
				local barSize = ScrollBarFrame.AbsoluteSize.x
				ScrollThumbFrame.Position = UDim2.new(Class:GetScrollPercent()*(barSize - ScrollThumbFrame.AbsoluteSize.x)/barSize,0,0,0)
			end
		else
			function UpdateScrollThumb()
				ScrollThumbFrame.Size = UDim2.new(0,ScrollBarWidth,Class.VisibleSpace/Class.TotalSpace,0)
				if ScrollThumbFrame.AbsoluteSize.y < ScrollBarWidth then
					ScrollThumbFrame.Size = UDim2.new(0,ScrollBarWidth,0,ScrollBarWidth)
				end
				local barSize = ScrollBarFrame.AbsoluteSize.y
				ScrollThumbFrame.Position = UDim2.new(0,0,Class:GetScrollPercent()*(barSize - ScrollThumbFrame.AbsoluteSize.y)/barSize,0)
			end
		end

		local lastDown
		local lastUp
		local scrollStyle = {BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=0}
		local scrollStyle_ds = {BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=0.7}

		local function Update()
			local t = Class.TotalSpace
			local v = Class.VisibleSpace
			local s = Class.ScrollIndex
			if v <= t then
				if s > 0 then
					if s + v > t then
						Class.ScrollIndex = t - v
					end
				else
					Class.ScrollIndex = 0
				end
			else
				Class.ScrollIndex = 0
			end

			if Class.UpdateCallback then
				if Class.UpdateCallback(Class) == false then
					return
				end
			end

			local down = Class:CanScrollDown()
			local up = Class:CanScrollUp()
			if down ~= lastDown then
				lastDown = down
				ScrollDownFrame.Active = down
				ScrollDownFrame.AutoButtonColor = down
				local children = ScrollDownGraphic:GetChildren()
				local style = down and scrollStyle or scrollStyle_ds
				for i = 1,#children do
					Create(children[i],style)
				end
			end
			if up ~= lastUp then
				lastUp = up
				ScrollUpFrame.Active = up
				ScrollUpFrame.AutoButtonColor = up
				local children = ScrollUpGraphic:GetChildren()
				local style = up and scrollStyle or scrollStyle_ds
				for i = 1,#children do
					Create(children[i],style)
				end
			end
			ScrollThumbFrame.Visible = down or up
			UpdateScrollThumb()
		end
		Class.Update = Update

		SetZIndexOnChanged(ScrollFrame)

		local scrollEventID = 0
		ScrollDownFrame.MouseButton1Down:connect(function()
			scrollEventID = tick()
			local current = scrollEventID
			local up_con
			up_con = MouseDrag.MouseButton1Up:connect(function()
				scrollEventID = tick()
				MouseDrag.Parent = nil
				ResetButtonColor(ScrollDownFrame)
				up_con:disconnect(); drag = nil
			end)
			MouseDrag.Parent = GetScreen(ScrollFrame)
			Class:ScrollDown()
			wait(0.2) -- delay before auto scroll
			while scrollEventID == current do
				Class:ScrollDown()
				if not Class:CanScrollDown() then break end
				wait()
			end
		end)

		ScrollDownFrame.MouseButton1Up:connect(function()
			scrollEventID = tick()
		end)

		ScrollUpFrame.MouseButton1Down:connect(function()
			scrollEventID = tick()
			local current = scrollEventID
			local up_con
			up_con = MouseDrag.MouseButton1Up:connect(function()
				scrollEventID = tick()
				MouseDrag.Parent = nil
				ResetButtonColor(ScrollUpFrame)
				up_con:disconnect(); drag = nil
			end)
			MouseDrag.Parent = GetScreen(ScrollFrame)
			Class:ScrollUp()
			wait(0.2)
			while scrollEventID == current do
				Class:ScrollUp()
				if not Class:CanScrollUp() then break end
				wait()
			end
		end)

		ScrollUpFrame.MouseButton1Up:connect(function()
			scrollEventID = tick()
		end)

		if horizontal then
			ScrollBarFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local current = scrollEventID
				local up_con
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollUpFrame)
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
				if x > ScrollThumbFrame.AbsolutePosition.x then
					Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if x < ScrollThumbFrame.AbsolutePosition.x + ScrollThumbFrame.AbsoluteSize.x then break end
						Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
						wait()
					end
				else
					Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if x > ScrollThumbFrame.AbsolutePosition.x then break end
						Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
						wait()
					end
				end
			end)
		else
			ScrollBarFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local current = scrollEventID
				local up_con
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollUpFrame)
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
				if y > ScrollThumbFrame.AbsolutePosition.y then
					Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if y < ScrollThumbFrame.AbsolutePosition.y + ScrollThumbFrame.AbsoluteSize.y then break end
						Class:ScrollTo(Class.ScrollIndex + Class.VisibleSpace)
						wait()
					end
				else
					Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
					wait(0.2)
					while scrollEventID == current do
						if y > ScrollThumbFrame.AbsolutePosition.y then break end
						Class:ScrollTo(Class.ScrollIndex - Class.VisibleSpace)
						wait()
					end
				end
			end)
		end

		if horizontal then
			ScrollThumbFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local mouse_offset = x - ScrollThumbFrame.AbsolutePosition.x
				local drag_con
				local up_con
				drag_con = MouseDrag.MouseMoved:connect(function(x,y)
					if not UserInputService:IsMouseButtonPressed'MouseButton1' then
						scrollEventID = tick()
						MouseDrag.Parent = nil
						ResetButtonColor(ScrollThumbFrame)
						drag_con:disconnect(); drag_con = nil
						up_con:disconnect(); drag = nil
					end
					local bar_abs_pos = ScrollBarFrame.AbsolutePosition.x
					local bar_drag = ScrollBarFrame.AbsoluteSize.x - ScrollThumbFrame.AbsoluteSize.x
					local bar_abs_one = bar_abs_pos + bar_drag
					x = x - mouse_offset
					x = x < bar_abs_pos and bar_abs_pos or x > bar_abs_one and bar_abs_one or x
					x = x - bar_abs_pos
					Class:SetScrollPercent(x/(bar_drag))
				end)
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollThumbFrame)
					drag_con:disconnect(); drag_con = nil
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
			end)
		else
			ScrollThumbFrame.MouseButton1Down:connect(function(x,y)
				scrollEventID = tick()
				local mouse_offset = y - ScrollThumbFrame.AbsolutePosition.y
				local drag_con
				local up_con
				drag_con = MouseDrag.MouseMoved:connect(function(x,y)
					if not UserInputService:IsMouseButtonPressed'MouseButton1' then
						scrollEventID = tick()
						MouseDrag.Parent = nil
						ResetButtonColor(ScrollThumbFrame)
						drag_con:disconnect(); drag_con = nil
						up_con:disconnect(); drag = nil
					end
					local bar_abs_pos = ScrollBarFrame.AbsolutePosition.y
					local bar_drag = ScrollBarFrame.AbsoluteSize.y - ScrollThumbFrame.AbsoluteSize.y
					local bar_abs_one = bar_abs_pos + bar_drag
					y = y - mouse_offset
					y = y < bar_abs_pos and bar_abs_pos or y > bar_abs_one and bar_abs_one or y
					y = y - bar_abs_pos
					Class:SetScrollPercent(y/(bar_drag))
				end)
				up_con = MouseDrag.MouseButton1Up:connect(function()
					scrollEventID = tick()
					MouseDrag.Parent = nil
					ResetButtonColor(ScrollThumbFrame)
					drag_con:disconnect(); drag_con = nil
					up_con:disconnect(); drag = nil
				end)
				MouseDrag.Parent = GetScreen(ScrollFrame)
			end)
		end

		function Class:Destroy()
			ScrollFrame:Destroy()
			MouseDrag:Destroy()
			for k in pairs(Class) do
				Class[k] = nil
			end
			setmetatable(Class,nil)
		end

		Update()

		return Class
	end
end


-- End Scrollbar

local scrollBar = ScrollBar(false)
scrollBar.PageIncrement = 16
Create(scrollBar.GUI,{
	Position = UDim2.new(1,0,0,0);
	Size = UDim2.new(0,ScrollBarWidth,1,0);
	Parent = editorGrid;
})

local scrollBarH = ScrollBar(true)
scrollBarH.PageIncrement = 8
Create(scrollBarH.GUI,{
	Position = UDim2.new(0,0,1,0);
	Size = UDim2.new(1,0,0,ScrollBarWidth);
	Parent = editorGrid;
})

local wheelAmount = 24;

editorGrid.MouseWheelForward:connect(function()
	if input ~= nil and input.down ~= nil and input.down.leftshift then
		if scrollBarH.VisibleSpace - 1 > wheelAmount then
			scrollBarH:ScrollTo(scrollBarH.ScrollIndex - wheelAmount)
		else
			scrollBarH:ScrollTo(scrollBarH.ScrollIndex - scrollBarH.VisibleSpace)
		end
	else
		if scrollBar.VisibleSpace - 1 > wheelAmount then
			scrollBar:ScrollTo(scrollBar.ScrollIndex - wheelAmount)
		else
			scrollBar:ScrollTo(scrollBar.ScrollIndex - scrollBar.VisibleSpace)
		end
	end
end)
editorGrid.MouseWheelBackward:connect(function()
	if input ~= nil and input.down ~= nil and input.down.leftshift then
		if scrollBarH.VisibleSpace - 1 > wheelAmount then
			scrollBarH:ScrollTo(scrollBarH.ScrollIndex + wheelAmount)
		else
			scrollBarH:ScrollTo(scrollBarH.ScrollIndex + scrollBarH.VisibleSpace)
		end
	else
		if scrollBar.VisibleSpace - 1 > wheelAmount then
			scrollBar:ScrollTo(scrollBar.ScrollIndex + wheelAmount)
		else
			scrollBar:ScrollTo(scrollBar.ScrollIndex + scrollBar.VisibleSpace)
		end
	end
end)

local entries = {}

local grid = {}

local count = 1
local xCount = 1

local lineSpan = 0

for i = 0,editorGrid.AbsoluteSize.X - 20,8 do
	local newRow = {}
	for j = 0,390,16 do
		local cellText = Instance.new("TextLabel",editorGrid)
		cellText.Name = string.format('grid(%s,%s)', i, j);
		cellText.BackgroundTransparency = 1
		cellText.BorderSizePixel = 0
		cellText.Text = ""
		cellText.Position = UDim2.new(0,i,0,j)
		cellText.Size = UDim2.new(0,8,0,16)
		cellText.Font = Enum.Font.SourceSans
		cellText.FontSize = Enum.FontSize.Size18
		table.insert(newRow,cellText)
		xCount = xCount + 1
	end
	table.insert(grid,newRow)
	count = count + 1
	xCount = 1
end

local syntaxHighlightList = {
    {["Keyword"] = "for", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
    {["Keyword"] = "and", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
    {["Keyword"] = "or", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
	{["Keyword"] = "local", 		["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
	{["Keyword"] = "if", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
	{["Keyword"] = "then", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
	{["Keyword"] = "do", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
	{["Keyword"] = "while", 		["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
	{["Keyword"] = "end", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
	{["Keyword"] = "function", 		["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
	{["Keyword"] = "return", 		["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
	{["Keyword"] = "break", 		["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
	{["Keyword"] = "else", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
	{["Keyword"] = "elseif", 		["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
    {["Keyword"] = "in", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
    {["Keyword"] = "+", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
    {["Keyword"] = "-", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
    {["Keyword"] = "*", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
    {["Keyword"] = "/", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
    {["Keyword"] = "%", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
    {["Keyword"] = "^", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
    {["Keyword"] = "=", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
    {["Keyword"] = ",", 			["Color"] = Color3.fromRGB( 252, 97, 141), ["Independent"] = true};
    {["Keyword"] = "true", 			["Color"] = Color3.fromRGB(122, 114, 185), ["Independent"] = true};
    {["Keyword"] = "false", 		["Color"] = Color3.fromRGB(122, 114, 185), ["Independent"] = true};
    {["Keyword"] = "nil", 			["Color"] = Color3.fromRGB(122, 114, 185), ["Independent"] = true};
}

for i,v in pairs(getrenv()) do
    if type(v)=='function' and type(i)=='string' then
        table.insert(syntaxHighlightList, {['Keyword']=i, ["Color"] = Color3.fromRGB(123, 216, 143), ["Independent"] = true})
    end
end


function checkMouseInGui(gui)
	if gui == nil then return false end
	local plrMouse = game:GetService'Players'.LocalPlayer:GetMouse()
	local guiPosition = gui.AbsolutePosition
	local guiSize = gui.AbsoluteSize	
	
	if plrMouse.X >= guiPosition.x and plrMouse.X <= guiPosition.x + guiSize.x and plrMouse.Y >= guiPosition.y and plrMouse.Y <= guiPosition.y + guiSize.y then
		return true
	else
		return false
	end
end

function AddZeros(num,reach)
	local toConvert = tostring(num)
	while #toConvert < reach do
		toConvert = " "..toConvert
	end
	return toConvert
end

function buildScript(source,xOff,yOff,override)
	local buildingRows = true
	local buildScr = source
	
	local totalLines = 0

	if currentSource ~= source then
		currentSource = source
	end

	if override then
		currentSource = source
		entries = {}
		buildScr = tostring(buildScr);
		while buildingRows do
			local x,y = string.find(buildScr,"\n")
			if x and y then
				table.insert(entries,string.sub(buildScr,1,y))
				buildScr = string.sub(buildScr,y+1,string.len(buildScr))
			else
				buildingRows = false
				table.insert(entries,buildScr)
			end
		end
	end
	
	totalLines = #entries
	lineSpan = #tostring(totalLines)
	
	if lineSpan == 1 then lineSpan = 2 end
	
	local currentRow = 1
	local currentColumn = 2 + lineSpan
	
	local colorTime = 0
	local colorReplace = nil
	
	local inString = false
	
	local workingEntries = entries
	
	--[[
	for i,v in pairs(entries) do
		table.insert(workingEntries,v)
	end
	
	for i = 1,yOff do
		table.remove(workingEntries,1)
	end
	--]]
	
	local delayance = xOff

	for i = 1,#grid do
		for j = 1,#grid[i] do
			if i <= lineSpan then
				local newNum = AddZeros(yOff + j,lineSpan)
				local newDigit =  string.sub(newNum,i,i)
				if newDigit == " " then
					grid[i][j].Text = ""
				else
					grid[i][j].Text = newDigit
				end

				-- grid[i][j].BorderSizePixel = 1

				grid[i][j].TextColor3 = Color3.fromRGB(245, 245, 245)
				grid[i][j].BackgroundTransparency = 0
				grid[i][j].BackgroundColor3 = Color3.fromRGB(60, 60, 60)
				grid[i][j].Font = Enum.Font.SourceSans
			elseif i == lineSpan + 1 then
				-- grid[i][j].BorderSizePixel = 1

				grid[i][j].Text = ""
				grid[i][j].BackgroundTransparency = 0
				grid[i][j].BackgroundColor3 = Color3.fromRGB(55, 55, 55)
				-- grid[i][j].Font = Enum.Font.SourceSans
			else
				-- grid[i][j].BorderSizePixel = 1

				grid[i][j].Text = ""
				grid[i][j].BackgroundTransparency = 1
				--grid[i][j].Font = Enum.Font.SourceSans
			end
		end
	end
	
	while true do
		if currentRow > #workingEntries or currentRow > #grid[1] then break end
		local entry = workingEntries[currentRow+yOff]
		while entry ~= nil and typeof(entry) == 'string' and string.len(entry) > 0 do
			if string.sub(entry,1,1) == "\t" then entry = "    "..string.sub(entry,2) end
			
			if currentColumn > #grid then break end
			
			if delayance == 0 then
				grid[currentColumn][currentRow].Text = string.sub(entry,1,1)
			end
			
			-- Coloring
			
			if not inString then
				for i,v in pairs(syntaxHighlightList) do
					if string.sub(entry,1,string.len(v["Keyword"])) == v["Keyword"] then
						if v["Independent"] then
							local outCheck = string.len(v["Keyword"])+1
							local outEntry = string.sub(entry,outCheck,outCheck)
							if not string.find(outEntry,"%w") then
								colorTime = string.len(v["Keyword"])
								colorReplace = v["Color"]
							end
						else
							colorTime = string.len(v["Keyword"])
							colorReplace = v["Color"]
						end
					end
				end
			end
			
			if string.sub(entry,1,1) == "\"" and string.match(entry,"\".+\"") then
				inString = true
				colorTime = string.len(string.match(entry,"\".+\""))
				colorReplace = Color3.fromRGB(243, 221, 99);
			end

			local oldTC3 = Color3.fromRGB(244, 244, 244); --grid[currentColumn][currentRow].TextColor3
			
			if colorTime > 0 then
				colorTime = colorTime - 1
				oldTC3 = grid[currentColumn][currentRow].TextColor3
				grid[currentColumn][currentRow].TextColor3 = colorReplace
				if colorTime == 0 then inString = false end
			else
				grid[currentColumn][currentRow].TextColor3 = oldTC3 --Color3.new(0,0,0)
				inString = false
			end
			
			if delayance == 0 then
				currentColumn = currentColumn + 1
			else
				delayance = delayance - 1
			end
			entry = string.sub(entry,2,string.len(entry))
		end
		currentRow = currentRow + 1
		currentColumn = 2 + lineSpan
		colorTime = 0
		delayance = xOff
		inString = false
	end
end

function scrollBar.UpdateCallback(self)
	scrollBar.TotalSpace = #entries * 16
	scrollBar.VisibleSpace = editorGrid.AbsoluteSize.Y
	buildScript(currentSource,math.floor(scrollBarH.ScrollIndex/8),math.floor(scrollBar.ScrollIndex/16))
end

function scrollBarH.UpdateCallback(self)
	scrollBarH.TotalSpace = (getLongestEntry(entries) + 1 + lineSpan) * 8
	scrollBarH.VisibleSpace = editorGrid.AbsoluteSize.X
	buildScript(currentSource,math.floor(scrollBarH.ScrollIndex/8),math.floor(scrollBar.ScrollIndex/16))
end

function getLongestEntry(tab)
	local longest = 0
	for i,v in pairs(tab) do
		if string.len(v) > longest then
			longest = string.len(v)
		end
	end
	return longest
end

function openScript(scrObj)
	if scrObj:IsA("LocalScript") then
		scrObj.Archivable = true
		scrObj = scrObj:Clone()
		scrObj.Disabled = true
	end
	
	local scrName = scrObj.Name
	local scrSource = decompile(scrObj)
	currentScrName = scrObj.Name;
	
	table.insert(memoryScripts,{Name = scrName,Source = scrSource})
	
	local newTab = entryTemplate:Clone()
	newTab.Button.Text = scrName
	newTab.Position = UDim2.new(0,#scriptBar:GetChildren() * 100,0,0)
	newTab.BackgroundColor3 = Color3.new(33, 33, 33)
	newTab.Visible = true
	
	newTab.Button.MouseButton1Down:connect(function()
		for i,v in pairs(scriptBar:GetChildren()) do
			if v == newTab then
				editingIndex = i
				buildScript(memoryScripts[i].Source,0,0,true)
				wait(.1);
				scrollBar:ScrollTo(1)
				scrollBar:Update()
				scrollBarH:ScrollTo(1)
				scrollBarH:Update()
			end
		end
	end)
	
	newTab.Close.MouseButton1Click:connect(function()
		for i,v in pairs(scriptBar:GetChildren()) do
			if v == newTab then
				table.remove(memoryScripts,i)
				if editingIndex == i then
					editingIndex = #memoryScripts
					if editingIndex > 0 then
						buildScript(memoryScripts[#memoryScripts].Source,0,0,true)
					else
						buildScript("",0,0,true)
					end
				end
				
				scrollBar:ScrollTo(1)
				scrollBar:Update()
				scrollBarH:ScrollTo(1)
				scrollBarH:Update()
				
				for i2 = i,#scriptBar:GetChildren() do
					scriptBar:GetChildren()[i2].Position = scriptBar:GetChildren()[i2].Position + UDim2.new(0,-100,0,0)
				end
				if editingIndex > i then
					editingIndex = editingIndex - 1
				end
				newTab:Destroy()
			end
		end
	end)
	
	editingIndex = #memoryScripts
	buildScript(scrSource,0,0,true)
	
	newTab.Parent = scriptBar
end

getgenv().openScript = openScript;

function updateScriptBar()

end

function _updateScriptBar()
	local entryCount = 0
	
	scriptBarLeft.Active = false
	scriptBarLeft.AutoButtonColor = false
	for i,v in pairs(scriptBarLeft["Arrow Graphic"]:GetChildren()) do
		v.BackgroundTransparency = 0.7
	end
	scriptBarRight.Active = false
	scriptBarRight.AutoButtonColor = false
	for i,v in pairs(scriptBarRight["Arrow Graphic"]:GetChildren()) do
		v.BackgroundTransparency = 0.7
	end
	for i,v in pairs(scriptBar:GetChildren()) do
		if v.Position.X.Offset < 0 then
			scriptBarLeft.Active = true
			for i,v in pairs(scriptBarLeft["Arrow Graphic"]:GetChildren()) do
				v.BackgroundTransparency = 0
			end
		elseif v.Position.X.Offset >= 0 then
			entryCount = entryCount + 1
			if entryCount == 5 then
				scriptBarRight.Active = true
				for i,v in pairs(scriptBarRight["Arrow Graphic"]:GetChildren()) do
					v.BackgroundTransparency = 0
				end
			end
		end
	end
end

scriptBar.ChildAdded:connect(updateScriptBar)
scriptBar.ChildRemoved:connect(updateScriptBar)

scriptBarLeft.MouseButton1Click:connect(function()
	if scriptBarLeft.Active == false then return end
	for i,v in pairs(scriptBar:GetChildren()) do
		v.Position = v.Position + UDim2.new(0,100,0,0)
	end
	updateScriptBar()
end)

scriptBarRight.MouseButton1Click:connect(function()
	if scriptBarRight.Active == false then return end
	for i,v in pairs(scriptBar:GetChildren()) do
		v.Position = v.Position + UDim2.new(0,-100,0,0)
	end
	updateScriptBar()
end)

mouse.Button1Down:connect(function()
	if checkMouseInGui(editorGrid) then
	end
end)

openEvent.Event:connect(function(...)
	top.Visible = true
	local args = {...}
	if #args > 0 then
		openScript(args[1])
	end
end)

clipboardButton.MouseButton1Click:connect(function()
	if Clipboard and Clipboard.set then
		Clipboard.set(currentSource)
	elseif CopyString then
		CopyString(currentSource)
	elseif Synapse then
		Synapse:Copy(currentSource)
	elseif setclipboard then
		setclipboard(currentSource)
	end
end)

saveScriptButton.MouseButton1Click:connect(function()
	if Synapse then
		Synapse:WriteFile(game.PlaceId .. '_' .. currentScrName:gsub('%W', '') .. '_' .. math.random(100000, 999999) .. '.lua', currentSource)
	elseif writefile then
		writefile(game.PlaceId .. '_' .. currentScrName:gsub('%W', '') .. '_' .. math.random(100000, 999999) .. '.lua', currentSource);
	end
end)

closeButton.MouseButton1Click:connect(function()
	top.Visible = false
end)

--[[
local scr = script.Parent:WaitForChild("Scr")
local scr2 = script.Parent:WaitForChild("Scr2")
local scr3 = script.Parent:WaitForChild("Scr3")
local scr4 = script.Parent:WaitForChild("TOS")
local scr5 = script.Parent:WaitForChild("HW")
--]]

buildScript("",0,0,true)
--[[
openScript(scr)
openScript(scr2)
openScript(scr3)
openScript(scr4)
openScript(scr5)
--]]

scrollBar:Update()
scrollBarH:Update()
end)

function ScrambleNames(A)
	for i,v in pairs(A:GetDescendants()) do
		v.Name = RandomCharacters(math.random(16, 64));
	end
end

wait(.25)

D_E_X.Parent = coregui
