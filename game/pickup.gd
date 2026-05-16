extends Node3D
class_name Pickup

@export var ability: Ability
@onready var label: Label3D = $Label3D
@onready var area_pickup: Area3D = $Area3D

func _ready():
	label.text = ability.title
	area_pickup.body_entered.connect(on_picked_up)

func on_picked_up(body: Node3D):
	if body is Player:
		visible = false
		area_pickup.body_entered.disconnect(on_picked_up)
		print("pickup.gd: picked up %s" % ability.title)
		body.add_ability(ability)