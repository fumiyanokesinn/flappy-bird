extends Control

const GREEN_YELLOW = Color(0.678431, 1, 0.184314, 1)

func _on_button_pressed():
	$ButtonClick.play()
	SceneTransction.change_scene("res://main.tscn",GREEN_YELLOW)
