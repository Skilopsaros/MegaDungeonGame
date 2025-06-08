extends Node
class_name RoomAdjacency

@export var data: RoomAdjacencyData

@onready var target_room := data.target_room
@onready var target_cell := data.target_cell
@onready var cell := data.cell

signal switch_room

func _ready():
	var battle_scene = get_node("/root/BattleScene")
	connect("switch_room", battle_scene.go_to_room)

func export_data() -> RoomAdjacencyData:
	data.cell = cell
	data.target_cell = target_cell
	data.target_room = target_room
	return(data)
	
func on_select() -> void:
	var pcs : Array[CharacterData] = get_parent().get_pcs()
	await get_parent().remove_pcs()
	for pc in pcs:
		pc.cell = target_cell # change so that it doesn't place all pcs on top of each other
		target_room.entities.append(pc)
	emit_signal("switch_room", target_room)
