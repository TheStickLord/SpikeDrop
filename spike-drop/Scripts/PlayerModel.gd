extends Node
class_name PlayerModel

@export var frozen: bool = false
@export var speed: float = 6.0 
@export var weapon:= Weapon.new() #Skeleton code
@export var health: int = 100
@export var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
