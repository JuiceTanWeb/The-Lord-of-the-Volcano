extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		$Start/AnimationPlayer.stop()
		$Start.visible = true
		$AnimationPlayer.play("flash")
		$Theme.stop()
		$StartSound.play()
		var filetodelete = Directory.new()
		if !filetodelete.file_exists("user://ayush.garg"):
			get_tree().change_scene("res://Story.tscn")
		else:
			get_tree().change_scene("res://Overworld.tscn")
#	pass
