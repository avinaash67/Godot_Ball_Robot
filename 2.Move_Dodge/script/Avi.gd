extends KinematicBody


# Declare member variables here. 
var velocity = Vector3(0,0,0)
const SPEED = 5

#creating a Socket
var Server_Sockfd= TCP_Server.new()

	
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Starting")
	if(Server_Sockfd.listen(4200,"127.0.0.1") != 0):
		print("An error occurred listening on port 4200")
	if(Server_Sockfd.is_listening()):
		print("Server is listening")
	
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(5))
	elif Input.is_action_pressed("ui_left"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-5))
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
		
	if Input.is_action_pressed("ui_up"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(5))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-5))
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
		
	
	
	if(Server_Sockfd.is_connection_available()):
		var Acceptor_Sockfd = Server_Sockfd.take_connection()
		print("Acceptor_Sockfd activated")
		print(Acceptor_Sockfd.get_connected_host())
		print(Acceptor_Sockfd.get_status())
		Acceptor_Sockfd.put_data("Hello from Godot!!".to_ascii())
		#Acceptor_Sockfd.put_data(Vector3)
	
	#print(global_transform.origin.x)
	#print(velocity)
	move_and_slide(velocity)
	
	
func _on_Robot_enemy_body_entered(body):
	if body.name == "Avi":
		print("Hit")
	
