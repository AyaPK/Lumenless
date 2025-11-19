class_name ButtonDoor extends ButtonTarget

@export var speed: float = 50.0

var start_y: float

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if is_active:
		if !start_y:
			start_y = global_position.y
		velocity.y = -speed
	else:
		velocity.y = speed

	if global_position.y <= start_y:
		move_and_slide()
	if global_position.y > start_y and start_y:
		global_position.y = start_y

func active() -> void:
	is_active = true

func inactive() -> void:
	is_active = false
