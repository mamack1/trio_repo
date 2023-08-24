extends CanvasLayer

var coin = 0
var diamond = 0
var gem = 0

func _ready():
	$Coin_counter.text = str(coin)
	$Diamond_counter.text = str(diamond)
	$Gem_counter.text = str(gem)

func _on_diamond_collected():
	diamond += 1
	_ready()

func _on_gem_collected():
	gem += 1
	_ready()


func _on_coin_collected():
	coin += 1
	_ready()
