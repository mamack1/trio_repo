extends Control

onready var options = get_node("res://test_options.tscn")

#settings
onready var fullscreen_val = $Options/OptionsGrid/FCButton
onready var master_val = $Options/OptionsGrid/MasterSlider
onready var sfx_val = $Options/OptionsGrid/SfxSlider
onready var music_val = $Options/OptionsGrid/MusicSlider 


#func _ready():
#	pass

func _on_back_button_pressed():
	if get_node('.').is_visible():
		get_node('.').hide()


func _on_music_slider_value_changed(value):
	GlobalSettings.update_music_vol(value)
	print('music', value)


func _on_full_button_toggled(button_pressed):
	GlobalSettings.toggle_fullscreen(button_pressed)


func _on_master_slider_value_changed(value):
	GlobalSettings.update_master_vol(value)
	print('master', value)



func _on_sfx_slider_value_changed(value):
	GlobalSettings.update_sfx_vol(value)
	print('sfx', value)
