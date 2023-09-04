extends Control

onready var options_menu = $options_menu

func _on_start_button_pressed():
	get_tree().change_scene("res://Scenes/levels/mike/Level1.tscn")


func _on_options_button_pressed():
	options_menu.visible = true


func _on_quit_button_pressed():
	get_tree().quit()


func _on_credits_button_pressed():
	get_tree().change_scene("res://Scenes/menus/credits_menu/credits.tscn")
