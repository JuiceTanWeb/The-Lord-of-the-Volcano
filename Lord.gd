extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum {SPAWNING, CHARGING, SHOOTING}
onready var enemy = load("FinalEnemy.tscn")
var phase = SPAWNING
var in_battle = false
var health = 70
var target = 0
var invincible = true
var player = null
var distance_traveled_charge = 0
var time_to_spawn_lava = false
var positions = [Vector2(1700, 1600), Vector2(500, 500), Vector2(1700, 200), Vector2(0,0)]
onready var lava = load("res://Lava.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	target = randi() % 4
	randomize()
	$Sprite.texture = load("res://lord of the volcano.png")
	$Sprite.scale = Vector2(1,1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	if in_battle:
		match phase:
			SPAWNING:
				if global_position.distance_to(positions[target]) > 10:
					move_and_slide(global_position.direction_to(positions[target]) * 200)
					if invincible:
						modulate.a = 0.5
				elif invincible:
					invincible = false
					$Invincible.play_backwards("Invincible")
					yield($Invincible, "animation_finished")
					spawn_enemy("Rock", 3)
					target = (target + 1) % 4
					$Invincible.play("Invincible")
					yield($Invincible, "animation_finished")
					invincible = true
			CHARGING:
				invincible = false
				$Charge.play("charge_side")
				if distance_traveled_charge < 1200:
					move_and_slide(global_position.direction_to(player.global_position) * 600)
					distance_traveled_charge +=  600 * delta
				else:
					yield(get_tree().create_timer(1), "timeout")
					distance_traveled_charge = 0
			SHOOTING:
				invincible = false
				if time_to_spawn_lava:
					var tile = lava.instance()
					tile.global_position = player.global_position + Vector2(randi() % 800 - 400, randi() % 800 - 400)
					owner.call_deferred("add_child", tile)
					time_to_spawn_lava = false

func _on_Heart_start_battle():
	in_battle = true
	spawn_enemy("Rock", 3)
	pass # Replace with function body.
	
func hit():
	if !invincible:
		health -= 1
		print(health)
		$Hurt.play("boss_hurt")
		if health < 50:
			phase = CHARGING
		if health < 30:
			phase = SHOOTING
		if health <= 0:
			$Killed.play("boss_killed")
			get_tree().paused = true
			yield($Killed, "animation_finished")
			get_tree().change_scene("res://Ayush.tscn")
func spawn_enemy(type, times):
	match type:
		"Rock":
			for i in range (times):
				var temp = enemy.instance()
				temp.global_position = Vector2(global_position.x + randi() % 20, global_position.y + 250 + randi() % 20)
				owner.call_deferred("add_child",temp)



func _on_hitbox_body_entered(body):
	if body.name == "Ayush":
		Game.set_health(Game.health - 1)
		body.hit()
		yield(get_tree().create_timer(1), "timeout")


func _on_DetectRange_body_entered(body):
	if body.name == "Ayush":
		player = body
	pass # Replace with function body.


func _on_Timer_timeout():
	time_to_spawn_lava = true
	pass # Replace with function body.
