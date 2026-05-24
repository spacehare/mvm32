extends Node3D
class_name Pickup

@export_subgroup("pickups")
@export var ability: Ability
@export var trigger: Trigger
@export var effect: Effect


@onready var label: Label3D = $Label3D
@onready var area_pickup: Area3D = $Area3D

func _ready():
	if ability:
		label.text = ability.title
	elif trigger:
		label.text = trigger.title
	elif effect:
		label.text = effect.title

	area_pickup.body_entered.connect(on_picked_up)

func on_picked_up(body: Node3D):
	if body is Player:
		visible = false
		area_pickup.body_entered.disconnect(on_picked_up)

		if ability:
			print("pickup.gd: picked up ability = %s" % ability.title)
			Game.savedata.add_ability(ability)
			body.abilities_handler.add_ability(ability)
		elif trigger:
			print("pickup.gd: picked up trigger = %s" % trigger.title)
			Game.savedata.add_trigger(trigger)
		elif effect:
			print("pickup.gd: picked up effect = %s" % effect.title)
			Game.savedata.add_effect(effect)