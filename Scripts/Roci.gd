extends Area2D


var velocity = Vector2.ZERO
var speed = 0
var pixspeed = Vector2.ZERO
var rotate180 = false
var rotate = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

enum SpeedAcc {ACC_0 = 0,
	ACC_1_3 = 1,
	ACC_1 = 2,
	ACC_3 = 3,
	ACC_6 = 4
}

func get_input():
	if Input.is_action_just_pressed("fullpush"):
		speed = SpeedAcc.ACC_6
	if Input.is_action_just_pressed("push"):
		speed +=1
	if Input.is_action_just_pressed("slow"):
		speed -= 1
	if Input.is_action_just_pressed("stop"):
		speed = SpeedAcc.ACC_0
	if Input.is_action_pressed("rotateclk") || !Input.is_action_pressed("rotateaclk") && rotate < 0:
		rotate += 2
	if Input.is_action_pressed("rotateaclk") || !Input.is_action_pressed("rotateclk") && rotate > 0:
		rotate -= 2
	speed = clamp(speed, 0, 4)
	rotate = clamp(rotate, -60, 60)

func _physics_process(delta):
	get_input()
	pixspeed = pixspeed
	var acc = transform.x
	match (speed):
		SpeedAcc.ACC_0:
			acc *= 0
		SpeedAcc.ACC_1_3:
			acc *= 0.33
		SpeedAcc.ACC_1:
			acc *= 1
		SpeedAcc.ACC_3:
			acc *= 3
		SpeedAcc.ACC_6:
			acc *= 6
	pixspeed += acc
	rotation_degrees += rotate/10
	if rotation_degrees >= 360:
		rotation_degrees -= 720
	elif rotation_degrees < -360:
		rotation_degrees += 720
	position += pixspeed * delta