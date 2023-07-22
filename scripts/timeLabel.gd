extends RichTextLabel

@onready var globals = get_node("/root/Globals")

var time = 0
var format_string = "%*.*f"

# Called when the node enters the scene tree for the first time.
func _ready():
	time = 0
	text = str(time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if globals.raceActive:
		time += delta
		text = str(format_string % [7, 3, time])

func add_time(t):
	time += t

func update_time():
	text = str(format_string % [7, 3, time])
