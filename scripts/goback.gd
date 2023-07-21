extends Button

@onready var globals = get_node("/root/Globals")

func _on_pressed():
	globals.bullets = 6
	globals.faultFlag = false
	globals.raceActive = false
	get_parent().get_parent().get_parent().queue_free()
	self.visible = false
	get_tree().root.get_node("Levels/CanvasLayer").visible = true
