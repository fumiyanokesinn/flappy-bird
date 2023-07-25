extends Control

var Main = load("res://main.tscn")
var Start = load("res://start.tscn")

func _ready():
	$GameOver.play()

func _on_retry_button_pressed():
	$ButtonClick.play()
	Global.isGaming = true
	SceneTransction.change_scene(Main,Global.DARK_BLUE )


func _on_end_button_pressed():
	$ButtonClick.play()
	SceneTransction.change_scene(Start,Global.DARK_BLUE )
