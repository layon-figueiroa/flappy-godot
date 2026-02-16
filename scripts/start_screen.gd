extends Control

signal game_started

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS
	
	GameManager.connect_screen(self)

func _on_btn_start_game_pressed() -> void:
	#get_tree().change_scene_to_file("res://scenes/game.tscn")
	emit_signal("game_started")

func _on_btn_quit_game_pressed() -> void:
	get_tree().quit()
