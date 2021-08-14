extends CanvasLayer


func _on_QuitButton_pressed():
	get_tree().quit()

func _on_RestartButton_pressed():
	get_tree().paused = false
	print("RESUMED")
	get_tree().reload_current_scene()
