extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal start_battle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Heart_body_entered(body):
	if body.name == "Ayush":
		Game.set_health(3)
		$AnimationPlayer.play("boss_intro")
		yield($AnimationPlayer, "animation_finished")
		emit_signal("start_battle")
		queue_free()
	pass # Replace with function body.
