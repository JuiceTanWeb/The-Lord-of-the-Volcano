extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var enemy = load("res://EnemyPath.tscn")
onready var hot_enemy = load("res://EnemyPath2.tscn")
onready var ghost = load("res://Ghost.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_enemy("Rock", 2)
	pass # Replace with function body.
func spawn_next_wave(wave):
	match wave:
		1:
			spawn_enemy("Rock", 1)
			spawn_enemy("Hot", 2)
		2:
			spawn_enemy("Ghost", 3)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func spawn_enemy(type, times):
	match type:
		"Rock":
			for i in range (times):
				var temp = enemy.instance()
				temp.global_position = Vector2(global_position.x + randi() % 20, global_position.y + randi() % 20)
				temp.set_owner(owner)
				owner.call_deferred("add_child",temp)
		"Hot":
			for i in range (times):
				var temp = hot_enemy.instance()
				temp.global_position = Vector2(global_position.x + randi() % 20, global_position.y + randi() % 20)
				temp.set_owner(owner)
				owner.call_deferred("add_child",temp)
		"Ghost":
			for i in range (times):
				var temp = ghost.instance()
				temp.global_position = Vector2(global_position.x + randi() % 20, global_position.y + randi() % 20)
				temp.set_owner(owner)
				owner.call_deferred("add_child",temp)
