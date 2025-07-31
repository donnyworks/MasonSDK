extends Node

var username = "apples12329"
var passhash = "63929eeb7e91149ec821a2303cea3e93bd4827610169ed8291b2198ab3251d3d"
var SitePath = "http://127.0.0.1:8000"
var PreinstalledCaches = ["gdk assets.rgc","gdk demo.rgc"] # Make the Retailer API think that it already has these installed so that it doesn't error out

var successOrNot = false
func InitRetailer(game_id:int):
	var post_body = "username=" + username + "&password=" + passhash + "&gameid=" + str(game_id)
	#$request_get_user_owns.request(SitePath + "/api/GetUserGame",PackedStringArray(["Content-Type: application/x-www-form-urlencoded"]),HTTPClient.METHOD_POST,post_body)
	#await $request_get_user_owns.request_completed
	successOrNot = true
	return successOrNot
	pass

func LoadCacheFile(cache_name:String):
	var rtrt = DirAccess.open("user://")
	#if cache_name in rtrt.get_files():
	if cache_name in PreinstalledCaches:
		return true
	else:
		return false

func UserOwnageResult(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if not "not own" in body.get_string_from_utf8():
		successOrNot = true
	pass # Replace with function body.
