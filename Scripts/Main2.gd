extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_hud()

func change_hud():
	var r = $Roci.SpeedAcc
	$HUD.update_speeds($Roci.pixspeed, $Roci.rotate, $Roci/Workshop/PDCGun0.ammo)
	match ($Roci.speed):
		r.ACC_0:
			$HUD.set_power_animated_sprite("0")
		r.ACC_1_3:
			$HUD.set_power_animated_sprite("0_33")
		r.ACC_1:
			$HUD.set_power_animated_sprite("1")
		r.ACC_3:
			$HUD.set_power_animated_sprite("3")
		r.ACC_6:
			$HUD.set_power_animated_sprite("6")
