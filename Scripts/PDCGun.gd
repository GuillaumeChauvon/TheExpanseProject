extends RigidBody2D

export (PackedScene) var PDCAmmo

export var init_angle = 0
export var max_angle = 45
export var min_angle = -45 
export var ammo = 1000


func PDCshoot():
	var b = PDCAmmo.instance()
	owner.owner.add_child(b)
	b.transform = $Canon.global_transform	
	b.global_position = $Canon.global_position

func get_input():
	$AnimatedSprite.play("Cold")
	if Input.is_action_pressed("shoot") && ammo > 0:
		PDCshoot()
		$AnimatedSprite.play("Fire")
		ammo -= 1

func _physics_process(_delta):
	get_input()
	PDCFollow(Vector2.ZERO)

func PDCFollow(point):
	look_at(point)
	rotation_degrees = clamp(rotation_degrees, min_angle + init_angle, max_angle + init_angle)
