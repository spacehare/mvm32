extends CharacterBody3D
class_name Player

# @export var stats: PlayerStats
@export_group('jump')
var jumps: int = 0
@export var jumps_max: int = 2
@export var jump_height := 5.0
@export_group('other nodes')
@export var ray_wall: RayCast3D
@export var avatar: Node3D
@export var camera_rig: CameraRig
@export_group('schmovement')
@export var h_accel := .1
@export var h_decel := .1
@export var h_speed := 6.
var wish_dir: Vector3

@onready var abilities_handler: HandlerPlayerAbilities = $PlayerAbilitiesHandler

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	pass

func _physics_process(delta):
	var look_wish = global_position + Vector3(wish_dir.x, 0, wish_dir.z)
	var look_vel = global_position + Vector3(velocity.x, 0, velocity.z)

	# MOVING
	var input_dir := Input.get_vector('act_move_left', 'act_move_right', 'act_move_forward', 'act_move_backward')
	wish_dir = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized() \
	# move appropriately regardless of camera angle
	.rotated(Vector3.UP, camera_rig.rotation.y).normalized()


	if wish_dir:
		velocity.x = move_toward(velocity.x, wish_dir.x * h_speed, h_accel)
		velocity.z = move_toward(velocity.z, wish_dir.z * h_speed, h_accel)
	else:
		velocity.x = move_toward(velocity.x, 0, h_decel * abs(velocity.x * 0.5))
		velocity.z = move_toward(velocity.z, 0, h_decel * abs(velocity.z * 0.5))

	# JUMPING
	# if is_on_floor():
	# 	jumps = jumps_max

	# TODO jump buffer

	# WALL JUMPING
	# if ray_wall.global_position != look_wish:
	# 	ray_wall.look_at(look_wish)

	# if not is_on_floor() and Input.is_action_just_pressed('act_jump') and ray_wall.is_colliding():
	# 	var norm = ray_wall.get_collision_normal()
	# 	velocity = norm.normalized() * 4
	# 	velocity.y = 6.0

	if global_position != look_vel:
		avatar.look_at(look_vel)

	move_and_slide()

# TODO refactor
func add_ability(ability: Ability):
	abilities_handler.add_ability(ability)
