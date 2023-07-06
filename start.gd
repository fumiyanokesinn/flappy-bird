extends Control

var Main = preload("res://main.tscn")

func _on_button_pressed():
	$ButtonClick.play()
	Global.isGaming = true
	SceneTransction.change_scene(Main,Global.DARK_BLUE )


