extends Node2D

@export var map_size: int = 4
@export var hex_size: float = 64.0
@export var hex_scene: PackedScene
var hex_width = 3/2 * hex_size
var hex_height = sqrt(3) * hex_size
var hex_offset_x = 3/4 * hex_width
var hex_offset_y = hex_height

func _ready():
	if hex_scene == null:
		hex_scene = load("res://hex_tile.tscn")
	generate_map()
	
func axial_to_pixel(q: int, r: int) -> Vector2:
	#var x = hex_offset_x * q + (hex_offset_x/3) * q
	#var y = hex_offset_y * r
	var x = hex_width * (q + 0.5 * (r % 2))   # stagger odd rows
	var y = (3.0 / 2.0) * hex_size * r
	return Vector2(x, y)

func generate_map():
	for q in range(map_size):
		for r in range(map_size):
			var hex_instance = hex_scene.instantiate()
			hex_instance.position = axial_to_pixel(q, r)
			add_child(hex_instance)
