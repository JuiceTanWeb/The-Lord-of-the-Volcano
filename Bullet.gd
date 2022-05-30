extends Area2D

var speed = 1000
var direction = Vector2(0,0)

func _physics_process(delta):
	position += -transform.x * delta * speed

func _on_Bullet_body_entered(body):
	if body.is_in_group("destroyable"):
		body.queue_free()
	if body.name == "Lord":
		body.hit()
	if !body.name == "Ayush":
		queue_free()
