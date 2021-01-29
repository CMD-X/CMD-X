local mt = getrawmetatable(game)
_G.hoodhook = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(event, ...)
	if not checkcaller() and event.Name == "SayMessageRequest" and getnamecallmethod() == "FireServer" then
		local args = {...}
		local message = args[1]
		local GangPhrases1 = {"on foenem", "on my momma", "on my granny grave", "watchu talm bout", "watchu say", "oh nawww", "on yo momma", "this reel sh", "yhu wildin kuh", "yhu buggin kuh", "on 4KT", "mic up"}
		local GangPhrases2 = {["are"] = "iz", ["too"] = "2", ["bro"] = "jit", ["whats up"] = "wassup", ["what is up"] = "wazzup", ["what"] = "wat", ["no"] = "naw", ["discord"] = "mic up", ["sure"] = "fr", ["crazy"] = "wildin", ["mommy"] = "momma", ["mummy"] = "mumma", ["wilding"] = "wylin", ["dude"] = "kuh", ["friend"] = "kuh", ["yes"] = "yuh", ["about"] = "bout", ["hey"] = "yo", ["lol"] = "yhu funni", ["talking"] = "talm", ["you"] = "yhu", ["do"] = "dhu", ["who"] = "whu", ["blacc"] = "black", ["alright"] = "aight", ["ok"] = "ightt", ["cop"] = "opp", ["police"] = "12", ["house"] = "crib", ["gun"] = "chrome", ["shit"] = "sh", ["weird"] = "trippin", ["sus"] = "buggin", ["girl"] = "shordy", ["fire"] = "fie", ["like"] = "lye"}
		message = GangPhrases1[math.random(1, #GangPhrases1)].." "..message
		for i,v in pairs(GangPhrases2) do
		    message = message:gsub(i,v)
		end
		message = message:split(" ")
		for i,v in pairs(message) do
		    if v:sub(#v,#v) == "g" then
		        v = v:sub(1,#v-1)
		    end
		end
		message = table.concat(message, " "):gsub("hoodhoightt", "hoodhook"):upper().."!"
		return _G.hoodhook(event, message, args[2])
	end
	return _G.hoodhook(event, ...)
end)
setreadonly(mt, true)
