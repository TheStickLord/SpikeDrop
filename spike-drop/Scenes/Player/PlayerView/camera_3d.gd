extends Camera3D

#Camera lerping values
@export var lerp_speed: float = 5.0
var target_fov: float

func _ready() -> void:
	target_fov = fov

func lerpCameraFov(new_fov: float) -> void:
	target_fov = new_fov

func _process(delta: float) -> void:
	fov = lerp(fov, target_fov, lerp_speed * delta)
