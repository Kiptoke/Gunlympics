extends RigidBody2D

@export var SPEED: float = 300.0
@export var KICKBACK: float = 500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	randomize()
	
func _physics_process(delta):
	# Get shooting input
	get_input()

func get_input():
	if Input.is_action_just_pressed("left_click"):
		on_shoot()

func on_shoot():
	var gun_pos = to_local($Gun/GunFront.global_position)
	var bullet = preload("res://scenes/bullet.tscn").instantiate()
	bullet.start(gun_pos, $Gun.rotation)
	add_child(bullet)

	# Calculate recoil
	var kick = -gun_pos.normalized() * KICKBACK
	print(kick)
	apply_impulse(kick)
	
	# Apply rotation
	apply_torque(randi() % 180)
