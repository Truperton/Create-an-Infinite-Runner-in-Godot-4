extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		get_node(".").hide()
		get_node("AudioStreamPlayer2D").play()

func _on_audio_stream_player_2d_finished() -> void:
	self.queue_free()
