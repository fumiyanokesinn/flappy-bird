extends Control

const DARK_BLUE = Color(0, 0, 0.545098, 1)

func _on_button_pressed():
	$ButtonClick.play()
	SceneTransction.change_scene("res://main.tscn",DARK_BLUE )


