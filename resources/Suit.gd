extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal get_buff

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Suit_body_entered(body):
	if body.name == "Ayush":
		emit_signal("get_buff")
		$AnimationPlayer.play("mandestroy")
		visible = false
		Game.is_buff = true
	pass # Replace with function body.
