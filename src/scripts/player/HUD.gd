extends Node2D

var score = 0 setget set_score
var health = 3 setget set_health
var max_score = 100

func _process(_delta):
	get_node("/root/Hud/Display/SCORE").hide()
	get_node("/root/Hud/Display/HEALTH").hide()
	
	if get_tree().current_scene.name == "You Lose Menue":
		get_node("/root/Hud/Display/SCORE").hide()
		get_node("/root/Hud/Display/HEALTH").hide()

	if get_tree().current_scene.name == "You Win Menu":
		get_node("/root/Hud/Display/SCORE").hide()
		get_node("/root/Hud/Display/HEALTH").hide()


	if get_tree().current_scene.name == "pause_menu":
		get_node("/root/Hud/Display/SCORE").hide()
		get_node("/root/Hud/Display/HEALTH").hide()

	if get_tree().current_scene.name == "Level1":
		get_node("/root/Hud/Display/SCORE").show()
		get_node("/root/Hud/Display/HEALTH").show()
		
	if get_tree().current_scene.name == "test_level":
		get_node("/root/Hud/Display/SCORE").show()
		get_node("/root/Hud/Display/HEALTH").show()
		
	pass

func set_score(value):
	score = value
	get_node("/root/Hud/Display/SCORE").set_text("SCORE: "+ str(score))
	if score >= max_score:
		get_tree().change_scene("res://Scenes/menus/win_menu/You Win Menu.tscn")
		
		score = 0
		health = 3
		get_node("/root/Hud/Display/SCORE").set_text("SCORE: "+ str(score))
		get_node("/root/Hud/Display/HEALTH").set_text("HEALTH: "+ str(health))
	
func set_health(value):
	health = value
	get_node("/root/Hud/Display/HEALTH").set_text("HEALTH: "+ str(health))
	if health <= 0:
		get_tree().change_scene("res://scripts/menus/You Lose Menue.tscn")
		
		score = 5
		health = 3
		get_node("/root/Hud/Display/SCORE").set_text("SCORE: "+ str(score))
		get_node("/root/Hud/Display/HEALTH").set_text("HEALTH: "+ str(health))
