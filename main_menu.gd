extends Control

func _ready():
	$VBoxContainer/Start_button.pressed.connect(_on_start_pressed)
	$VBoxContainer/Options_button.pressed.connect(_on_options_pressed)
	$VBoxContainer/Quit_button.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	print("You have ventured into battle Commander") #later add game scene

func _on_options_pressed():
	print("adjusting battle condicions Commander")

func _on_quit_pressed():
	get_tree().quit()
