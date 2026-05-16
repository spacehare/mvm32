extends Resource
class_name Ability

@export var title: String

func get_scene():
	return load(resource_path.replace(".tres", ".tscn"))