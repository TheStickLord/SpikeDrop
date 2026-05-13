extends State

@onready var idle: Node = $"../Idle"

func process(context: PlayerContext, delta: float) -> State:
	print("walk")
	
	var model = context.model
	var body = context.body
	
	var direction := Input.get_axis("Left", "Right")
	
	if direction == 0:
		return idle
	
	body.velocity.x = direction * model.speed
	
	return self
