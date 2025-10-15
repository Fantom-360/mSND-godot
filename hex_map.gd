extends Node2D

@export var map_size: int = 2
@export var hex_size: float = 64.0
@export var hex_scene: PackedScene
var hex_width = hex_size * 3/2 
var hex_height = sqrt(3) * hex_size
var hex_offset_x = 3/4 * hex_width
var hex_offset_y = hex_height
var map_height = map_size
var map_width = map_size

func axial_to_pisel(axial_coords:Vector2):
	var x = hex_offset_x*axial_coords[0] + (hex_offset_x/3)*axial_coords[0]
	var y = hex_offset_y*axial_coords[1]
	return Vector2(x, y)


func _ready():
	if hex_scene == null:
		hex_scene = load("res://hex_tile.tscn")
		
	generate_map()

func generate_map():
	
	for r in range(map_height):
		for q in range(map_width):
			var hex_instance = hex_scene.instantiate()
			 
			hex_instance.position = Vector2(x, y)
			hex_instance.q = q
			hex_instance.r = r
			add_child(hex_instance)
			
