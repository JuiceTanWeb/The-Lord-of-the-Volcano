extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	Game.final_boss = true
	Game.save_game()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Heart_start_battle():
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_hitbox_body_entered(body):
	pass # Replace with function body.