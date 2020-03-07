extends AnimatedSprite


var speed = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var lr = Input.is_action_pressed("ui_right") as int - Input.is_action_pressed("ui_left") as int
	var ud = Input.is_action_pressed("ui_up") as int - Input.is_action_pressed("ui_down") as int
	
	if lr:	#If lr (left/right) is nonzero
		if lr==1:	#right - left == 1 if left is not pressed
			play('right')
		else:	#Else it would be left
			play('left')
		position.x += speed * delta * lr
		
	if ud:	#If ud (Up/Down) is nonzero
		if ud>1:	#up - down == 1 if down is not pressed
			play('up')
		else:	#Else it would be down
			play('down')
		position.y += -speed * delta * ud
	
	if !(lr|ud):	#If LR or UD are both zero
		stop()
