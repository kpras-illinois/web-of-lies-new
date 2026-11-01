extends Node2D

@onready var _dialogue_drawer = $HUD/DialogueDrawer

var num = 1


func _input(event: InputEvent) -> void:
		if event.is_action_pressed("ui_accept"):
				if _dialogue_drawer.next(num):
					num += 1
		"""elif event.is_action_pressed():
			if _dialogue_drawer.next(num):
				num -= 1
		"""

func optionChoose(op: int) -> void:
	if op == 1:
		if _dialogue_drawer.optional(num):
			if _dialogue_drawer.next(num+2):
				num += 3
		else:
			if _dialogue_drawer.next(num):
				num +=1
	elif op == 2:
		if _dialogue_drawer.next(num):
			num +=1
		 
