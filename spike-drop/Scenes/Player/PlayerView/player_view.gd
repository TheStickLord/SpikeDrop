extends PlayerView

@onready var camera: Camera3D = $Camera3D
var fov: int = 90

func playAnimation(name: String):
	print(name)
	
	if (name == "run"):
		camera.lerpCameraFov(fov + 2)
	else:
		camera.lerpCameraFov(fov)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
