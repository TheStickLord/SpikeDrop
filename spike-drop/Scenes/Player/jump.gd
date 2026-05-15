extends State

@onready var idle: Node = $"../Idle"

func enter() -> void:
	requestAnimation.emit("jump")

func process(context: PlayerContext, delta: float) -> State:
	var body = context.body
	var model = context.model

	if (body.is_on_floor()):
		return idle
	
	var direction := Input.get_axis("Left", "Right")
	
	if not (abs(body.velocity.x) > model.speed) or sign(body.velocity.x) != sign(direction):
		body.velocity.x += direction * model.speed/2

	return self
