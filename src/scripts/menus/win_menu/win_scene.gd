extends Node2D


func _ready():
	pass # Replace with function body.

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/menus/main_manu/Main.tscn")
	$win_sound.play()

