extends AnimatedSprite


var speed = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		play('right')
		position.x += speed * delta
	elif Input.is_action_pressed("ui_left"):
		play('left')
		position.x += -speed * delta
	elif Input.is_action_pressed("ui_up"):
		play('up')
		position.y += -speed * delta
	elif Input.is_action_pressed("ui_down"):
		play('down')
		position.y += speed * delta
	else:
		stop()
