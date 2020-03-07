extends KinematicBody2D

signal damaged

const GRAVITY = 200.0
const WALK_SPEED = 2
const FRICTION = .66 * WALK_SPEED
var collision
var velocity = Vector2()

func _physics_process(delta):
	collision = null
	var lr = Input.is_action_pressed("ui_right") as int - Input.is_action_pressed("ui_left") as int
	var ud = Input.is_action_pressed("ui_down") as int - Input.is_action_pressed("ui_up") as int
	
	if lr:	#If lr (left/right) is nonzero
		if lr==1:	#right - left == 1 if left is not pressed
			$AnimatedSprite.play('right')
		else:	#Else it would be left
			$AnimatedSprite.play('left')
		velocity.y = velocity.y / FRICTION
		velocity.x = WALK_SPEED * lr
		
	if ud:	#If ud (Up/Down) is nonzero
		if ud==1:	#down - up == 1 if up is not pressed
			$AnimatedSprite.play('down')
		else:	#Else it would be up
			$AnimatedSprite.play('up')
		velocity.x = velocity.x / FRICTION
		velocity.y = WALK_SPEED * ud
	
	if !(lr|ud):	
		$AnimatedSprite.stop()
		velocity = Vector2(velocity.x/FRICTION,velocity.y/FRICTION)
	
	collision = move_and_collide(velocity)
	if collision != null:
		if not collision.collider.get_parent().get("moveable")==null:
			collision.collider.get_parent().position += velocity*8
		move_and_collide(-velocity*8)
		$AudioStreamPlayer.play()
		emit_signal("damaged", self)
