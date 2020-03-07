extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func game_over():
	$Panel.visible = true
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_KinematicChar_damaged():
	$Control/Sprite.frame+=1
	if $Control/Sprite.frame == 14:
		game_over()
	pass # Replace with function body.
