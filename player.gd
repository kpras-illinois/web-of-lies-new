extends CharacterBody2D

# defines the walking speed of the player character (PC)
@export var speed := 1000

@onready var animated_sprite = $AnimatedSprite2D

# sets the starting position of the PC
func _ready() -> void:
	position = Vector2(860, 600)

# allows PC to move throughout the scene
func _physics_process(_delta):
	var direction = Vector2.ZERO
	# inputs for movement left & right
	if Input.is_action_pressed("Left"):
		direction.x -= 1
		animated_sprite.play("Walk")
		animated_sprite.flip_h = true
	elif Input.is_action_pressed("Right"):
		direction.x += 1
		animated_sprite.play("Walk")
		animated_sprite.flip_h = false
	else:
		animated_sprite.play("Idle")
	# sets the velocity of the movement
	velocity = direction.normalized() * speed
	move_and_slide()
