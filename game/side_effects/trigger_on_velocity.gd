extends TriggerInstance
class_name TriggerOnVelocity

@export var velocity := 50.0
@export var player: Player

# func _ready():
# 	if jump:
# 		jump.jumped.connect(go)

func _phs():
	triggered.emit()