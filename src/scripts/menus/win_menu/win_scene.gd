extends Node2D

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/menus/main_manu/Main.tscn")
	$win_sound.play()

func _ready():
	$coin_counter.text = str(GlobalSettings.coins)
	$diamond_counter.text = str(GlobalSettings.diamonds)
	$gem_counter.text = str(GlobalSettings.gems)
