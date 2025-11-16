class_name Level extends Node2D

const PLAYER = preload("uid://gcebunfbf7wo")
@onready var player_spawn: Marker2D = $PlayerSpawn
@export var level_number: int
@export var light_intensity: int = 1

func _ready() -> void:
	var player: Player = PLAYER.instantiate()
	player.global_position = player_spawn.global_position
	LightManager.light_intensity = light_intensity
	add_child(player)

func _process(_delta: float) -> void:
	#$DirectionalLight2D.rotation += 0.001
	pass
