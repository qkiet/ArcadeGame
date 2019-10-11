extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var fade_out_alpha_speed = 0.6
var fade_out_speed = 150
var scale_speed = 0.95


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Scaling Text
	if rect_scale.x > 1:
		rect_scale += -delta*scale_speed*Vector2(1,1)
	modulate.a += -delta * fade_out_alpha_speed
	rect_position.y += -delta*fade_out_speed
	if modulate.a <= 0:
		queue_free()
