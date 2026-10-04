extends Node2D

#csv file
var csv_path_test : String = "res://Dialogue/Scriptfile/Test_Dialogue(Sheet1).csv"
#Example characters
var existing_characters : Dictionary = {"Character 1":load("res://Characters/Character _1.dch"), "Character 2": load("res://Characters/Character_2.dch")} 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	#creates an array of events to have the timeline process
	var events : Array= []
	
	#loads csv into a 2D array [character, text]
	var dialogue_data : Array[PackedStringArray] = load_csv_as_array(csv_path_test)

	#iterates through the array
	for row in dialogue_data:
		var character_name = row[0]
		var character_text = row[1]

		#creates new text event for every line of dialogue
		var text_event = DialogicTextEvent.new()
		#connects the character from file to the character in dialogic character folder
		text_event.character = existing_characters[character_name]
		#assigns text to event
		text_event.text = character_text

		#adds, in order, dialogue lines to be played
		events.append(text_event)
		
	
	var timeline = DialogicTimeline.new()
	
	#assigns events to new timeline
	timeline.events = events
	timeline.events_processed = true;

	#starts timeline
	Dialogic.start(timeline)
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func load_csv_as_array(csv_path: String) -> Array[PackedStringArray]:
	#Array from parsed csv file
	var _array2D : Array[PackedStringArray] = [];
	
	#Open CSV file and Read it
	var file = FileAccess.open(csv_path,FileAccess.READ)
	
	#file not loaded error handling
	if file == null:
		printerr("File not found",csv_path)
		return _array2D
		
	#Loop over file and append to array
	while not file.eof_reached():
		var line = file.get_csv_line()
		if(line.size() >= 2):
			_array2D.append(line)
		
	#close file
	file.close()
	
	return _array2D
	
