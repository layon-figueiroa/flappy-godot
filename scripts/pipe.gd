extends Node2D

signal add_point

@export var speed: float = 200.0
@export var destroy_x: float = -100.0

func _ready() -> void:
	GameManager.connect_pipe(self)

func _process(delta: float) -> void:
	move_pipe(delta)
	check_position()
	
func move_pipe(delta: float) -> void:
	position.x -= speed * delta
	
func check_position() -> void:
	if position.x < destroy_x:
		queue_free()

func _on_score_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("add_point")
