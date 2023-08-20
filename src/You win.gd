extends "res://scripts/player/HUD.gd"

func _on_You_win_body_entered(body):
	if body.name == "KinematicBody2D":
		get_node("/root/Hud").score += 1000	
	pass # Replace with function body.
