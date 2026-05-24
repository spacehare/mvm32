extends Node
class_name HandlerPlayerAbilities


var instances: Array[AbilityInstance] = []


func add_ability(ability: Ability):
	var inst: AbilityInstance = ability.get_scene().instantiate()
	inst.player = get_parent()
	instances.append(inst)
	add_child(inst)
