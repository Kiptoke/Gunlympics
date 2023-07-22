extends Area2D

@onready var globals = get_node("/root/Globals")

func _on_body_entered(body):
	if body.name != "Player":
		globals.targets_shot += 1
		
		self.queue_free()
		body.queue_free()
