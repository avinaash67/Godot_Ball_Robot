extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Alive"
	add_color_override("font_color", Color(1,1,0))	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Robot_enemy_body_entered(body):
	if body.name == "Avi":
		text = String("Dead")
		add_color_override("font_color", Color(1,0,0))


func _on_Robot_enemy_body_exited(body):
	if body.name == "Avi":
		text = String("Alive")
		add_color_override("font_color", Color(1,1,0))
