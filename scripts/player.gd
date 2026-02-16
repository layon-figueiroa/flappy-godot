extends CharacterBody2D

signal died

@export var flight_force: float = -300.0

var death_limit: float = 340.0
var gravity_force: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dead: bool = false

func _ready() -> void:
	GameManager.connect_player(self)

func _physics_process(delta: float) -> void:
	take_flight()
	apply_gravity(delta)
	
	move_and_slide()
	
	detect_collision()
	detect_fall()
	
func apply_gravity(delta: float) -> void:
	velocity.y += gravity_force * delta

func take_flight() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = flight_force
		
func detect_collision() -> void:
	if get_slide_collision_count() > 0:
		is_dead = true
		die()
		
func detect_fall() -> void:
	if global_position.y >= death_limit:
		is_dead = true
		die()

func die() -> void:
	is_dead = true
	emit_signal("died")
