extends Camera2D

enum ShakeType {RANDOM, NOISE}
var shake_type = ShakeType.RANDOM

@onready var noise = FastNoiseLite.new()
@onready var rand = RandomNumberGenerator.new()
var noise_i : float = 0.0
var strength_i : float = 0.0

# defaults
@export var shake_strength : float = 20.0
@export var shake_decay : float =  10.0
@export var shake_speed : float = 10.0

func _ready():
	rand.randomize()
	noise.seed = rand.randi()
	
func _process(delta):
	# fade out shake intensity over time
	strength_i = lerp(strength_i, 0.0, shake_decay * delta)
	
	# apply screen shake
	var shake_offset : Vector2
	match shake_type:
		ShakeType.NOISE: 
			shake_offset = get_noise_offset(delta, shake_speed, strength_i)
		ShakeType.RANDOM:
			shake_offset = get_random_offset(strength_i)
	
	offset = shake_offset

func get_noise_offset(delta : float, speed : float, strength : float):
	noise_i += delta * speed
	return Vector2(
		noise.get_noise_2d(1, noise_i) * strength, 
		noise.get_noise_2d(100, noise_i) * strength
	)

func get_random_offset(strength : float):
	return Vector2(
		rand.randf_range(-strength, strength),
		rand.randf_range(-strength, strength)
	)

# called by external source to start screen shake
func shake_screen(strength : float = shake_strength):
	strength_i = strength
	
