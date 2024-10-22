extends CanvasLayer

func game_over() -> void:
	get_tree().paused = true
	get_node("../GUI").hide()
	self.show()
	get_node("Score Label").text = str(Game.score)

func _on_retry_button_pressed() -> void:
	Game.score = 0
	get_tree().paused = false
	get_tree().reload_current_scene()
