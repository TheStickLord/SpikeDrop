extends Node
class_name State

@export var controller: Node

# Signals PlayerView
signal requestAnimation(anim: String)

func enter() -> void:
	pass

func exit() -> void:
	pass

func process(context: PlayerContext, delta: float) -> State:
	return self
