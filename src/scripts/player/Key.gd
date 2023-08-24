extends Area2D

signal key_collected

export(NodePath) onready var hud = get_node(hud)

func _on_Key_body_entered(body):
	if body.name == "KinematicBody2D":
		$collect_sound.play()
		$AnimationPlayer.play("bounce")
		emit_signal("key_collected")
		set_collision_mask_bit(0, false)
		set_collision_layer_bit(0, false)
		hud.key.show()
		hud.has_key = true

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
