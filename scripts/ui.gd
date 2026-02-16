extends CanvasLayer

@onready var game_over_panel: Control = $GameOver
@onready var start_screen: Control = $StartScreen
@onready var lbl_score: Label = $GameOver/VBoxContainer/MarginContainer/VBoxContainer/LblScore
@onready var lbl_top_score: Label = $GameOver/VBoxContainer/MarginContainer/VBoxContainer/LblTopScore
@onready var lbl_screen_score: Label = $HUD/MarginContainer/LblScore

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS
	
	GameManager.game_over.connect(show_game_over)
	GameManager.update_score.connect(change_score)
	
func show_game_over(score: int, top_score: int) -> void:
	game_over_panel.visible = true
	lbl_score.text = "Score: " + str(score)
	lbl_top_score.text = "Top Score: " + str(top_score)
	
func change_score(score: int) -> void:
	lbl_screen_score.text = str(score)

func _on_btn_retry_pressed() -> void:
	GameManager.start_game()

func _on_btn_main_menu_pressed() -> void:
	GameManager.back_main_menu()
