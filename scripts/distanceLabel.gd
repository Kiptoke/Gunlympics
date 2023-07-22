extends RichTextLabel

@onready var globals = get_node("/root/Globals")
var distance = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	distance = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if globals.jumpActive:
		var line = get_tree().root.get_node("LongJump/Line").position.x
		var player = get_tree().root.get_node("LongJump/Player").position.x
		text = "distance: " + str("%*.*f" % [7, 3, player - line]) 
