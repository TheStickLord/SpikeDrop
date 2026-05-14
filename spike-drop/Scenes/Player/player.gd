extends Node3D

#3D PhysBody/Body View
@onready var character_body_3d: CharacterBody3D = $CharacterBody3D
@onready var player_view: Node3D = $CharacterBody3D/PlayerView

# Controllers
@onready var movement_controller: Node = $MovementController
@onready var half_body_controller: Node = $HalfBodyController
@onready var full_body_action_controller: Node = $FullBodyActionController

#Model
@export var model := PlayerModel.new()

#Context
var ctx: PlayerContext

func _ready() -> void:
	ctx = PlayerContext.new(model, character_body_3d)
	
	movement_controller.setup(player_view)

func _physics_process(delta: float) -> void:
	#gravity
	if not character_body_3d.is_on_floor():
		character_body_3d.velocity.y -= model.gravity * delta
	else:
		character_body_3d.velocity.y -= model.gravity * delta
	
	movement_controller.process(ctx, delta)
	#half_body_controller.process(ctx, delta)
	#full_body_action_controller.process(ctx, delta)
	character_body_3d.move_and_slide()
