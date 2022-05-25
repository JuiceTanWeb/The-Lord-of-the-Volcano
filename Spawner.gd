extends PathFollow2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var enemy = load("res://EnemyPath.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	offset += 400


func _on_Timer_timeout():
	owner.add_child(enemy.instance())
	pass # Replace with function body.
