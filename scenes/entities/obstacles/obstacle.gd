extends Sprite2D

@export var grid: Resource = preload("res://resources/square_grid.tres")
@export var skin: Texture :
	set(value):
		skin = value
		texture = value
	get:
		return texture

var character_name = "obstacle"

var cell := Vector2.ZERO :
	set(value):
		cell = grid.gridclamp(value)
	get:
		return cell

func _ready() -> void:
	position = grid.calculate_map_position(cell)
	
func take_damage(damage : int) -> void:
	queue_free()
	
func set_skin_frame(h, v, fr):
	hframes = h
	vframes = v
	frame = fr
