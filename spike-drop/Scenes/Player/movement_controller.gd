extends Node

@onready var walk: Node = $Walk
@onready var idle: Node = $Idle

var currentState: State
var view: PlayerView

func setup(pview: PlayerView) -> void:
	view = pview
	
	walk.controller = self
	idle.controller = self
	
	walk.requestAnimation.connect(view.playAnimation)
	idle.requestAnimation.connect(view.playAnimation)
	
	currentState = idle
	currentState.enter()	

func process(context: PlayerContext, delta: float) -> void:
	if currentState != null:
		var state := currentState.process(context, delta)

		if state != currentState:
			currentState.exit()
			currentState = state
			currentState.enter()
