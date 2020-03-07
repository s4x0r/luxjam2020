extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func flash():
	$Light2D.visible = true
	$AudioStreamPlayer.play()
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_select"):
		flash()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AudioStreamPlayer_finished():
	$Light2D.visible = false
	pass # Replace with function body.
