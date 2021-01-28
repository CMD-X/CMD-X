var userId = $("meta[name='user-data']").data("userid")
var cursor
var friendsonline = 0
var friendsoffline = 0
var friendsobject = document.getElementsByClassName("friends-count ng-binding")

async function getNextPage() {
    var resp = await fetch(`https://friends.roblox.com/v1/users/${userId}/friends?sortOrder=Desc&limit=100&cursor=${cursor || ''}`)
    var data = await resp.json()
    cursor = data.nextPageCursor
    return data.data
}

const forLoop = async _ => {
    while (true) {
        var friends = await getNextPage()
        if (friends.length == 0) break
        for (const friend of friends) {
            if (friend.isOnline) {
                friendsonline++
            } else {
                friendsoffline++
            }
        }
        if (!cursor) break
    }
    friendsobject[0].innerHTML = "(Online: " + friendsonline.toString() + ", Offline: " + friendsoffline.toString() +")"
}
forLoop()
