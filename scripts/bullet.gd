extends CharacterBody2D

@export var SPEED: int = 2000

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(SPEED, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	print("exited")
	queue_free()
