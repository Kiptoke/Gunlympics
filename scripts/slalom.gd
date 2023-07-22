extends Area2D

@onready var globals = get_node("/root/Globals")
@export var slalom_index: int = 1

func slalom_hit():
	if slalom_index > globals.slalom_number:
		if slalom_index != globals.slalom_number + 1:
			globals.slalom_faults += (slalom_index - globals.slalom_number - 1)
		globals.slalom_number = slalom_index
		
func _on_body_entered(body):
	if body.name == "Player":
		slalom_hit()
