extends State

@onready var walk: Node = $"../Walk"

func enter() -> void:
	requestAnimation.emit("idle")

func process(context: PlayerContext, delta: float) -> State:

	var direction := Input.get_axis("Left", "Right")

	if direction != 0:
		return walk

	context.body.velocity.x = 0
	return self
