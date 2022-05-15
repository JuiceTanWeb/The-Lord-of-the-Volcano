extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Game.connect("changed_pause_mode", self, "update_visibility")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_visibility(status):
	if get_tree().paused:
		visible = true
	else:
		visible = false
#	pass
