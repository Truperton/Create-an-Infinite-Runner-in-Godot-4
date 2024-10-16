extends TileMapLayer

@export var speed : float = 100
@export var platform_size : int = 2
@onready var coin : PackedScene = preload("res://Scenes/Objects/Coin.tscn")

# Called when the node enters the scene tree for the first time.
func set_platform() -> void:
	for i in range(platform_size):
		set_cell(Vector2i(i, 0), 0, Vector2(7,8), 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta

func add_coins() -> void:
	for i in platform_size:
		var coin_temp = coin.instantiate()
		add_child(coin_temp)
		coin_temp.position = map_to_local(Vector2(i, 0))
		coin_temp.position.y -= 80
