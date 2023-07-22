extends Node2D

@onready var globals = get_node("/root/Globals")
var targets = 15
signal targets_finished()

func _ready():
	globals.targets_shot = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if globals.targets_shot == targets:
		globals.raceActive = false
		globals.raceFinish = true
		targets_finished.emit()
