extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_speeds(ls, rs, a):
	$LinearSpeed.text = "LinearSpeed : " + str(stepify(ls.length(), 0.01))
	$RotationalSpeed.text = "RotationalSpeed : " + str(stepify(rs, 0.01))
	$Ammo.text = "Ammo : " + str(a)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_power_animated_sprite(animation):
	$PowerContainer/AnimatedSprite.play(animation)
