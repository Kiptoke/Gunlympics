extends RichTextLabel

@onready var globals = get_node("/root/Globals")

func _process(_delta):
	if globals.slalom_faults != 0:
		text = "[right] faults: [color=red]" + str(globals.slalom_faults) + "[/color][/right]"
