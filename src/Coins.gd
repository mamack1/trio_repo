extends "res://scripts/player/HUD.gd"

func _on_Coins_body_entered(body):
	if body.name == "KinematicBody2D":
		get_node("/root/Hud").score += 1
		$collect_sound.play()
		$AnimationPlayer.play("bounce")
		#yield(get_tree().create_timer(0.2), "timeout")

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
