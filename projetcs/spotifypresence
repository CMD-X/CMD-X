settings = {
    showbuttonsalways = true,
}

if _G.connectionsspotify then
    _G.connectionsspotify.session = false
    if _G.connectionsspotify['volumeslide'] then _G.connectionsspotify.volumeslide:Disconnect() end
    _G.connectionsspotify = nil
    game:GetService("CoreGui").RobloxGui.SpotifyPlaceholder:Destroy()
end
_G.connectionsspotify = {}

local SpotifyPlaceholder = Instance.new("ScreenGui", game:GetService("CoreGui").RobloxGui)
SpotifyPlaceholder.Name = "SpotifyPlaceholder"

local SpotifyMain = Instance.new("ImageLabel", SpotifyPlaceholder)
SpotifyMain.Name = "SpotifyMain"
SpotifyMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpotifyMain.BackgroundTransparency = 1.000
SpotifyMain.Position = UDim2.new(0, 750, 0, 850)
SpotifyMain.Size = UDim2.new(0, 500, 0, 100)
SpotifyMain.Image = "rbxassetid://3570695787"
SpotifyMain.ImageColor3 = Color3.fromRGB(17, 17, 17)
SpotifyMain.ImageTransparency = 0.100
SpotifyMain.ScaleType = Enum.ScaleType.Slice
SpotifyMain.SliceCenter = Rect.new(100, 100, 100, 100)
SpotifyMain.SliceScale = 0.120

local SongTitle = Instance.new("TextLabel", SpotifyMain)
SongTitle.Name = "SongTitle"
SongTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SongTitle.BackgroundTransparency = 1.000
SongTitle.Position = UDim2.new(0, 150, 0, -15)
SongTitle.Size = UDim2.new(0, 200, 0, 50)
SongTitle.Font = Enum.Font.GothamBold
SongTitle.Text = "(N/A)"
SongTitle.TextColor3 = Color3.fromRGB(29, 185, 84)
SongTitle.TextSize = 15.000
SongTitle.TextStrokeColor3 = Color3.fromRGB(13, 163, 13)

local DurationHolder = Instance.new("ImageButton", SpotifyMain)
DurationHolder.Name = "DurationHolder"
DurationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DurationHolder.BackgroundTransparency = 1.000
DurationHolder.Position = UDim2.new(0, 50, 0, 40)
DurationHolder.Size = UDim2.new(0, 400, 0, 3)
DurationHolder.Image = "rbxassetid://3570695787"
DurationHolder.ImageColor3 = Color3.fromRGB(255,255,255)
DurationHolder.ScaleType = Enum.ScaleType.Slice
DurationHolder.SliceCenter = Rect.new(100, 100, 100, 100)
DurationHolder.SliceScale = 0.120

local Duration = Instance.new("ImageLabel", DurationHolder)
Duration.Name = "Duration"
Duration.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Duration.BackgroundTransparency = 1.000
Duration.Size = UDim2.new(0, 0, 0, 3)
Duration.Image = "rbxassetid://3570695787"
Duration.ImageColor3 = Color3.fromRGB(29, 185, 84)
Duration.ScaleType = Enum.ScaleType.Slice
Duration.SliceCenter = Rect.new(100, 100, 100, 100)
Duration.SliceScale = 0.120

local DurationScroll = Instance.new("ImageButton", Duration)
DurationScroll.Name = "DurationScroll"
DurationScroll.AnchorPoint = Vector2.new(0.5, 0.5)
DurationScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DurationScroll.BackgroundTransparency = 1.000
DurationScroll.Position = UDim2.new(0, 0, 0, 1.5)
DurationScroll.Size = UDim2.new(0, 10, 0, 10)
DurationScroll.Image = "rbxassetid://3570695787"
DurationScroll.ImageColor3 = Color3.fromRGB(29, 185, 84)
DurationScroll.ScaleType = Enum.ScaleType.Slice
DurationScroll.SliceCenter = Rect.new(100, 100, 100, 100)
DurationScroll.SliceScale = 0.120

local VolumeHolder = Instance.new("ImageButton", SpotifyMain)
VolumeHolder.Name = "VolumeHolder"
VolumeHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VolumeHolder.BackgroundTransparency = 1
VolumeHolder.Position = UDim2.new(0, 383, 0, 69)
VolumeHolder.Size = UDim2.new(0, 100, 0, 3)
VolumeHolder.Image = "rbxassetid://3570695787"
VolumeHolder.ImageColor3 = Color3.fromRGB(255,255,255)
VolumeHolder.ScaleType = Enum.ScaleType.Slice
VolumeHolder.SliceCenter = Rect.new(100, 100, 100, 100)
VolumeHolder.SliceScale = 0.120

local Volume = Instance.new("ImageLabel", VolumeHolder)
Volume.Name = "Volume"
Volume.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Volume.BackgroundTransparency = 1.000
Volume.Size = UDim2.new(0, 100, 0, 3)
Volume.Image = "rbxassetid://3570695787"
Volume.ImageColor3 = Color3.fromRGB(29, 185, 84)
Volume.ScaleType = Enum.ScaleType.Slice
Volume.SliceCenter = Rect.new(100, 100, 100, 100)
Volume.SliceScale = 0.120

local VolumeScroll = Instance.new("ImageButton", Volume)
VolumeScroll.Name = "VolumeScroll"
VolumeScroll.AnchorPoint = Vector2.new(0.5, 0.5)
VolumeScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VolumeScroll.BackgroundTransparency = 1.000
VolumeScroll.Position = UDim2.new(0, 100, 0, 1.5)
VolumeScroll.Size = UDim2.new(0, 10, 0, 10)
VolumeScroll.Image = "rbxassetid://3570695787"
VolumeScroll.ImageColor3 = Color3.fromRGB(29, 185, 84)
VolumeScroll.ScaleType = Enum.ScaleType.Slice
VolumeScroll.SliceCenter = Rect.new(100, 100, 100, 100)
VolumeScroll.SliceScale = 0.120

local SongArtist = Instance.new("TextLabel", SpotifyMain)
SongArtist.Name = "SongArtist"
SongArtist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SongArtist.BackgroundTransparency = 1.000
SongArtist.Position = UDim2.new(0, 150, 0, 0)
SongArtist.Size = UDim2.new(0, 200, 0, 50)
SongArtist.Font = Enum.Font.Gotham
SongArtist.Text = "(N/A)"
SongArtist.TextColor3 = Color3.fromRGB(255, 255, 255)
SongArtist.TextSize = 14.000
SongArtist.TextStrokeColor3 = Color3.fromRGB(13, 163, 13)

local SongTimeEnd = Instance.new("TextLabel", SpotifyMain)
SongTimeEnd.Name = "SongTimeEnd"
SongTimeEnd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SongTimeEnd.BackgroundTransparency = 1.000
SongTimeEnd.Position = UDim2.new(0, 445, 0, 30)
SongTimeEnd.Size = UDim2.new(0, 50, 0, 22)
SongTimeEnd.Font = Enum.Font.Gotham
SongTimeEnd.Text = "(N/A)"
SongTimeEnd.TextColor3 = Color3.fromRGB(255, 255, 255)
SongTimeEnd.TextSize = 12.000
SongTimeEnd.TextStrokeColor3 = Color3.fromRGB(13, 163, 13)

local PausePlayButton = Instance.new("ImageButton", SpotifyMain)
PausePlayButton.Name = "PausePlayButton"
PausePlayButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PausePlayButton.BackgroundTransparency = 1.000
PausePlayButton.Position = UDim2.new(0, 230, 0, 50)
PausePlayButton.Size = UDim2.new(0, 40, 0, 40)
PausePlayButton.Image = "http://www.roblox.com/asset/?id=2876994160"
PausePlayButton.ImageColor3 = Color3.fromRGB(255,255,255)

local FFwdButton = Instance.new("ImageButton", SpotifyMain)
FFwdButton.Name = "FFwdButton"
FFwdButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FFwdButton.BackgroundTransparency = 1.000
FFwdButton.Position = UDim2.new(0, 270, 0, 50)
FFwdButton.Size = UDim2.new(0, 40, 0, 40)
FFwdButton.Image = "rbxassetid://4458820516"
FFwdButton.ImageColor3 = Color3.fromRGB(255,255,255)

local RRwdButton = Instance.new("ImageButton", SpotifyMain)
RRwdButton.Name = "RRwdButton"
RRwdButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RRwdButton.BackgroundTransparency = 1.000
RRwdButton.Position = UDim2.new(0, 190, 0, 50)
RRwdButton.Size = UDim2.new(0, 40, 0, 40)
RRwdButton.Image = "rbxassetid://4458820516"
RRwdButton.Rotation = 180
RRwdButton.ImageColor3 = Color3.fromRGB(255,255,255)

local RptButton = Instance.new("ImageButton", SpotifyMain)
RptButton.Name = "RptButton"
RptButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RptButton.BackgroundTransparency = 1.000
RptButton.Position = UDim2.new(0, 315, 0, 57)
RptButton.Size = UDim2.new(0, 27, 0, 27)
RptButton.Image = "rbxassetid://2866792453"
RptButton.ImageColor3 = Color3.fromRGB(255,255,255)

local SflButton = Instance.new("ImageButton", SpotifyMain)
SflButton.Name = "SflButton"
SflButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SflButton.BackgroundTransparency = 1.000
SflButton.Position = UDim2.new(0, 150, 0, 52)
SflButton.Size = UDim2.new(0, 35, 0, 37)
SflButton.Image = "rbxassetid://2866811630"
SflButton.ImageColor3 = Color3.fromRGB(255,255,255)

local VolButton = Instance.new("ImageButton", SpotifyMain)
VolButton.Name = "VolButton"
VolButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VolButton.BackgroundTransparency = 1.000
VolButton.Position = UDim2.new(0, 350, 0, 57)
VolButton.Size = UDim2.new(0, 27, 0, 27)
VolButton.Image = "rbxassetid://3242029012"
VolButton.ImageColor3 = Color3.fromRGB(255,255,255)

local SongTime = Instance.new("TextLabel", SpotifyMain)
SongTime.Name = "SongTime"
SongTime.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SongTime.BackgroundTransparency = 1.000
SongTime.Position = UDim2.new(0, 5, 0, 30)
SongTime.Size = UDim2.new(0, 50, 0, 22)
SongTime.Font = Enum.Font.Gotham
SongTime.Text = "(N/A)"
SongTime.TextColor3 = Color3.fromRGB(255, 255, 255)
SongTime.TextSize = 12.000
SongTime.TextStrokeColor3 = Color3.fromRGB(13, 163, 13)

local TokenLock = Instance.new("ImageLabel", SpotifyMain)
TokenLock.Name = "TokenLock"
TokenLock.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TokenLock.BackgroundTransparency = 1.000
TokenLock.Size = UDim2.new(0, 500, 0, 100)
TokenLock.Image = "rbxassetid://3570695787"
TokenLock.ImageColor3 = Color3.fromRGB(17, 17, 17)
TokenLock.ImageTransparency = 0.050
TokenLock.ScaleType = Enum.ScaleType.Slice
TokenLock.SliceCenter = Rect.new(100, 100, 100, 100)
TokenLock.SliceScale = 0.120

local TokenBoxRound = Instance.new("ImageLabel", TokenLock)
TokenBoxRound.Name = "TokenBoxRound"
TokenBoxRound.Active = true
TokenBoxRound.AnchorPoint = Vector2.new(0.5, 0.5)
TokenBoxRound.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TokenBoxRound.BackgroundTransparency = 1.000
TokenBoxRound.Position = UDim2.new(0.499000013, 0, 0.496551514, 0)
TokenBoxRound.Selectable = true
TokenBoxRound.Size = UDim2.new(0.493999988, 0, 0.239999995, 0)
TokenBoxRound.Image = "rbxassetid://3570695787"
TokenBoxRound.ImageColor3 = Color3.fromRGB(36, 36, 36)
TokenBoxRound.ImageTransparency = 0.300
TokenBoxRound.ScaleType = Enum.ScaleType.Slice
TokenBoxRound.SliceCenter = Rect.new(100, 100, 100, 100)
TokenBoxRound.SliceScale = 0.120

local TokenBox = Instance.new("TextBox", TokenBoxRound)
TokenBox.Name = "TokenBox"
TokenBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TokenBox.BackgroundTransparency = 1.000
TokenBox.BorderSizePixel = 0
TokenBox.Position = UDim2.new(0, 0, -0.129999802, 0)
TokenBox.Size = UDim2.new(0, 246, 0, 29)
TokenBox.Font = Enum.Font.Gotham
TokenBox.PlaceholderColor3 = Color3.fromRGB(29, 185, 84)
TokenBox.PlaceholderText = "Insert token here..."
TokenBox.Text = ""
TokenBox.TextColor3 = Color3.fromRGB(29, 185, 84)
TokenBox.TextSize = 16.000
TokenBox.TextWrapped = true

local TokenHelp = Instance.new("ImageButton", TokenLock)
TokenHelp.Name = "TokenHelp"
TokenHelp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TokenHelp.BackgroundTransparency = 1.000
TokenHelp.Position = UDim2.new(0.939999998, 0, 0.700000048, 0)
TokenHelp.Size = UDim2.new(0, 30, 0, 30)
TokenHelp.Image = "http://www.roblox.com/asset/?id=5107159153"
TokenHelp.ImageColor3 = Color3.fromRGB(29, 185, 84)

local TokenExplanation = Instance.new("TextLabel", TokenLock)
TokenExplanation.Name = "TokenExplanation"
TokenExplanation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TokenExplanation.BackgroundTransparency = 1.000
TokenExplanation.Size = UDim2.new(0, 500, 0, 100)
TokenExplanation.Font = Enum.Font.GothamBlack
TokenExplanation.Text = "\n1. Sign in to spotify on the website play a song then go to:\nhttps://developer.spotify.com/console/get-users-currently-playing-track/?market=&additional_types=\n\n2. Press GET TOKEN and select user-read-currently-playing and -user-modify-playback-state then press REQUEST TOKEN.\n\n3. Copy and paste the token into the token bar then click the spotify logo.\n"
TokenExplanation.TextColor3 = Color3.fromRGB(29, 185, 84)
TokenExplanation.TextSize = 14.000
TokenExplanation.TextTransparency = 1
TokenExplanation.TextScaled = true

local SpotifyLogo = Instance.new("ImageButton", SpotifyMain)
SpotifyLogo.Name = "SpotifyLogo"
SpotifyLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpotifyLogo.BackgroundTransparency = 1.000
SpotifyLogo.Position = UDim2.new(0, -15, 0, -15)
SpotifyLogo.Size = UDim2.new(0, 40, 0, 40)
SpotifyLogo.Image = "http://www.roblox.com/asset/?id=4526758789"
SpotifyLogo.ImageTransparency = 0.100
SpotifyLogo.ScaleType = Enum.ScaleType.Fit

TokenHelp.MouseButton1Down:Connect(function()
    if TokenExplanation.TextTransparency == 0 then
        for i = 0,10 do
            TokenExplanation.TextTransparency = TokenExplanation.TextTransparency + .1
            if i == 3 then TokenBox.Visible = true end
            wait(.1)
        end
        TokenExplanation.TextTransparency = 1
        for i = 0,7 do
            TokenBoxRound.ImageTransparency = TokenBoxRound.ImageTransparency - .1
            wait(.1)
        end
        TokenBoxRound.ImageTransparency = .3
    elseif TokenExplanation.TextTransparency == 1 then
        for i = 0,7 do
            TokenBoxRound.ImageTransparency = TokenBoxRound.ImageTransparency + .1
            wait(.1)
        end
        TokenBoxRound.ImageTransparency = 1
        for i = 0,10 do
            TokenExplanation.TextTransparency = TokenExplanation.TextTransparency - .1
            if i == 3 then TokenBox.Visible = false end
            wait(.1)
        end
        TokenExplanation.TextTransparency = 0
    end
end)

local Token = ""

function MainFrame()
    local SongArtist, SongTitle, SongTime, SongTimeEnd, SongPaused = SpotifyMain.SongArtist, SpotifyMain.SongTitle, SpotifyMain.SongTime, SpotifyMain.SongTimeEnd, true

    local API = function(URL, method)
        local success, res = pcall(syn.request, {
            Url = "https://api.spotify.com/v1/me/player/"..URL,
            Method = method,
            Headers = {
                ["Accept"] = "application/json",
                ["Authorization"] = "Bearer "..Token,
                ["Content-Type"] = "application/json"
            }
        })
        if not URL:sub(1,4) == "curr" then return end
        if success == true and type(res) == "table" and #res.Body > 0 then
            local parsed = game:GetService("HttpService"):JSONDecode(res.Body)
            if parsed.item == nil then ExpiredToken() end
            local Artists = parsed['item']['artists'][1]['name']
            for i,v in pairs(parsed['item']['artists']) do
                if i ~= 1 then
                    Artists = Artists..", "..parsed['item']['artists'][i]['name']
                end
            end
            return {
                Artist = Artists,
                Title = parsed['item']['name'],
                Time = parsed['progress_ms'],
                TimeEnd = parsed['item']['duration_ms'],
                Paused = parsed['is_playing'],
            }
        else
            return {
                Artist = "Token errors could occur if this error is appearing!",
                Title = "No song playing",
                Time = "0",
                TimeEnd = "400",
            }
        end
    end
    
    function Format(Int)
        return string.format("%02i", Int)
    end
    function convertToHMS(Seconds)
        local Minutes = (Seconds - Seconds%60)/60
        Seconds = Seconds - Minutes*60
        local Hours = (Minutes - Minutes%60)/60
        Minutes = Minutes - Hours*60
        return Format(Minutes)..":"..Format(Seconds)
    end
    
    _G.connectionsspotify.play = SpotifyMain.PausePlayButton.MouseButton1Down:Connect(function()
        if SongPaused then
            API("play", "PUT")
            SongPaused = false
            SpotifyMain.PausePlayButton.Image = "rbxassetid://4458862490"
        else
            API("pause", "PUT")
            SongPaused = true
            SpotifyMain.PausePlayButton.Image = "rbxassetid://2876994160"
        end
        PausePlayButton.ImageColor3 = Color3.fromRGB(29,185,84)
        wait(.2)
        PausePlayButton.ImageColor3 = Color3.fromRGB(255,255,255)
    end)
    
    _G.connectionsspotify.FFWD = FFwdButton.MouseButton1Down:Connect(function()
        API("next","POST")
        FFwdButton.ImageColor3 = Color3.fromRGB(29,185,84)
        wait(.2)
        FFwdButton.ImageColor3 = Color3.fromRGB(255,255,255)
    end)
    
    _G.connectionsspotify.RRWD = RRwdButton.MouseButton1Down:Connect(function()
        API("previous","POST")
        RRwdButton.ImageColor3 = Color3.fromRGB(29,185,84)
        wait(.2)
        RRwdButton.ImageColor3 = Color3.fromRGB(255,255,255)
    end)
    
    API("repeat?state=off","PUT")
    local RptStage = 1
    RptButton.MouseButton1Down:Connect(function()
        if RptStage == 1 then
            API("repeat?state=context","PUT")
            RptButton.ImageColor3 = Color3.fromRGB(29, 185, 84)
            RptStage = 2
        elseif RptStage == 2 then
            API("repeat?state=track","PUT")
            RptButton.ImageColor3 = Color3.fromRGB(0, 255, 120)
            RptStage = 3
        elseif RptStage == 3 then
            API("repeat?state=off","PUT")
            RptButton.ImageColor3 = Color3.fromRGB(255,255,255)
            RptStage = 1
        end
    end)
    
    API("shuffle?state=false","PUT")
    local SflBool = false
    SflButton.MouseButton1Down:Connect(function()
        if SflBool then
            API("shuffle?state=false","PUT")
            SflButton.ImageColor3 = Color3.fromRGB(255,255,255)
            SflBool = false
        else
            API("shuffle?state=true","PUT")
            SflButton.ImageColor3 = Color3.fromRGB(29, 185, 84)
            SflBool = true
        end
    end)
    
    API("volume?volume_percent=100", "PUT")
    _G.infvolpos = 100
    _G.infseekpos = 0
    local held = false
    local helds = false
    game:GetService("UserInputService").InputEnded:connect(function(input, processed)
    	if held and input.UserInputType == Enum.UserInputType.MouseButton1 then
    		held = false
    		API("volume?volume_percent=".._G.infvolpos, "PUT")
    	end
    end)
    
    VolumeScroll.MouseButton1Down:Connect(function()
        held = true
    end)
    
    VolumeHolder.MouseButton1Down:Connect(function()
        _G.infvolpos = game:GetService("UserInputService"):GetMouseLocation().X - VolumeHolder.AbsolutePosition.X
        Volume:TweenSize(UDim2.new(0,_G.infvolpos,0,3), 'In', 'Quint', .5)
        VolumeScroll:TweenPosition(UDim2.new(0,_G.infvolpos,0,1.5), 'In', 'Quint', .5)
        API("volume?volume_percent=".._G.infvolpos, "PUT")
    end)
    
    _G.connectionsspotify.volumeslide = game:GetService("RunService").RenderStepped:Connect(function()
        if held then
            _G.infvolpos = game:GetService("UserInputService"):GetMouseLocation().X - VolumeHolder.AbsolutePosition.X
            if _G.infvolpos > 100 then _G.infvolpos = 100 end
            if _G.infvolpos < 0 then _G.infvolpos = 0 end
            Volume:TweenSize(UDim2.new(0,_G.infvolpos,0,3), 'In', 'Quint', .1)
            VolumeScroll:TweenPosition(UDim2.new(0,_G.infvolpos,0,1.5), 'In', 'Quint', .1)
        end
    end)
    
    spawn(function()
        while _G.connectionsspotify.session do
            for i = 1,360 do
                SpotifyLogo.Rotation = SpotifyLogo.Rotation + 1
                wait(.05)
                if SongPaused then SpotifyMain.PausePlayButton.Image = "rbxassetid://2876994160"; repeat wait(.1) until SongPaused == false; SpotifyMain.PausePlayButton.Image = "rbxassetid://4458862490" end
            end
        end
    end)
    
    while _G.connectionsspotify.session do
        local Returns = API("currently-playing", "GET")
        if Returns.Paused then SongPaused = false end
        SpotifyMain.PausePlayButton.Image = "rbxassetid://4458862490"
        SongTitle.Text, SongArtist.Text, SongTime.Text, xTimeSave, SongTimeEnd.Text = Returns.Title, Returns.Artist, convertToHMS(Returns.Time/1000), Returns.Time/1000,convertToHMS(Returns.TimeEnd/1000)
        if #SongTitle.Text > 55 then SongTitle.Text = SongTitle.Text:sub(1,55).."..." end
        if #SongArtist.Text > 55 then SongArtist.Text = SongArtist.Text:sub(1,55).."..." end
        for i = 0,Returns.TimeEnd/1000 do
            wait(1)
            Returns = API("currently-playing", "GET")
            if Returns.Paused then SongPaused = false else SongPaused = true end
            SongTime.Text = convertToHMS(Returns.Time/1000)
            Duration:TweenSize(UDim2.new(0, Returns.Time/(Returns.TimeEnd/400), 0, 3), 'In', 'Quint', .5)
            DurationScroll:TweenPosition(UDim2.new(0, Returns.Time/(Returns.TimeEnd/400), 0, 1.5), 'In', 'Quint', .5)
            if SongPaused then SpotifyMain.PausePlayButton.Image = "rbxassetid://2876994160"; repeat wait(1) 
                Returns = API("currently-playing", "GET")
                if Returns.Paused then SongPaused = false end
            until SongPaused == false; SpotifyMain.PausePlayButton.Image = "rbxassetid://4458862490" end
            SongTitle.Text, SongArtist.Text, SongTime.Text, xTimeSave, SongTimeEnd.Text = Returns.Title, Returns.Artist, convertToHMS(Returns.Time/1000), Returns.Time/1000,convertToHMS(Returns.TimeEnd/1000)
            if #SongTitle.Text > 55 then SongTitle.Text = SongTitle.Text:sub(1,55).."..." end
            if #SongArtist.Text > 55 then SongArtist.Text = SongArtist.Text:sub(1,55).."..." end
        end
        wait()
    end    
end

if settings.showbuttonsalways == false then
    local Visibility = {
        VolButton,
        SflButton,
        RptButton,
        RRwdButton,
        FFwdButton,
        VolumeScroll,
        Volume,
        VolumeHolder,
    }
    
    for i,v in pairs(Visibility) do
        v.ImageTransparency = 1
    end
    SpotifyMain.MouseEnter:Connect(function()
        for i = 1,10 do
            for i,v in pairs(Visibility) do
                v.ImageTransparency = v.ImageTransparency - .1
            end
            wait(.05)
        end
    end)
    
    SpotifyMain.MouseLeave:Connect(function()
        for i = 1,10 do
            for i,v in pairs(Visibility) do
                v.ImageTransparency = v.ImageTransparency + .1
            end
            wait(.05)
        end
    end)
end

function ExpiredToken()
    _G.connectionsspotify.session = false
    _G.connectionsspotify.play:Disconnect()
    TokenLock.Visible = true
    TokenLock:TweenSize(UDim2.new(0, 500, 0, 100), 'Out', 'Quint', 2.5)
    spawn(function()
        for i = 1,360/7 do
            SpotifyLogo.Rotation = SpotifyLogo.Rotation - 7
            wait(.04)
        end
    end)
    wait(1)
    TokenBox.Text = "Token expired or experienced error!"
    wait(1.5)
end

SpotifyLogo.MouseButton1Down:Connect(function()
    if TokenLock.Visible then
        Token = TokenBox.Text
        TokenBox.Text = "Token sucessful!"
        TokenLock:TweenSize(UDim2.new(0, 0, 0, 0), 'In', 'Quint', 2.5)
        spawn(function()
            for i = 1,360/7 do
                SpotifyLogo.Rotation = SpotifyLogo.Rotation + 7
                wait(.04)
            end
        end)
        wait(1.5)
        TokenBox.Text = " "
        wait(1)
        TokenLock.Visible = false
        _G.connectionsspotify.session = true
        MainFrame()
    end
end)
