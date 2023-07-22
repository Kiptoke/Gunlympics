extends Node

# Numerical values
var player_speed = 0
var player_height = 0
var bullets = 6

# Slalom globals
var slalom_number = 0
var slalom_faults = 0

# Targets globals
var targets_shot = 0

# Long Distance globals
var jumpActive = false
var jumpLength = 0

var raceActive = false
var raceFinish = false
var faultFlag = false
var reloading = false

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		bullets = 6
		faultFlag = false
		raceActive = false
		raceFinish = false
		
		var node = get_tree().root.get_child(-1)
		if node.to_string() != "Levels":
			node.queue_free()
			get_tree().root.get_node("Levels/CanvasLayer").visible = true
