extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var button = preload("res://s4xstuff/custbutton.tscn")
onready var container = $Control/Panel/ScrollContainer/VBoxContainer

func changescene(scene):
	get_tree().change_scene(scene)
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	var x = global.available_levels
	
	for i in range(x):
		var b = button.instance()
		container.add_child(b)
		b.set_text("Level "+str(i+1))
		b.data = "res://levels/level"+str(i+1)+".tscn"
		b.connect("cust_pressed", self, "changescene")
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	changescene('res://levels/level1.tscn')
	pass # Replace with function body.


func _on_Level_Select_pressed():
	$Control/Panel/ScrollContainer.visible = !$Control/Panel/ScrollContainer.visible
	pass # Replace with function body.


func _on_Instructions_pressed():
	$Instructpanel.show()
	pass # Replace with function body.


func _on_Close_pressed():
	$Instructpanel.hide()
	pass # Replace with function body.
