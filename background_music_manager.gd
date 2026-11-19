extends AudioStreamPlayer

var tween: Tween

func play_music(new_stream: AudioStream, fade_duration: float = 1.0) -> void:
	# checks if a song is already loaded and playing
	if stream == new_stream and playing:
		return
	# checks if a tween is already occuring and stops it if so
	if tween:
		tween.kill()
	# creates an instance of a tween
	tween = create_tween()
	# starts if a song is already playing
	if playing:
		# smoothly lowers volume of current track
		tween.tween_property(self, "volume_db", -40.0, fade_duration)
		tween.tween_callback(func():
			# swaps old audio for new audio
			stream = new_stream
			# plays new audio
			volume_db = 0.0
			play()
		)
	# starts if no song is playing yet
	else:
		volume_db = 0.0
		stream = new_stream
		play()

# gets called if a room should have no music, or to just stop music for a moment
func stop_music(fade_duration: float = 1.0) -> void:
	if not playing:
		return
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, "volume_db", -40.0, fade_duration)
	tween.tween_callback(stop)
