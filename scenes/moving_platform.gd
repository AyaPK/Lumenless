@tool
class_name MovingPlatform extends Node2D

@export var looping: bool = true
@export var speed: int = 2

@onready var path_follow_2d: PathFollow2D = $PathFollow2D 

var is_active: bool = false

func _ready() -> void:
	if Engine.is_editor_hint():
		return
	path_follow_2d.loop = looping
	for _c in get_children():
		if _c is Path2D:
			path_follow_2d.reparent(_c)
			#sprite.reparent(path_follow_2d)
	
func _get_configuration_warnings() -> PackedStringArray:
	if !check_for_path_2d():
		return ["Requires a Path2D node"]
	else:
		return []

func check_for_path_2d() -> bool:
	var _count: int = 0
	for _c in get_children():
		if _c is Path2D:
			_count += 1
	return _count >= 1

func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		return
	if is_active:
		active(delta)
	else:
		active(2)

func active(delta: float) -> void:
	path_follow_2d.progress += speed * delta

func inactive(delta: float) -> void:
	path_follow_2d.progress -= speed * delta
