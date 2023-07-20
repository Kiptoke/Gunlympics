extends ProgressBar

@onready var globals = get_node("/root/Globals")

@export var reloadTime: float = 2.0
@export var reloadIncrement: float = 0.01

var reloadProgress = 0

func _process(_delta):
	if globals.reloading and value < reloadTime:
		reloadProgress += reloadIncrement
		value = reloadProgress
	elif globals.reloading and value >= reloadTime:
		reload()
		
func _on_value_changed(_value):
	if globals.bullets <= 0 and globals.reloading == false:
		reloadProgress = 0
		globals.reloading = true
		max_value = reloadTime
		
func reload():
	max_value = 6
	globals.bullets = 6
	value = globals.bullets
	globals.reloading = false
