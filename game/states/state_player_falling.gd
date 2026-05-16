extends State
class_name StatePlayerFalling

@export var player: CharacterBody3D
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@export var once_landed: State


func _state_physics_update(delta: float):
	player.velocity.y -= gravity * delta
	
	if player.is_on_floor():
		transitioned.emit(once_landed)