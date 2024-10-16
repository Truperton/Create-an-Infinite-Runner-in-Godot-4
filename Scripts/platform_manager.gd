extends Node

var platform_scene : PackedScene = preload("res://Scenes/Objects/Platform.tscn")
var pool_size : int = 4
var platform_pool : Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(pool_size):
		var platform_temp : Node2D = platform_scene.instantiate()
		platform_temp.show()
		platform_temp.platform_size = 3
		platform_temp.set_platform()
		platform_temp.position = Vector2(i * (40 * 3), 500)
		platform_pool.append(platform_temp)
		add_child(platform_temp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
