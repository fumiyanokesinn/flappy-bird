extends Control

func _on_button_pressed():
	$ButtonClick.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://main.tscn")
