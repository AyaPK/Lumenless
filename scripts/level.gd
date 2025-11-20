extends Node2D

const PLAYER = preload("uid://gcebunfbf7wo")
@onready var player_spawn: Marker2D = $PlayerSpawn
@export var level_number: int
@export var light_intensity: float = 1
@export var star_pickup: StarPickup
@export_multiline var intro_text: String = ""

func _ready() -> void:
	var player: Player = PLAYER.instantiate()
	player.global_position = player_spawn.global_position
	LightManager.light_intensity = light_intensity
	add_child(player)
	LevelManager.current_level = level_number
	LevelManager.level_object = self
	Ui.mark_star_incomplete()
	LevelManager.got_pickup = SaveManager.get_level(level_number)["pickupCollected"]
	if LevelManager.got_pickup and star_pickup:
		star_pickup.queue_free()
		Ui.mark_star_complete()
	Ui.play_level_music()
	Ui.show_intro(intro_text, 5.0, true)

func _process(_delta: float) -> void:
	pass
