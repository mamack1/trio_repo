extends "res://scripts/player/HUD.gd"

func _on_Key_body_entered(body):
	if body.name == "KinematicBody2D":
		queue_free()
	pass # Replace with function body.
