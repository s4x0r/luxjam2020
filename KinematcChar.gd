extends KinematicBody2D

const GRAVITY = 200.0
const WALK_SPEED = 1
var collision

var velocity = Vector2()

func _physics_process(delta):
	collision = null
	
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play('left')
		velocity.y = 0
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.play('right')
		velocity.y = 0
		velocity.x = WALK_SPEED
	elif Input.is_action_pressed("ui_up"):
		$AnimatedSprite.play('up')
		velocity.x = 0
		velocity.y = -WALK_SPEED
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play('down')
		velocity.x = 0
		velocity.y = WALK_SPEED
	else:
		$AnimatedSprite.stop()
		velocity = Vector2(0,0)
	
	collision = move_and_collide(velocity)
	if collision != null:
		print(collision.collider)
		collision.collider.get_parent().position += velocity*8
		
		$AudioStreamPlayer.play()
