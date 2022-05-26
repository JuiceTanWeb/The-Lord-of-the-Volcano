extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var wave = 0
var enemies_killed = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func tally_kill():
	enemies_killed += 1
	print(enemies_killed)
	if enemies_killed >= 10:
		wave += 1
		get_tree().call_group("Spawners", "spawn_next_wave", wave)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
