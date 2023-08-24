extends Area2D

signal coin_collected

func _on_Gems_body_entered(body):
	if body.name == "KinematicBody2D":
		#get_node("/root/Hud").score += 5
		$collect_sound.play()
		$AnimationPlayer.play("bounce")
		emit_signal("coin_collected")
		set_collision_mask_bit(0, false)
		set_collision_layer_bit(0, false)
		#yield(get_tree().create_timer(0.2), "timeout")
		
func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
