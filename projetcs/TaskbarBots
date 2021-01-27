wait(60)
local paste = "https://raw.githubusercontent.com/CMD-X/CMD-X/master/projetcs/InGameFlingForTB"
function newServer()
    syn.queue_on_teleport('loadstring(game:HttpGet("'..paste..'"))()')
    for i = 1,100 do
        local GUIDs = {}
        local Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="))
        for i = 1,100 do
        	for i,v in pairs(Http.data) do
        		if v.playing ~= v.maxPlayers then
        			table.insert(GUIDs, {id = v.id, users = v.playing})
        		end
        	end
        	if Http.nextPageCursor ~= null then Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..Http.nextPageCursor)) else break end
        end
        pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[math.random(1,#GUIDs)].id, game:GetService("Players").LocalPlayer)end)
        wait(3)
    end
end

newServer()
