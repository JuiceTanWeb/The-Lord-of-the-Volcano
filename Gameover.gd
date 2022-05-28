extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	$Start.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event.is_action_pressed("ui_accept") and !$AnimationPlayer.is_playing():
		$Start.visible = true
		$Start/AnimationPlayer.stop()
		$AnimationPlayer2.play("flash")
		$StartSound.play()
		yield($StartSound, "finished")
		Game.set_health(3)
		get_tree().change_scene("res://Overworld.tscn")


func _on_AnimationPlayer_animation_finished(anim_name):
	$Start/AnimationPlayer.play("Flash")
	pass # Replace with function body.
