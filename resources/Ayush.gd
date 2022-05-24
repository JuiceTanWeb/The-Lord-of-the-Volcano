extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var MAX_SPEED = 400
var input_vector = Vector2.ZERO
const DIRECTION_RIGHT = 1
const DIRECTION_LEFT = -1
var ACCEL = 400
const FRICTION = 400
var direction = Vector2(DIRECTION_RIGHT, 1)
var velocity = Vector2.ZERO
onready var bullet = load("res://Bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	if (get_tree().current_scene.name == "Overworld"):
		position = Game.position
	if Game.is_buff:
		MAX_SPEED = 600
		ACCEL = 600
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_direction(hor_direction):
	if hor_direction == 0:
		hor_direction = DIRECTION_RIGHT # default to right if param is 0
	var hor_dir_mod = hor_direction / abs(hor_direction) # get unit direction
	$Rotate.apply_scale(Vector2(hor_dir_mod * direction.x, 1)) # flip
	direction = Vector2(hor_dir_mod, direction.y) # update direction

func _physics_process(_delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		velocity += input_vector*ACCEL
		velocity = velocity.clamped(MAX_SPEED)
		#$Rotate/Sprite.playing = true
		if input_vector.x >= 0:
			set_direction(DIRECTION_LEFT)
		else:
			set_direction(DIRECTION_RIGHT)
		if input_vector.y > 0:
			$Rotate/Chungus.scale = Vector2(0.5, 0.5)
			$Rotate/Chungus.play("walking_front")
		elif input_vector.y < 0:
			$Rotate/Chungus.scale = Vector2(0.5, 0.5)
			$Rotate/Chungus.play("walking_back")
		else:
			$Rotate/Chungus.scale = Vector2(0.5, 0.5)
			$Rotate/Chungus.play("walking_side")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		$Rotate/Chungus.playing = false
	move_and_slide(velocity)
func _input(event):
	if event.is_action_pressed("ui_accept"):
		var b = bullet.instance()
		b.transform = global_transform
		b.direction = direction
		b.scale = $Rotate.scale
		owner.add_child(b)
func _on_Suit_get_buff():
	$Rotate/Chungus.play("buff")
	get_tree().paused = true
	yield(get_tree().create_timer(1.0), "timeout")
	MAX_SPEED = 800
	ACCEL = 800
	Game.is_buff = true
	get_tree().paused = false
	pass # Replace with function body.
