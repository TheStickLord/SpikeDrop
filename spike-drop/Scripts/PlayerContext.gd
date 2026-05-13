extends Node
class_name PlayerContext

@export var model: PlayerModel
@export var body: CharacterBody3D

func _init(m: PlayerModel, b: CharacterBody3D) -> void:
	self.model = m
	self.body = b
