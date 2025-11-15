extends PointLight2D

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	add_to_group("lights")

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	remove_from_group("lights")
