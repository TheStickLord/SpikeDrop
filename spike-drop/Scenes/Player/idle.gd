extends State

@onready var walk: Node = $"../Walk"
@onready var jump: Node = $"../Jump"

func enter() -> void:
	requestAnimation.emit("idle")

func process(context: PlayerContext, delta: float) -> State:

	var direction := Input.get_axis("Left", "Right")
	
	if Input.is_action_pressed("Space"):
		context.body.velocity.y += context.model.jump
		return jump

	if direction != 0:
		return walk

	context.body.velocity.x = 0
	return self
