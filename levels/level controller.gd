extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/Timer.start(rand_range(5, 10))
	pass # Replace with function body.

func game_over():
	$Control/darkness.hide()
	get_tree().call_group('lights','hide')
	get_tree().call_group('sounds', 'stop')
	$Panel.visible = true
	pass

func flash():
	$Control/thunder.play()
	get_tree().call_group('lights', 'show')
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_KinematicChar_damaged(character):
	$Control/Sprite.frame+=1
	if $Control/Sprite.frame == 14:
		character.get_parent().remove_child(character)
		game_over()
	pass # Replace with function body.


func _on_Timer_timeout():
	flash()
	$Control/Timer.stop()
	pass # Replace with function body.


func _on_thunder_finished():
	$Control/Timer.start(rand_range(10, 15))
	get_tree().call_group('lights','hide')
	pass # Replace with function body.