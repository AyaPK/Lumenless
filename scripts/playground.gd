extends Node2D

const PLAYER = preload("uid://gcebunfbf7wo")
@onready var player_spawn: Marker2D = $PlayerSpawn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player: Player = PLAYER.instantiate()
	player.global_position = player_spawn.global_position
	add_child(player)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#$DirectionalLight2D.rotation += 0.001
	pass
