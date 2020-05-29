extends KinematicBody

# Declare member variables here. Examples:
const SPEED = 6
const GRAVITY = 9.8
const ACCEL= 3
var velocity = Vector3(0,0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	#transform.basis = Basis(Vector3(1, 0, 0), PI/2) * transform.basis
	#charachter_node = get_node(".").global_transform()
	pass
	
func _physics_process(delta):
	var is_moving = false
	
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = -SPEED
		is_moving = true
		$AnimationPlayer.play("Run")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = SPEED
		is_moving = true 
		$AnimationPlayer.play("Run")
	else:
		velocity.x = lerp(velocity.x, 0, 0.5)
		is_moving = false 
		$AnimationPlayer.play("Idle-loop")
	if Input.is_action_pressed("ui_up"):
		velocity.z = SPEED
		is_moving = true
		$AnimationPlayer.play("Run") 
	elif Input.is_action_pressed("ui_down"):
		velocity.z = -SPEED
		is_moving = true 
		$AnimationPlayer.play("Run")
	else:
		velocity.z = lerp(velocity.z, 0, 0.05)
		is_moving = false 
		$AnimationPlayer.play("Idle-loop")
		
		
#	if is_moving == true:
#		var char_rot = get_node(".").get_rotation()
#		char_rot.y = angle
#		get_node(".").set_rotation(char_rot)
	
	#if is_moving == true:
	var char_rot = get_node(".").get_rotation()
	var angle = atan2(velocity.x,velocity.z) 
	char_rot.y = angle
	get_node(".").set_rotation(char_rot)
	
	
	
	move_and_slide(velocity)
	
	
	
	
#Data used for IMU Calculation Used in Future
#func _physics_process(delta):
#	print("wrt x = " + String(transform.basis.x))
#	print("wrt z = " + String(transform.basis.z))
#
#	if Input.is_action_just_pressed("ui_up"):
#		velocity.z += (ACCEL*delta)
#	else:
#		velocity.z = lerp(velocity.x, 0, 0.1)
#	velocity.linear_interpolate()
#
#	move_and_slide(velocity)
#
	
	
