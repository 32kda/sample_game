extends Node2D

var duck_prototype = preload("res://duck_prototype.tscn")
var height 
var random = RandomNumberGenerator.new()
var shot_sound = load("res://shotgun.mp3")
var visible_rect
var hit_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalInfo.connect("hit", func () : on_duck_hit())
	visible_rect = get_viewport().get_visible_rect()
	height = visible_rect.size.y
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and visible_rect.has_point(to_local(get_global_mouse_position())):
		play_shot()

func play_shot():
	var player = AudioStreamPlayer.new()
	player.stream = shot_sound
	add_child(player)
	player.finished.connect(func (): remove_child(player))
	player.play()	

func _on_timer_timeout():
	var duck = duck_prototype.instantiate()	
	duck.position.y = random.randi_range(50,height - 50)	
	add_child(duck)
	pass # Replace with function body.


func on_duck_hit():
	hit_count += 1
	$Label.text = "Hits: " + str(hit_count)
	
