extends CharacterBody2D


@export var interaction_area: Area2D = null

var interact_target: Interactable = null

# defines the walking speed of the player character (PC)
@export var speed := 1000

# sets the starting position of the PC
func _ready() -> void:
	position = Vector2(860, 600)
	interaction_area.area_entered.connect(_on_interaction_area_area_entered)
	interaction_area.area_exited.connect(_on_interaction_area_area_exited)

# allows PC to move throughout the scene
func _physics_process(_delta):
	var direction = Vector2.ZERO
	# inputs for movement left & right
	if Input.is_action_pressed("Left"):
		direction.x -= 1
	if Input.is_action_pressed("Right"):
		direction.x += 1
	# sets the velocity of the movement
	velocity = direction.normalized() * speed
	move_and_slide()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		if is_instance_valid(interact_target):
			interact_target.interact()


func _on_interaction_area_area_entered(area: Area2D) -> void:
	if area is Interactable:
		interact_target = area as Interactable


func _on_interaction_area_area_exited(area: Area2D) -> void:
	if area == interact_target:
		interact_target = null
