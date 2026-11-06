extends CanvasLayer

# allows script to interact with child nodes
@onready var fade_black = $FadeBlack
@onready var fade_animation = $FadeAnimation

# signal sent out when transition finishes
signal on_transition_finished

# prevents transition screen from taking focus over other things
func _ready():
	fade_black.visible = false
	# moves to second part of transition
	fade_animation.animation_finished.connect(_on_animation_finished)
	
# triggers when another transition finishes finishes
func _on_animation_finished(anim_name):
	# fades out if faded in
	if anim_name == "fade_in":
		# sends signal that animation is finishing
		on_transition_finished.emit()
		fade_animation.play("fade_out")
	# prevents transition screen from covering other things
	elif anim_name == "fade_out":
		fade_black.visible = false
	
# allows us to trigger fading from anywhere in the project
func transition():
	fade_black.visible = true
	fade_animation.play("fade_in")
