extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CaveEntranceSword_body_entered(body):
	if body.name == "Ayush":
		Game.position = Vector2(body.position.x + 20, body.position.y)
		get_tree().change_scene("res://Cave.tscn")
	pass # Replace with function body.
