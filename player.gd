extends CharacterBody2D

# defines the walking speed of the player character (PC)
@export var speed := 1000

# sets the starting position of the PC
func _ready() -> void:
	position = Vector2(860, 600)

# allows PC to move throughout the scene
func _physics_process(_delta):
	var direction = Vector2.ZERO
	# inputs for movement left & right
	if Input.is_action_pressed("Left"):
		direction.x -= 1
		speed = 1000
	if Input.is_action_pressed("Right"):
		direction.x += 1
		speed = 1000
	# sets the velocity of the movement
	if (Input.is_action_pressed("RunLeft")):
		direction.x -= 1
		speed = 2000
	if  (Input.is_action_pressed("Left") and Input.is_action_pressed("Shift")):
		direction.x += 1
		speed = 2000


	velocity = direction.normalized() * speed
	
	move_and_slide()
