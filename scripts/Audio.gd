extends Node

@onready var globals = get_node("/root/Globals")
var flag = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Crowd.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if globals.raceActive and flag == false:
		$Start.play()
		crossfade()
		flag = true
	if globals.faultFlag:
		$Crowd.stop()
		$Cheer.stop()

func crossfade():
	if $Crowd.playing and $Cheer.playing:
		return
		
	if get_node("Targets") != null:
		$Crowd.stop()
		$Targets.play()
		return
		
	$Cheer.play()
	$AnimationPlayer.play("FadeToCheer")
