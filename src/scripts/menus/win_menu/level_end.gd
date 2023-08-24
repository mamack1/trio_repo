extends "res://scripts/player/HUD.gd"

export(NodePath) onready var hud = get_node(hud)

var is_at_door := false
var locked_door := true

func _on_level_end_body_entered(body):
	is_at_door = true
	
	if not hud.has_key:
		$door_locked.play()
	
func _on_level_end_body_exited(body):
	is_at_door = false

func _on_key_check_body_entered(body):
	if hud.has_key:
		$AnimatedSprite.play("open")
		locked_door = false
		$open_door.play()
		

func _physics_process(delta):
	if is_at_door and hud.has_key:
		$win_sound.play()
		get_tree().change_scene("res://Scenes/menus/win_menu/win_scene.tscn")

