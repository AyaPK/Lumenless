extends Node2D

const LEVEL_BUTTON = preload("uid://cdybsq2xjtoq5")
const STAR = preload("uid://by5fvda33f248")

@onready var level_button_container: HFlowContainer = $CanvasLayer/LevelButtonContainer
@onready var sfx_check: CheckBox = $CanvasLayer/SettingsContainer/HBoxContainer2/SfxCheck
@onready var music_check: CheckBox = $CanvasLayer/SettingsContainer/HBoxContainer/MusicCheck

func _ready() -> void:
	$"CanvasLayer/Main Buttons".show()
	$CanvasLayer/LevelButtonContainer.hide()
	$CanvasLayer/LevelSelectBackButton.hide()
	$CanvasLayer/AudioBG.hide()
	$CanvasLayer/SettingsContainer.hide()
	$CanvasLayer/StartButton.show()
	$MainLogo.show()
	$CanvasLayer/StartButton.grab_focus()
	$CanvasLayer/CreditsArea.hide()
	set_up_level_select()
	Ui.play_hello_world()

func set_up_level_select():
	for _c in level_button_container.get_children():
		_c.queue_free()
		await _c.tree_exited
	for level in SaveManager.data:
		var level_button: LevelButtonContainer = LEVEL_BUTTON.instantiate()
		level_button_container.add_child(level_button)
		level_button.level_button.text = str(level)
		if SaveManager.get_level(level)["pickupCollected"]:
			level_button.texture_rect.texture = STAR
		if SaveManager.get_level(level)["complete"]:
			level_button.level_button.modulate = Color(0.565, 0.894, 0.518, 0.722)
		else:
			level_button.level_button.modulate = Color(0.962, 0.736, 0.681, 0.722)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
	Ui.set_up()


func _on_level_select_back_button_pressed() -> void:
	$"CanvasLayer/Main Buttons".show()
	$CanvasLayer/LevelSelectBackButton.hide()
	$CanvasLayer/LevelButtonContainer.hide()
	$CanvasLayer/AudioBG.hide()
	$CanvasLayer/SettingsContainer.hide()
	$CanvasLayer/CreditsArea.hide()
	$CanvasLayer/StartButton.show()
	$MainLogo.show()

func _on_level_select_button_pressed() -> void:
	$"CanvasLayer/Main Buttons".hide()
	$CanvasLayer/LevelSelectBackButton.show()
	$CanvasLayer/LevelButtonContainer.show()
	$CanvasLayer/StartButton.hide()
	$MainLogo.hide()

func _on_settings_button_pressed() -> void:
	$"CanvasLayer/Main Buttons".hide()
	$CanvasLayer/LevelSelectBackButton.show()
	$CanvasLayer/AudioBG.show()
	$CanvasLayer/SettingsContainer.show()
	$CanvasLayer/StartButton.hide()
	$MainLogo.hide()

func _on_credits_button_pressed() -> void:
	$"CanvasLayer/Main Buttons".hide()
	$CanvasLayer/CreditsArea.show()
	$CanvasLayer/StartButton.hide()
	$CanvasLayer/LevelSelectBackButton.show()
	$MainLogo.hide()

func _on_sfxcheck_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(2, toggled_on)

func _on_musiccheck_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(1, toggled_on)


func _on_clear_save_button_pressed() -> void:
	SaveManager.clear_progress(true)
	set_up_level_select()
	Ui.play_star_pickup()
