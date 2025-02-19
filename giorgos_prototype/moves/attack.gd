extends MoveClass

class_name AttackClass

@export var damage:    int
@export var range := 1

func perform_move(character, parameters):
	var distance = character.grid.calculate_distance(character.cell, parameters["target"].cell)
	if distance > range:
		print(character.character_name + " failed to attack due to distance")
	else:
		print(character.character_name + " is attacking for " + str(damage) + " damage")
		parameters["target"].take_damage(damage)
	

func get_parameters(character):
	var parameters = {}
	var cursor = cursor_scene.instantiate()
	character.add_child(cursor)
	parameters["cell"] = await cursor.accept_pressed
	parameters["target"] = character.get_parent().units[parameters["cell"]]
	cursor.queue_free()
	return parameters
