extends CanvasLayer


func change_scene(target: String,color: Color) -> void:
	$ColorRect.color = color
	$AnimationPlayer.play("FeedIn")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("FeedIn")
