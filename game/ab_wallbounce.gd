extends Ability

@export var player: Player
@export var ray: RayCast3D

func _physics_process(_delta):
	var look_dir = player.global_position + Vector3(player.wish_dir.x, 0, player.wish_dir.z)
	if ray.global_position != look_dir:
		ray.look_at(look_dir)

	if not player.is_on_floor() and Input.is_action_just_pressed('act_jump') and ray.is_colliding():
		var norm = ray.get_collision_normal()
		player.velocity = norm.normalized() * 4
		player.velocity.y = 6.0
