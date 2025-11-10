extends Node2D

@export var r: int = 0
@export var tile_type: String = "plain"

@export var hex_size: float = 64.0
@export var border_color: Color = Color.BLACK
@export var border_thickness: float = 2.0
@export var inset: float = 2.0  # how much to pull the border inward

func _ready():
	queue_redraw()  # triggers the _draw() function

func _draw():
	var radius = hex_size - inset
	var points = []
	for i in range(6):
		var angle = deg_to_rad(60 * i)  # flat-topped hex
		points.append(Vector2(radius * cos(angle), radius * sin(angle)))

	for i in range(6):
		var p1 = points[i]
		var p2 = points[(i + 1) % 6]
		draw_line(p1, p2, border_color, border_thickness)
