extends Node3D

@export var player: Node3D
@export var spring: SpringArm3D

func _process(_delta):
	var cam_input_dir = Input.get_vector('cam_left', 'cam_right', 'cam_up', 'cam_down')
	rotation.x += cam_input_dir.y * A.settings.joy_sensitivty
	rotation.y += cam_input_dir.x * A.settings.joy_sensitivty
	rotation_degrees.x = clampf(rotation_degrees.x, -80, 80)

func _unhandled_input(event):
	if event.is_action_pressed('cam_reset'):
		rotation = player.rotation
