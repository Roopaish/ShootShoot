extends KinematicBody2D

export var speed = 500
var bullet_speed = 600
var bullet = preload("res://scenes/Bullet.tscn")


func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	
	velocity = velocity.normalized()
	look_at(get_global_mouse_position())
	velocity = move_and_slide(velocity*speed)
	
	
	if Input.is_action_just_pressed("LMB&Space"):
		fire()

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child",bullet_instance)


func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		get_tree().change_scene("res://scenes/menu.tscn")
	if "Bro" in body.name:
		get_tree().change_scene("res://scenes/win.tscn")





