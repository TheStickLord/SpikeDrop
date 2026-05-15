extends State

@onready var idle: Node = $"../Idle"
@onready var jump: Node = $"../Jump"
@onready var walk: Node = $"../Walk"

func enter() -> void:
	requestAnimation.emit("run")

func process(context: PlayerContext, delta: float) -> State:
	
	var model = context.model
	var body = context.body
	
	var direction := Input.get_axis("Left", "Right")
	
	if Input.is_action_pressed("Space"):
		context.body.velocity.y += context.model.jump
		return jump
	
	if direction == 0:
		return idle
	
	if Input.is_action_just_released("Shift"):
		return walk
	
	if abs(body.velocity.x) < model.sprint_speed:
		body.velocity.x += direction * model.sprint_speed * 5 * (delta)
	
	return self
