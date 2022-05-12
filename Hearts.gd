extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hearts_displayed = 6 #Six half hearts
var full_heart = preload("res://resources/full_heart.png")
var half_heart = preload("res://resources/half_heart.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hearts_displayed = ceil(Game.health / (100 / 6))
	print(hearts_displayed)
	match hearts_displayed:
		0:
			$Heart3.visible = false
			$Heart2.visible = false
			$Heart1.visible = false
		1: 
			$Heart3.visible = false
			$Heart2.visible = false
			$Heart1.visible = true
			$Heart1.texture = half_heart
		2:
			$Heart3.visible = false
			$Heart2.visible = false
			$Heart1.visible = true
			$Heart1.texture = full_heart
		3:
			$Heart3.visible = false
			$Heart2.visible = true
			$Heart1.visible = true
			$Heart1.texture = full_heart
			$Heart2.texture = half_heart
		4:
			$Heart3.visible = false
			$Heart2.visible = true
			$Heart1.visible = true
			$Heart1.texture = full_heart
			$Heart2.texture = full_heart
		5:
			$Heart3.visible = true
			$Heart2.visible = true
			$Heart1.visible = true
			$Heart1.texture = full_heart
			$Heart2.texture = full_heart
			$Heart3.texture = half_heart
		6:
			$Heart3.visible = true
			$Heart2.visible = true
			$Heart1.visible = true
			$Heart1.texture = full_heart
			$Heart2.texture = full_heart
			$Heart3.texture = full_heart
#	pass
