extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var mass   	= 1.0 # static ?

export var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(delta):
	position += velocity * delta * 60 / 52.174 # delta * 60 = 1
