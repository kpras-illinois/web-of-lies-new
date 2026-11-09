extends CharacterBody2D

# makes script globally recognized
class_name Player

# defines the walking speed of the player character (PC)
@export var speed := 1000

@onready var animated_sprite = $AnimatedSprite2D
var inventory = EvidenceInventory.new()
# sets the starting position of the PC
func _ready() -> void:
	position = Vector2(860, 600)
	inventory.load_inventory(EvidenceDatabase.evidencelog)

	

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
	if (Input.is_action_pressed("RunLeft")):
		direction.x -= 1
		speed = 2000
	if  (Input.is_action_pressed("Left") and Input.is_action_pressed("Shift")):
		direction.x += 1
		speed = 2000


	velocity = direction.normalized() * speed
	
	move_and_slide()
	
	
#evidence collecting test
func collect_evidence(item_id: String) -> void:
	var evidence = EvidenceDatabase.get_evidence(item_id)
	if evidence == null:
		print("null evidence")
		return

	var added = inventory.add_item(evidence)

	if added:
		print("Collected: ", evidence.item_name)
		inventory.save_inventory()
	else:
		print("You already have this evidence!")
	
func _process(delta)->void:
	if Input.is_action_pressed("testaddevidence1"):
		collect_evidence("knife01")
	if Input.is_action_pressed("testaddevidence2"):
		collect_evidence("knife02")
	if Input.is_action_pressed("testaddevidence3"):
		collect_evidence("paper01")
	if Input.is_action_pressed("testaddevidence4"):
		collect_evidence("magnifying")
	
		
		
