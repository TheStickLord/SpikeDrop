extends State

@onready var walk: Node = $"../Walk"

func process(context: PlayerContext, delta: float) -> State:
	print("idle")

	var direction := Input.get_axis("Left", "Right")

	if direction != 0:
		return walk

	context.body.velocity.x = 0
	return self
