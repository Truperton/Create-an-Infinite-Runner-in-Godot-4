extends Node

var platform_scene : PackedScene = preload("res://Scenes/Objects/Platform.tscn")
var pool_size : int = 10
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

func _physics_process(delta: float) -> void:
	if get_node("../Player").position.x < -100:
		get_node("../Game Over").game_over()
		
	#check for platforms off screen
	for platform_current in platform_pool:
		if platform_current.position.x < -300:
			reset_platform(platform_current)
			add_platform()

func create_platform() -> Node2D:
	for platform_current in platform_pool:
		if not platform_current.visible:
			return platform_current as Node2D
	var platform_temp : Node2D = platform_scene.instantiate()
	platform_temp.hide()
	platform_pool.append(platform_temp)
	add_child(platform_temp)
	return platform_temp

func reset_platform(platform_to_reset : Node2D) -> void:
	platform_to_reset.global_position = Vector2(-2000, -2000)
	platform_to_reset.hide()

func add_platform() -> void:
	for platform_current in platform_pool:
		if not platform_current.visible:
			var pos : float = platform_pool.find(platform_current)
			platform_current.show()
			platform_current.platform_size = randi_range(3, 5)
			platform_current.position.y = randi_range(200, 500)
			
			var spawn_pos_x : float
			if pos > 0:
				spawn_pos_x = platform_pool[pos-1].global_position.x + (platform_pool[pos-1].platform_size * 70) + 80
			else:
				spawn_pos_x = platform_pool[pool_size-1].global_position.x + (platform_pool[pos-1].platform_size * 70) + 80
			
			platform_current.global_position.x = spawn_pos_x
			platform_current.set_platform()
			platform_current.add_coins()
