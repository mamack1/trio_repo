extends Area2D

signal gem_collected

func _on_Gem2_body_entered(body):
	if body.name == "KinematicBody2D":
		#get_node("/root/Hud").score += 10
		$collect_sound.play()
		$AnimationPlayer.play("bounce")
		emit_signal("gem_collected")
		#yield(get_tree().create_timer(0.2), "timeout")

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
