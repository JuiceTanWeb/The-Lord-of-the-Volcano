extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_entered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	yield(get_tree().create_timer(1), "timeout")
	set_process(true)
	pass # Replace with fu:nction body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_entered:
		Game.set_health(Game.health - 0.5)
		player_entered = false
#	pass


func _on_Lava_body_entered(body):
	if body.name == "Ayush":
		player_entered = true
	pass # Replace with function body.


func _on_Lava_body_exited(body):
	if body.name == "Ayush":
		player_entered = false
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.
