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

func _integrate_forces(state):
	globals.player_speed = floor(linear_velocity.length())
	
	if position.y > 750:
		state.transform = Transform2D(0.0, Vector2(640, 320))
		state.linear_velocity = Vector2(0,0)
		state.angular_velocity = 0
		globals.bullets = 6
		$ProgressBar.value = globals.bullets
		
	# Get shooting input
	get_input()
	
func get_input():
	if Input.is_action_just_pressed("left_click") and globals.reloading == false:
		on_shoot()

func on_shoot():
	if globals.raceActive == false:
		globals.faultFlag = true
	
	var bullet = preload("res://scenes/bullet.tscn").instantiate()
	bullet.start($Gun/GunFront.global_position, $Gun.global_rotation)
	get_parent().call_deferred("add_child", bullet)
	
	$Gun/GunFront/GPUParticles2D.restart()
	$Gun/AudioStreamPlayer2D.play()
	$Camera2D.shake_screen()
	
	globals.bullets -= 1
	$ProgressBar.value = globals.bullets
	
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

func _on_area_2d_body_entered(body):
	globals.raceActive = false
