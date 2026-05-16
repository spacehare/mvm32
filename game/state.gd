extends Node
class_name State

signal transitioned(to: State)

func enter():
	pass

func exit():
	pass

func _state_update(_delta: float):
	pass

func _state_physics_update(_delta: float):
	pass