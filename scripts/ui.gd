class_name Ui extends CanvasLayer

@onready var light_meter: TextureProgressBar = $LightMeter
@onready var color_rect: ColorRect = $ColorRect
@onready var hp_anim: AnimationPlayer = $HpAnim
@onready var node_end: GPUParticles2D = $NodeEnd
@onready var node_end_2: GPUParticles2D = $NodeEnd2
@onready var node_end_3: GPUParticles2D = $NodeEnd3

func _ready() -> void:
	LightManager.ui = self
	reset_meter()
	node_end.emitting = true
	pass

func _process(_delta: float) -> void:
	node_end.global_position = Vector2(light_meter.global_position.x+(light_meter.value*1.28), light_meter.global_position.y)
	node_end_2.global_position = Vector2(light_meter.global_position.x+(light_meter.value*1.28), light_meter.global_position.y+10)
	node_end_3.global_position = Vector2(light_meter.global_position.x+(light_meter.value*1.28), light_meter.global_position.y+20)
	pass

func _physics_process(_delta: float) -> void:
	color_rect.color.a = 1 - (light_meter.value / light_meter.max_value)

func reset_meter() -> void:
	light_meter.value = 1000

func emit_particles() -> void:
	node_end.emitting = true
	node_end_2.emitting = true
	node_end_3.emitting = true

func stop_emit_particles() -> void:
	node_end.emitting = false
	node_end_2.emitting = false
	node_end_3.emitting = false
