local LP = game:GetService("Players").LocalPlayer
local Names = {}
local LocalName = ""

local GangPhrases3 = {"moneyman", "drip", "4k", "blackboy", "ice", "icedrippin", "reel", "ghetto", "paris", "diamond", "vv", "99k", "money", "ak", "ap"}

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    local NameFound = false
    for x,y in pairs(Names) do
        if y.Original == v.Name:lower() then
            NameFound = true
        end
    end
    if not NameFound then
        math.randomseed(v.UserId)
        local NewName = (GangPhrases3[math.random(1, #GangPhrases3)]..v.Name):lower()
        if v == LP then LocalName = NewName end
        table.insert(Names, {Original = v.Name:lower(), New = NewName})
    end
end

game:GetService("Players").PlayerAdded:Connect(function(v)
    local NameFound = false
    for x,y in pairs(Names) do
        if y.Original == v.Name:lower() then
            NameFound = true
        end
    end
    if not NameFound then
        math.randomseed(v.UserId)
        table.insert(Names, {Original = v.Name:lower(), New = (GangPhrases3[math.random(1, #GangPhrases3)]..v.Name):lower()})
    end
end)

local GangPhrases1 = {"so we got tha diamond tester", "yknow what im sayin", "blm", "it blm so we get what we want kuh", "fr", "yhu iz blacc as sh", "racist white trxvcmpie", "im reppin blood", "im reppin krip", "oh my gawd", "my name "..LocalName, "on foenem", "on my momma", "on my granny grave", "watchu talm bout", "watchu say", "oh nawww", "on yo momma", "this reel sh", "yhu wildin kuh", "yhu buggin kuh", "on 4KT", "mic up"}
local GangPhrases2 = {["ass"] = "ahh", ["crip"] = "krip", ["repping"] = "reppin, krip or blood?", ["for real"] = "on foenem", ["god"] = "gawd", ["nothing"] = "ntn", ["are"] = "iz", ["too"] = "2", ["bro"] = "jit", ["what"] = "wat", ["whats up"] = "wassup", ["what is up"] = "wazzup", ["no"] = "naw", ["discord"] = "mic up", ["sure"] = "fr", ["crazy"] = "wildin", ["mommy"] = "momma", ["mummy"] = "mumma", ["wilding"] = "wylin", ["dude"] = "kuh", ["friend"] = "kuh", ["yes"] = "yuh", ["about"] = "bout", ["hey"] = "yo", ["lol"] = "yhu funni", ["talking"] = "talm", ["you"] = "yhu", ["do"] = "dhu", ["who"] = "whu", ["blacc"] = "black", ["alright"] = "aight", ["ok"] = "ightt", ["cop"] = "opp", ["police"] = "12", ["house"] = "crib", ["gun"] = "chrome", ["shit"] = "sh", ["weird"] = "trippin", ["gay"] = "sus", ["girl"] = "shordy", ["fire"] = "fie", ["like"] = "lye", ["black"] = "blacc", ["tripping"] = "trippin", ["lying"] = "cappin", ["lie"] = "cap"}

local mt = getrawmetatable(game)
_G.hoodhook = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(event, ...)
	if not checkcaller() and event.Name == "SayMessageRequest" and getnamecallmethod() == "FireServer" then
		local args = {...}
		local message = args[1]:lower()
		for i,v in pairs(Names) do print(v.Original, v.New) message = message:gsub(v.Original, v.New) end
		for i,v in pairs(GangPhrases2) do  message = message:gsub(i, v) end
		message = (GangPhrases1[math.random(1, #GangPhrases1)].." "..message:gsub("hoodhoightt", "hoodhook")):upper().."!"
		return _G.hoodhook(event, message, args[2])
	end
	return _G.hoodhook(event, ...)
end)
setreadonly(mt, true)
