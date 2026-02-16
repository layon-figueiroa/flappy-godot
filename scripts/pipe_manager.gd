extends Node

@export var pipe_scene: PackedScene

@onready var timer: Timer = $SpawnTimer

var pipe_position_x: float = 640.0
var pipe_position_y: float
var top_pipe_limit: float = -38.0
var bottom_pipe_limit: float = 47.0

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	
func calculate_pipe_position() -> Vector2:
	pipe_position_y = randf_range(top_pipe_limit, bottom_pipe_limit)
	return Vector2(pipe_position_x, pipe_position_y)
	
func _on_timer_timeout():
	var pipes = pipe_scene.instantiate()
	
	pipes.add_point.connect(GameManager.add_point)
	
	pipes.global_position = calculate_pipe_position()
	add_child(pipes)
