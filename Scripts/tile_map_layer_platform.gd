extends TileMapLayer

@export var speed : float = 100
@export var platform_size : int = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(platform_size):
		set_cell(Vector2i(i, 0), 0, Vector2(7,8), 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
