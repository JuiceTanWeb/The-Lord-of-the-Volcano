extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Game.connect("changed_pause_mode", self, "update_visibility")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_visibility():
	if get_tree().paused:
		visible = true
	else:
		visible = false
#	pass


func _on_Button_pressed():
	var filetodelete = Directory.new()
	if filetodelete.file_exists("user://ayush.garg"):
		filetodelete.remove("user://ayush.garg")
	Game.load_save()
	get_tree().paused = false
	get_tree().change_scene("res://TitleScreen.tscn")
	pass # Replace with function body.
