extends ActionClass

class_name MoveClass

@export var grid: Resource = preload("res://resources/square_grid.tres")
@export var move_range: int = 2

func perform_action(character: Character, parameters: Dictionary) -> void:
	character.move_to(parameters["cell"])
	
func get_parameters(character: Character) -> Dictionary:
	var parameters : Dictionary = {}
	var cursor = cursor_scene.instantiate()
	character.add_child(cursor)
	
	var valid_selection := false
	while not valid_selection:
		parameters["cell"] = await cursor.accept_pressed
		if grid.calculate_distance(parameters["cell"], character.cell) <= move_range:
			valid_selection = true
		else:
			print("too far")
	print(parameters["cell"])
	cursor.queue_free()
	return parameters
