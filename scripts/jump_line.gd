extends Area2D

@onready var globals = get_node("/root/Globals")

func _on_body_entered(body):
	if body.name == "Player":
		globals.jumpActive = true
		
