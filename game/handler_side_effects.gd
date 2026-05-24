extends Node
class_name HandlerSideEffects

var pairs: Array[SideEffectsPairInstance] = []


func _ready():
	setup()


func setup():
	for pair in pairs:
		pair.trigger.triggered.connect(pair.effect.do)


func teardown():
	for pair in pairs:
		pair.trigger.triggered.disconnect(pair.effect.do)