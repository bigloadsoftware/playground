extends Area2D

@export var speed = 200
var screen_size 
var last_direction_faced = "idle_down"


func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x = 1
	if Input.is_action_pressed("move_left"):
		velocity.x = -1
	if Input.is_action_pressed("move_up"):
		velocity.y = -1
	if Input.is_action_pressed("move_down"):
		velocity.y = 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		if velocity.x > 0 && velocity.y > 0:
			$AnimatedSprite2D.play("run_right")
			last_direction_faced = "idle_right"
		if velocity.x > 0 && velocity.y < 0:
			$AnimatedSprite2D.play("run_right")
			last_direction_faced = "idle_right"
		if velocity.x < 0 && velocity.y > 0:
			$AnimatedSprite2D.play("run_left")
			last_direction_faced = "idle_left"
		if velocity.x < 0 && velocity.y < 0:
			$AnimatedSprite2D.play("run_left")
			last_direction_faced = "idle_left"
		if velocity.x == 0 && velocity.y > 0:
			$AnimatedSprite2D.play("run_down")
			last_direction_faced = "idle_down"
		if velocity.x == 0 && velocity.y < 0:
			$AnimatedSprite2D.play("run_up")
			last_direction_faced = "idle_up"
		if velocity.x > 0 && velocity.y == 0:
			$AnimatedSprite2D.play("run_right")
			last_direction_faced = "idle_right"
		if velocity.x < 0 && velocity.y == 0:
			$AnimatedSprite2D.play("run_left")
			last_direction_faced = "idle_left"
	else:
		$AnimatedSprite2D.play(last_direction_faced)

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
