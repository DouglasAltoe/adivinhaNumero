extends Control

@onready var message = $VBoxContainer/message
@onready var higher = $VBoxContainer/button_higher
@onready var lower = $VBoxContainer/button_lower
@onready var correct = $VBoxContainer/button_correct

var guess
var min_guess = 0
var max_guess = 1000
var guess_count = 1
var end = false

func _ready() -> void:
	guess = (min_guess + max_guess) / 2
	
	message.text = "O número que você pensou foi " + str(guess) + "?"
	higher.text = "É maior que " + str(guess)
	lower.text = "É menor que " + str(guess)

func _on_button_higher_pressed() -> void:
	_make_guess("higher")

func _on_button_lower_pressed() -> void:
	_make_guess("lower")

func _make_guess(type):
	guess_count += 1
	
	if type == "higher":
		min_guess = guess
	else:
		max_guess = guess
		
	guess = (min_guess + max_guess) / 2
	
	message.text = "O número que você pensou foi " + str(guess) + "?"
	higher.text = "É maior que " + str(guess)
	lower.text = "É menor que " + str(guess)

func _on_button_correct_pressed() -> void:
	if end:
		_restart_game()
	else:
		_end_game()

func _end_game():
	end = true
	message.text = "Eu sabia que era " + str(guess) + "! Precisei de apenas " + str(guess_count) + " tentativas pra descobrir!"
	correct.text = "Jogar novamente"

func _restart_game():
	get_tree().reload_current_scene()
