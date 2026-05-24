extends Node3D
class_name RestPoint

@onready var area: Area3D = $Area3D

func _unhandled_input(event):
	if event.is_action_pressed("act_use"):
		for ent in area.get_overlapping_bodies():
			if ent is Player:
				GUI.rest.show()