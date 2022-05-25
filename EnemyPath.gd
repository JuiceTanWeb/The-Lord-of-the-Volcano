extends Navigation2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var target = null
onready var character = $Enemy
var path = []
var walk_distance = 0
var cooldown = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Enemy.global_position = global_position
	global_position = Vector2.ZERO
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	if !target == null and !cooldown: 
		walk_distance = 200 * delta
		move_along_path(walk_distance)
		_update_navigation_path(character.get_global_position(), target.global_position)
	
func move_along_path(distance):
	var last_point = character.position
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])
		# The position to move to falls between two points.
		if distance <= distance_between_points:
			character.position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			return
		# The position is past the end of the segment.
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)
	# The character reached the end of the path.
	character.position = last_point
	set_process(false)


func _update_navigation_path(start_position, end_position):
	# get_simple_path is part of the Navigation2D class.
	# It returns a PoolVector2Array of points that lead you
	# from the start_position to the end_position.
	path = get_simple_path(start_position, end_position, true)
	$Line2D.points = path
	# The first point is always the start_position.
	# We don't need it in this example as it corresponds to the character's position.
	path.remove(0)
	set_process(true)


func _on_Area2D_body_entered(body):
	if body.name == "Ayush":
		target = body
	 # Replace with function body.


func _on_Enemy_tree_exiting():
	queue_free()
	pass # Replace with function body.


func _on_Hitbox_body_entered(body):
	if body.name == "Ayush":
		cooldown = true
		yield($Enemy/Hitbox, "body_exited")
		yield(get_tree().create_timer(1), "timeout")
		cooldown = false
	pass # Replace with function body.
