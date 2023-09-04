extends Node2D

func _on_Button_pressed():
	GlobalSettings.deaths = 0
	get_tree().change_scene("res://Main.tscn")
	$win_sound.play()

func _ready():
	$coin_counter.text = str(GlobalSettings.coins)
	$diamond_counter.text = str(GlobalSettings.diamonds)
	$gem_counter.text = str(GlobalSettings.gems)
	$death_counter.text = str(GlobalSettings.deaths)

func _on_timeout_timeout():
	$AnimationPlayer.play("Jump")
