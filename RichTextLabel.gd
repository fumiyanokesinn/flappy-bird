extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_entered():
	text = "	[center][shake rate=5.0 level=40 connected=1]START"


func _on_mouse_exited():
	text = "	[center]START"
