extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const MAX_SPEED = 400
var input_vector = Vector2.ZERO
const DIRECTION_RIGHT = 1
const DIRECTION_LEFT = -1
var direction = Vector2(DIRECTION_RIGHT, 1)
var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(_delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		velocity += input_vector*accel
		velocity = velocity.clamped(maxspeed)
		#$Rotate/Sprite.playing = true
		if input_vector.x >= 0:
			
			set_direction(DIRECTION_LEFT)
		else:
			set_direction(DIRECTION_RIGHT)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
		$Rotate/Sprite.playing = false
	move_and_slide(velocity)
