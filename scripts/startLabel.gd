extends RichTextLabel

var readyText = "[font_size=45][center][wave amp=20.0 freq=5.0 connected=1][b]Ready...[/b][/wave][/center][/font_size]"
var goText = "[rainbow freq=1.0 sat=0.8 val=0.8][wave amp=50.0 freq=5.0 connected=1][outline_size=8][font_size=100][b]GO![/b][/font_size][/outline_size][/wave][/rainbow]"
var fault = "[font_size=55][center][color=red][b]False Start![/b][/color][/center][/font_size]"
var finish = "[font_size=55][center][rainbow freq=0.3 sat=0.8 val=0.8][wave amp=50.0 freq=5.0 connected=1][b]Finish![/b][/wave][/rainbow][/center][/font_size]"

# Get game state and global variables
@onready var globals = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	text = readyText
	var random = RandomNumberGenerator.new()
	random.randomize()
	
	$startTimer.wait_time = random.randi_range(3,6)
	$startTimer.start()

func _process(_delta):
	if globals.faultFlag == true:
		text = fault
		get_parent().get_node("Button").visible = true
		$startTimer.stop()
		
func _on_hide_timer_timeout():
	var tween = create_tween()
	tween.tween_property(self, "modulate",Color.TRANSPARENT, 1).set_trans(Tween.TRANS_CUBIC)

func _on_start_timer_timeout():
	globals.raceActive = true
	globals.faultFlag = false
	$hideTimer.start()
	text = goText

func _on_area_2d_body_entered(_body):
	if globals.faultFlag == false:
		self.modulate = Color.WHITE
		text = finish
		get_parent().get_node("Button").visible = true

func _on_targets_targets_finished():
	if globals.faultFlag == false:
		self.modulate = Color.WHITE
		text = finish
		get_parent().get_node("Button").visible = true

func _on_sand_body_entered(_body):
	if globals.jumpActive == false:
		self.modulate = Color.WHITE
		text = finish
		get_parent().get_node("Button").visible = true
