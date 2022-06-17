extends Area2D

export var speed = 50

func _physics_process(delta):
    position += transform.x * speed * delta
    if abs(global_position.x) > 10000 || abs(global_position.y) > 10000:
        print("free_amo")
        queue_free()

