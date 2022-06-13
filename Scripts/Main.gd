extends Node


# Mercury  	: 0.4 UA
# Venus		: 0.7 UA | X0 726 	| Vy0 21,37 | M 0.815
# Earth		: 1.0 UA | X0 1017 	| Vy0 17.94 | M 1.0
# Mars		: 1.5 UA | X0 1660 	| Vy0 13.3  | M 0.1

# Belt
# Cerres    : 2.77 UA
# Vesta		: 2.36 UA
# Pallas    : 2.77 UA
# Hygie     : 3.14 UA

# Jupiter   : 5.2 UA | X0 5442 	| Vy0 7.6 | M 318
# Calisto, Ganymède, Io, Europe

# Sun  		: 0, 0, 333043
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time = 0
var frameNumber = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Venus.velocity = Vector2(0, 21.37)
	$Earth.velocity = Vector2(0, 17.94)
	$Mars.velocity = Vector2(0, 13.3)
	$Jupiter.velocity = Vector2(0, 7.6)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _physics_process(delta):
	time += delta
	frameNumber += 1
	if (frameNumber > 59):
		$HUD.update_time(time)
		frameNumber = 0
	$Sun.position = Vector2.ZERO
	accGravity($Sun, $Venus)
	accGravity($Sun, $Earth)
	accGravity($Sun, $Mars)
	accGravity($Sun, $Jupiter)

func accGravity(a, b):
	var force = a.mass * b.mass / pow((a.get_position()).distance_to(b.get_position()), 2)
	var angle = b.get_position().angle_to_point(a.get_position())
	var reverse = 1
	for body in [a, b]:
		var accN = force / body.mass / 52.174
		var accV = accN * Vector2(reverse * cos(angle), reverse * sin(angle))
		body.velocity += accV
		reverse = -1
