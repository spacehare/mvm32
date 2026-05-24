extends TriggerInstance
class_name TriggerOnJump

@export var player: Player
@export var abilities_handler: HandlerPlayerAbilities = player.abilities_handler
var jump: AbilityInstanceJump


func go():
	triggered.emit()


func setup():
	for inst in abilities_handler.instances:
		if inst is AbilityInstanceJump:
			jump = inst
			inst.jumped.connect(go)


func teardown():
	jump.jumped.disconnect(go)
	jump = null