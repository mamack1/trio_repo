extends Control

onready var options_menu = $options_menu

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed('pause'):
		self.is_paused = true

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_resume_button_pressed():
	self.is_paused = false


func _on_options_button_pressed():
	options_menu.show()


func _on_main_button_pressed():
	set_is_paused(false)
	get_tree().change_scene("res://Main.tscn")
	
