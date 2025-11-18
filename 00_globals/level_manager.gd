class_name Level extends Node

var current_level: int = 0
var got_pickup: bool = false
var playing: bool = false

@warning_ignore("unused_signal")
signal player_entering

@warning_ignore("unused_signal")
signal reset_level

func change_level() -> void:
	LightManager.player.accepting_input = false
	Ui.fade_out()
	await Ui.fade_out_complete
	
	if got_pickup:
		SaveManager.mark_collected(current_level)
	SaveManager.mark_complete(current_level)
	current_level += 1
	got_pickup = SaveManager.get_level(current_level)["pickupCollected"]
	if current_level <= SaveManager.LEVEL_COUNT:
		print("changing")
		get_tree().change_scene_to_file("res://levels/level_"+str(current_level)+".tscn")
	Ui.light_meter.value = Ui.light_meter.max_value
	Ui.fade_in()
	await Ui.fade_in_complete
	LightManager.player.accepting_input = true
	
