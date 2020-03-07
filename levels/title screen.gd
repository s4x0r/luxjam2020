extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func changescene(scene):
	get_tree().change_scene(scene)
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	changescene('res://levels/level1.tscn')
	pass # Replace with function body.
