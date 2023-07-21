extends Control

func _on__m_pressed():
	var _500m = preload("res://levels/500Meters.tscn").instantiate()
	get_parent().visible = false
	get_tree().root.add_child(_500m)

func _on_hurdles_pressed():
	var hurdles = preload("res://levels/Hurdles.tscn").instantiate()
	get_parent().visible = false
	get_tree().root.add_child(hurdles)

func _on_rock_climbing_pressed():
	var rock = preload("res://levels/RockClimbing.tscn").instantiate()
	get_parent().visible = false
	get_tree().root.add_child(rock)
