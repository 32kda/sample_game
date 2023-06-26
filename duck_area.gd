extends Area2D


var DUCK_SPEED = 50

var max_x

# Called when the node enters the scene tree for the first time.
func _ready():
	max_x = get_viewport().get_visible_rect().size.x
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = position.x + delta * DUCK_SPEED
	if position.x > max_x + 50:
		get_parent().remove_child(self)


func _on_input_event(viewport, event, shape_idx):
	if InputEventMouseButton and event.is_pressed():
		GlobalInfo.emit_signal("hit")
		get_parent().get_parent().remove_child(get_parent())
	


func _on_mouse_entered():
	print()
	pass # Replace with function body.
