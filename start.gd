extends Control

func _on_button_pressed():
	$ButtonClick.play()
	SceneTransction.change_scene("res://main.tscn")
