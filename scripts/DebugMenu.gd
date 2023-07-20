extends Control

var _500m = preload("res://levels/500Meters.tscn").instantiate()
var hurdles = preload("res://levels/Hurdles.tscn").instantiate()

func _on__m_pressed():
	get_parent().visible = false
	get_tree().root.add_child(_500m)

func _on_hurdles_pressed():
	get_parent().visible = false
	get_tree().root.add_child(hurdles)
