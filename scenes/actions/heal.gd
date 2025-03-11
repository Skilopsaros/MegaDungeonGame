extends ActionClass

class_name HealClass

@export var damage:    int

func perform_action(character: Character, parameters: Dictionary) -> void:
	await character.play_animation("attack")
	print(character.character_name + " is healing for " + str(damage))
	character.heal(damage)
