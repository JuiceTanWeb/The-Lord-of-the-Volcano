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


func _on_CaveEntranceFinal_body_entered(body):
	if body.name == "Ayush":
		$AnimationPlayer.play("transition_to_boss")
		get_tree().paused = true
		Game.position = Vector2(body.position.x, body.position.y - 20)
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().paused = false
	get_tree().change_scene("res://Dungeon.tscn")
	pass # Replace with function body.
