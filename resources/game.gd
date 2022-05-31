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
var final_boss = false
var pause_scenes = ["Overworld", "Dungeon", "Boss"] 
# Called when the node enters the scene tree for the first time.
func _ready():
	load_save()
	pause_mode = Node.PAUSE_MODE_PROCESS
	pass # Replace with function body.
func set_health(hp):
	health = hp
	emit_signal("changed_hp", health)
	if hp < 0.5:
		get_tree().change_scene("res://Gameover.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event.is_action_pressed("ui_cancel") and pause_scenes.has(get_tree().get_current_scene().get_name()):
		if get_tree().paused:
			get_tree().paused = false
			emit_signal("changed_pause_mode")
		else:
			get_tree().paused = true
			emit_signal("changed_pause_mode")
func load_save():
	var filetodelete = Directory.new()
	var save_game = File.new()
	if filetodelete.file_exists("user://ayush.garg"):
		save_game.open("user://ayush.garg", File.READ)
		var vardata = parse_json(save_game.get_line())
		save_game.close()
		has_sword = vardata[0]
		is_buff = vardata[1]
		final_boss = vardata[2]
	else:
		has_sword = false
		is_buff = false
		final_boss = false

func save_game():
	var filetodelete = Directory.new()
	var save_game = File.new()
	if save_game.file_exists("user://ayush.garg"):
		filetodelete.remove("user://ayush.garg")
	save_game.open("user://ayush.garg", File.WRITE)
	var node_data = [has_sword, is_buff, final_boss]
	save_game.store_line(to_json(node_data))
	save_game.close()
