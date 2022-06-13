extends Area2D

export var speed = 50
export var init_pos = Vector2.ZERO

func _physics_process(delta):
    position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
    queue_free()