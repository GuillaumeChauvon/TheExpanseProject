extends Camera2D


# Lower cap for the `_zoom_level`.
export var min_zoom = 0.5
# Upper cap for the `_zoom_level`.
export var max_zoom = 20
# Controls how much we increase or decrease the `_zoom_level` on every turn of the scroll wheel.
export var zoom_factor = 0.1


func _physics_process(_delta):
	if Input.is_action_just_released("zoom_out"):
		zoom += Vector2(zoom_factor, zoom_factor)
	if Input.is_action_just_released("zoom_in"):
		zoom -= Vector2(zoom_factor, zoom_factor)
	zoom.x = clamp(zoom.x, min_zoom, max_zoom)
	zoom.y = clamp(zoom.y, min_zoom, max_zoom)
