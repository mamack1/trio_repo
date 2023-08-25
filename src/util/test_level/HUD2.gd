extends CanvasLayer

var coin = 0
var diamond = 0
var gem = 0
onready var key = $key

var has_key := false

func _ready():
	$Coin_counter.text = str(coin)
	$Diamond_counter.text = str(diamond)
	$Gem_counter.text = str(gem)

func _on_diamond_collected():
	diamond += 1
	GlobalSettings.diamonds += 1
	_ready()

func _on_gem_collected():
	gem += 1
	GlobalSettings.gems += 1
	_ready()


func _on_coin_collected():
	coin += 1
	GlobalSettings.coins += 1
	_ready()
	
func _on_key_collected():
	pass

func player_has_key():
	if has_key:
		return 1
	else:
		return 0
