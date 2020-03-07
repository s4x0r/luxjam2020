extends TextureButton

var data


signal cust_pressed

func set_text(text):
	$Label.text=text

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Control_pressed():
	emit_signal("cust_pressed", data)
	pass # Replace with function body.
