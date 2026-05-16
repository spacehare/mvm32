extends AbilityInstance

@export var jumps: int
@export var jumps_max: int = 2
@export var jump_height := 5.0

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

signal jumped

# func _ready():
# 	player.jumped.connect(jump)


func _physics_process(delta):
	if player.is_on_floor():
		jumps = jumps_max

	# TODO jump buffer

	if Input.is_action_just_pressed('act_jump') and jumps > 0:
		jumps -= 1
		player.velocity.y = jump_height
		jumped.emit()

func jump():
	jumps -= 1
	player.velocity.y = jump_height
	jumped.emit()
