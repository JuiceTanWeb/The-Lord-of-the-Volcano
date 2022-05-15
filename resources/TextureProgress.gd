extends TextureProgress


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Game.connect("changed_hp", self, "update_hp")
	value = Game.health
	pass # Replace with function body.
func update_hp(health):
	value = health

# Called every frame. 'delta' is the elapsed time since the previous frame.
#	pass
