extends RigidBody2D

export (PackedScene) var PDCAmmo

func PDCshoot():
	var b = PDCAmmo.instance()
	owner.add_child(b)
	b.transform = $Canon.global_transform
	print("shoot")

func get_input():
	if Input.is_action_just_pressed("shoot"):
		PDCshoot()

func _physics_process(_delta):
	get_input()
