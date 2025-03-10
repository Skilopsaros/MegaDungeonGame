extends ActionClass

class_name MoveClass

@export var grid: Resource = preload("res://resources/square_grid.tres")

func perform_action(character, parameters):
	character.move_to(parameters["cell"])
	
func get_parameters(character):
	print("GETTING PARAMS")
	var parameters = {}
	var cursor = cursor_scene.instantiate()
	character.add_child(cursor)
	
	var valid_selection = false
	while not valid_selection:
		parameters["cell"] = await cursor.accept_pressed
		if grid.calculate_distance(parameters["cell"], character.cell) <= character.move_range:
			valid_selection = true
		else:
			print("too far")
	print(parameters["cell"])
	cursor.queue_free()
	return parameters
