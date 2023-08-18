extends "res://scripts/player/HUD.gd"

func _on_Enemy_body_entered(body):
	if body.name == "KinematicBody2D":
		get_node("/root/Hud").health -= 1
		get_node("/root/Hud").score -= 5
		queue_free()
	pass # Replace with function body.
