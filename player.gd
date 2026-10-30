extends CharacterBody2D

class_name Player

@export var interaction_area: Area2D = null

var _interactable_candidates: Array = []

var interact_target: Interactable = null

# defines the walking speed of the player character (PC)
@export var speed := 1000

# sets the starting position of the PC
func _ready() -> void:
	position = Vector2(860, 600)
	if not is_instance_valid(interaction_area):
		push_warning("Player: interaction_area is not set or invalid.")
		return
	interaction_area.area_entered.connect(_on_interaction_area_area_entered)
	interaction_area.area_exited.connect(_on_interaction_area_area_exited)

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

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		if not is_instance_valid(interact_target):
			interact_target = _pick_next_candidate()
		if is_instance_valid(interact_target):
			interact_target.interact()


func _on_interaction_area_area_entered(area: Area2D) -> void:
	if area is Interactable:
		var interactable := area as Interactable
		if interactable not in _interactable_candidates:
			_interactable_candidates.append(interactable)
		interact_target = interactable


func _on_interaction_area_area_exited(area: Area2D) -> void:
	if area is Interactable:
		var interactable := area as Interactable
		_interactable_candidates.erase(interactable)
		if interactable == interact_target:
			interact_target = _pick_next_candidate()


func _pick_next_candidate() -> Interactable:
	var i := _interactable_candidates.size() - 1
	while i >= 0:
		if not is_instance_valid(_interactable_candidates[i]):
			_interactable_candidates.remove_at(i)
		i -= 1
	if _interactable_candidates.size() > 0:
		return _interactable_candidates[_interactable_candidates.size() - 1]
	return null
