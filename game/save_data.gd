extends Resource
class_name SaveData

var abilities: Array[Ability]
var unlocked_triggers: Array[Trigger]
var triggers: Array[Trigger]
var unlocked_effects: Array[Effect]
var effects: Array[Effect]
var pairs: Array[SideEffectsPair]


signal trigger_unlocked(trigger: Trigger)
signal effect_unlocked(effect: Effect)


func add_ability(ability: Ability):
	abilities.append(ability)


func add_trigger(trigger: Trigger):
	unlocked_triggers.append(trigger)
	triggers.append(trigger)
	
	trigger_unlocked.emit(trigger)


func add_effect(effect: Effect):
	unlocked_effects.append(effect)
	effects.append(effect)

	effect_unlocked.emit(effect)