extends RichTextLabel

@onready var globals = get_node("/root/Globals")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "[right] height: " + str(globals.player_height) + "[/right]"
