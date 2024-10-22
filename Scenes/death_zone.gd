extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		get_node("../Game Over").game_over()
