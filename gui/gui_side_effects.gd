extends Control
class_name GuiSideEffects

@onready var box_triggers: Control = %BoxTriggers
@onready var box_effects: Control = %BoxEffects
@export var card_scene: PackedScene


func _ready():
	Game.savedata.trigger_unlocked.connect(_on_unlock_trigger)
	Game.savedata.effect_unlocked.connect(refresh_effects)


func setup():
	for trigger in Game.savedata.unlocked_triggers:
		add_card_generic(box_triggers, trigger.title)

	for effect in Game.savedata.unlocked_effects:
		add_card_generic(box_effects, effect.title)


func _on_unlock_trigger(trigger: Trigger):
	add_card_generic(box_triggers, trigger.title)
	print('gui card unlocked %s' % trigger)


func refresh_triggers(_t):
	for child in box_triggers.get_children():
		child.queue_free()
		for trigger in Game.savedata.unlocked_triggers:
			add_card_generic(box_triggers, trigger.title)


func refresh_effects(_e):
	for child in box_effects.get_children():
		child.queue_free()
		for effect in Game.savedata.unlocked_effects:
			add_card_generic(box_effects, effect.title)


func add_card_generic(parent: Node, text: String):
	var inst := card_scene.instantiate() as CardGeneric
	parent.add_child(inst)
	inst.label.text = text