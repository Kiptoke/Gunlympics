extends RichTextLabel

@onready var globals = get_node("/root/Globals")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "[right] targets left: " + str(15 - globals.targets_shot) + "[/right]"
