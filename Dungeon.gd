extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var wave = 0
var enemies_killed = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Polygon2D.visible = false
#	$Polygon2D.global_position = $Ayush.global_position
#	$AnimationPlayer.play("transition_to_boss"
	pass # Replace with function body.

func tally_kill():
	enemies_killed += 1
	print(enemies_killed)
	match wave:
		0:
			if enemies_killed >= 10:
				wave += 1
				get_tree().call_group("Spawners", "spawn_next_wave", wave)
				enemies_killed = 0
		1:
			if enemies_killed >= 15:
				wave += 1
				get_tree().call_group("Spawners", "spawn_next_wave", wave)
				enemies_killed = 0
		2:
			if enemies_killed >= 15:
				wave += 1
				$Polygon2D.global_position = $Ayush.global_position
				$AnimationPlayer.play("transition_to_boss")
				get_tree().paused = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().paused = false
	get_tree().change_scene("res://Boss.tscn")
	pass # Replace with function body.
