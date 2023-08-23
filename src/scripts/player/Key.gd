extends Area2D

func _on_Key_body_entered(body):
	if body.name == "KinematicBody2D":
		$collect_sound.play()
		$AnimationPlayer.play("bounce")

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
