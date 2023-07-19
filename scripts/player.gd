extends RigidBody2D

@export var SPEED: float = 300.0
@export var KICKBACK: float = 500.0

# Get game state and global variables
@onready var globals = get_node("/root/Globals")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var random = RandomNumberGenerator.new()

func _ready():
	randomize()

func _integrate_forces(_state):
	globals.player_speed = floor(linear_velocity.length())
	# Get shooting input
	get_input()
	
func get_input():
	if Input.is_action_just_pressed("left_click"):
		on_shoot()

func on_shoot():
	var bullet = preload("res://scenes/bullet.tscn").instantiate()
	bullet.start($Gun/GunFront.global_position, $Gun.global_rotation)
	$Gun/GunFront/GPUParticles2D.restart()
	get_parent().call_deferred("add_child", bullet) # Apply to parent

	apply_recoil()

func apply_recoil():
	# Physical kickback
	set_axis_velocity(Vector2.ZERO)
	var direction = self.global_position - $Gun/GunFront.global_position
	var kick = direction.normalized() * KICKBACK
	apply_impulse(kick)
	
	# Body rotation
	var side = direction.normalized().dot(Vector2.RIGHT)
	var torque = abs(100 * side)
	if side > 0:
		apply_impulse(Vector2.LEFT * torque, $RightImpulse.global_position)
	elif side < 0:
		apply_impulse(Vector2.RIGHT * torque, $LeftImpulse.global_position)
	
