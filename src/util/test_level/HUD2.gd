extends CanvasLayer

var coins = 0
var gem1 = 0
var gem2 = 0

func _ready():
	$Coins_counter.text = str(coins)
	$Gem1_counter.text = str(gem1)
	$Gem2_counter.text = str(gem2)

func _on_coin_collected():
	coins += 1
	_ready()

func _on_gem1_collected():
	gem1 += 1
	_ready()

func _on_gem2_collected():
	gem2 += 1
	_ready()
