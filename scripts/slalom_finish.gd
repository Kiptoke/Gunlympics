extends Node2D

@onready var globals = get_node("/root/Globals")
@export var PENALTY: float = 10.0
var total_slaloms = 14

# Called when the node enters the scene tree for the first time.
func _ready():
	globals.slalom_number = 0
	globals.slalom_faults = 0

func _on_area_2d_body_entered(_body):
	globals.slalom_faults += (total_slaloms - globals.slalom_number)
	var timeLabel = get_node("TrackUI/CanvasLayer/timeLabel")
	timeLabel.add_time(PENALTY * globals.slalom_faults)
	timeLabel.update_time()
	
