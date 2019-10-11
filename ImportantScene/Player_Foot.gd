extends AnimatedSprite

# Declare member variables here. Examples:
var dash_cooldown_max = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	var velocity = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x += -1
	if Input.is_action_pressed("ui_up"):
		velocity.y += -1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_just_pressed("ui_select") && velocity.length() > 0 && get_parent().dash_cooldown == 0:
		get_parent().dash_cooldown = get_parent().dash_cooldown_max
		get_parent().dash_direction = velocity.normalized()
	if velocity.length() > 0:
		play()
		rotation = velocity.angle()
		get_parent().direction = velocity.normalized()
	else:
		stop()
		get_parent().direction = Vector2(0,0)


