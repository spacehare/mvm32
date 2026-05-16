extends State
class_name StatePlayerDefault

@export var player: Player
@export var once_falling: State

func _state_physics_update(_delta: float):
	if not player.is_on_floor():
		transitioned.emit(once_falling)

	if Input.is_action_just_pressed('act_jump') and player.jumps > 0:
		pass
		# player.jumps -= 1
		# player.velocity.y = player.jump_height
		# player.jumped.emit()
	if Input.is_action_just_pressed('act_attack'):
		pass