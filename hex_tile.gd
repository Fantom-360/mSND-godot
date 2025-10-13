extends Node2D

@export var q: int = 0
@export var r: int = 0
@export var tile_tipe: String = "plain"

@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	print("Hex created at:", q, ",", r)
