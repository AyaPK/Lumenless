extends RigidBody2D

@onready var shape_cast_2d: ShapeCast2D = $ShapeCast2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mass = 1.0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var grounded := false
	var contact_count := state.get_contact_count()
	for i in range(contact_count):
		var n := state.get_contact_local_normal(i)
		if n.y < -0.3:
			grounded = true
			break
	if not grounded and abs(state.linear_velocity.y) > 10.0:
		state.linear_velocity.x = 0.0
