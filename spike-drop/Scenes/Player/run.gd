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
	
	body.velocity.x = lerp(direction * model.speed, direction * model.sprint_speed, 2.0)
	
	return self
