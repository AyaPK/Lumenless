extends Node2D

const LEVEL_BUTTON = preload("uid://cdybsq2xjtoq5")
const STAR = preload("uid://by5fvda33f248")

@onready var level_button_container: HFlowContainer = $CanvasLayer/LevelButtonContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for level in SaveManager.data:
		var level_button: LevelButtonContainer = LEVEL_BUTTON.instantiate()
		level_button_container.add_child(level_button)
		level_button.level_button.text = str(level)
		if SaveManager.get_level(level)["pickupCollected"]:
			level_button.texture_rect.texture = STAR

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
	Ui.set_up()
