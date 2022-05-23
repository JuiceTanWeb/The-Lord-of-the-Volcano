extends Area2D

var speed = 750
var direction = Vector2(0,0)

func _physics_process(delta):
	position += -transform.x * delta * speed

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	if !body.name == "Ayush":
		queue_free()
