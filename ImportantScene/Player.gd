extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 150
var direction = Vector2(0,0)
var dash_cooldown = 0
var dash_cooldown_max = 10 
var dash_speed_factor = 2
var dash_direction
var max_health = 100
var health = 100

signal AlertZombie

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	if health <= 0:
		queue_free()


func _physics_process(delta):
	emit_signal("AlertZombie",global_position)
	if dash_cooldown > 0:
		move_and_collide(dash_direction * speed*dash_speed_factor*delta)
		dash_cooldown += -1
	else:
		move_and_collide(direction * speed*delta)
	
func TakeDamage(damage):
	for i in 4:
        modulate = Color(1,0,0)
        yield(get_tree(), "idle_frame")
        modulate = Color(1,1,1)
        yield(get_tree(), "idle_frame")
	health += -damage
