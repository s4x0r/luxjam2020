extends Node

const MAX_LEVEL = 4
var available_levels = 1


func get_next_level(level):
	var x = int(level.lstrip('level'))
	if x < MAX_LEVEL:
		x+=1
		return ("res://levels/level"+str(x)+".tscn")
	else:
		return "res://levels/credits.tscn"
	pass

func level_complete(level):
	var x = int(level.lstrip('level'))
	if x > MAX_LEVEL:
		available_levels = MAX_LEVEL
	elif x >= available_levels:
		available_levels = x+1
	else:
		pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
