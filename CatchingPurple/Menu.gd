extends Control

func _ready():
	get_tree().paused = false

func _on_StartButton_pressed():
	get_tree().change_scene("res://Ground.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
