extends Node
class_name StateMachine

@export var initial_state: State
var states: Array[State]
var current_state: State

func _ready():
	for child in get_children():
		if child is State:
			states.append(child)
			child.transitioned.connect(_on_child_transitioned.bind(child))

	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta):
	if current_state:
		current_state._state_update(delta)

func _physics_process(delta):
	if current_state:
		current_state._state_physics_update(delta)


func _on_child_transitioned(new_state: State, state: State):
	if state != current_state:
		return

	if !new_state:
		return

	if current_state:
		current_state.exit()
	
	new_state.enter()
	current_state = new_state