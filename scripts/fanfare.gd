extends AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	self.play()

func _on__m_pressed():
	self.stop()

func _on_hurdles_pressed():
	self.stop()

func _on_long_jump_pressed():
	self.stop()

func _on_shooting_pressed():
	self.stop()

func _on_sailing_pressed():
	self.stop()

func _on_rock_climbing_pressed():
	self.stop()
