extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var target = null
var attacking = false
var direction = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
#	if attacking:
#		move_and_slide(position.direction_to(target.position) * 200)
#	else:
	if !attacking:
		move_and_slide(Vector2(0, 100 * direction))
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "Ayush":
		target = body
		attacking = true
	pass # Replace with function body.


func _on_Timer_timeout():
	direction *= -1
	pass # Replace with function body.
