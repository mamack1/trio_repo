extends "res://scripts/player/HUD.gd"

func _on_You_win_body_entered(body):
	get_node("/root/Hud").score += 1000	
	$win_sound.play()
