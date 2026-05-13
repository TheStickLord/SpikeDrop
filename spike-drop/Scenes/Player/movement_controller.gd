extends Node

@onready var walk: Node = $Walk
@onready var idle: Node = $Idle

var currentState: State

func _ready() -> void:
	walk.controller = self
	idle.controller = self
	currentState = idle
	currentState.enter()

func process(context: PlayerContext, delta: float) -> void:
	var state := currentState.process(context, delta)

	if state != currentState:
		currentState.exit()
		currentState = state
		currentState.enter()
