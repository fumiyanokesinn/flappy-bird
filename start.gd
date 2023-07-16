extends Control

var Main = preload("res://main.tscn")
var Ranking = preload("res://ranking.tscn")

func _on_start_button_pressed():
	$ButtonClick.play()
	Global.isGaming = true
	SceneTransction.change_scene(Main,Global.DARK_BLUE )


func _on_ranking_button_pressed():
	$ButtonClick.play()
	SceneTransction.change_scene(Ranking,Global.DARK_BLUE )
