extends Node

signal game_over(score: int, top_score: int)
signal update_score(score: int)

var current_score: int = 0
var top_score: int = 0

func add_point() -> void:
	current_score += 1
	if current_score > top_score:
		top_score = current_score

func connect_player(player: Node) -> void:
	player.died.connect(_on_player_died)
	
func connect_pipe(pipe: Node) -> void:
	pipe.add_point.connect(_on_player_scores)
	
func connect_screen(screen: Node) -> void:
	screen.game_started.connect(_on_game_start)
	
func start_game() -> void:
	get_tree().paused = false
	current_score = 0
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
func back_main_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/start_screen.tscn")
	
func _on_game_start() -> void:
	get_tree().paused = false
	current_score = 0
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
func _on_player_died() -> void:
	emit_signal("game_over", current_score, top_score)
	get_tree().paused = true
	
func _on_player_scores() -> void:
	emit_signal("update_score", current_score)
