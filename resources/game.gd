extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal changed_hp
signal changed_pause_mode
export var health = 3 setget set_health
var player = null
var position = Vector2.ZERO
var has_sword = false
var is_buff = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	pass # Replace with function body.
func set_health(hp):
	health = hp
	emit_signal("changed_hp", health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event.is_action_pressed("ui_cancel") and get_tree().current_scene.get_path() == "/root/Overworld":
		if get_tree().paused:
			get_tree().paused = false
			emit_signal("changed_pause_mode")
		else:
			get_tree().paused = true
			emit_signal("changed_pause_mode")
func load_save():
	var filetodelete = Directory.new()
	if filetodelete.file_exists("user://ayush.garg"):
		pass

func save_game():
	var save_game = File.new()
	save_game.open("user://ayush.garg", File.WRITE)
	var node_data = [has_sword, is_buff]
	save_game.store_line(to_json(node_data))
	save_game.close()
