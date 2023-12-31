extends Area2D

@export var speed = 20
@onready var enemy_hit = $"../enemy_hit"
@onready var bg_music = $"../bg_music"

func _process(velocity):
	velocity = Vector2.ZERO
	if velocity.length() > 0:
		velocity.normalized()
		speed * velocity
		
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		
	position += velocity * speed
	


func _on_body_entered(body):
	hide()
	enemy_hit.play()
	bg_music.stop()
