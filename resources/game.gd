extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var health = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event.is_action_pressed("ui_cancel") and get_tree().current_scene.get_path() == "/root/Overworld":
		if get_tree().paused:
			get_tree().paused = false
		else:
			get_tree().paused = true
