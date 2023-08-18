extends Node2D

var score = 0 setget set_score
var health = 3 setget set_health

func set_score(value):
	score = value
	get_node("/root/Hud/Display/SCORE").set_text("SCORE: "+ str(score))
	
func set_health(value):
	health = value
	get_node("/root/Hud/Display/HEALTH").set_text("HEALTH: "+ str(health))
	if health <= 0:
		get_tree().change_scene("res://scripts/menus/You Lose Menue.tscn")
