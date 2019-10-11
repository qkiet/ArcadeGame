extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
export var speed = 1200
export var distance = 1800
signal hit
var source_location
var min_damage
var max_damage
var direction = Vector2(0,0)

func _ready():
	min_damage = get_tree().current_scene.get_node("Player/Player_Turret").Weapon.min_damage
	max_damage = get_tree().current_scene.get_node("Player/Player_Turret").Weapon.max_damage

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	randomize()
	if global_position.distance_to(source_location) >= distance:
		queue_free()

func MuzzleOut(source, target):
	source_location = source
	rotation = (target - source).angle()
	position = source
	direction = (target - source).normalized()

func _physics_process(delta):
	var damage = randi()%(max_damage-min_damage) + min_damage
	var collider_info = move_and_collide(direction * speed*delta)
	if collider_info:
		connect("hit", collider_info.collider,"CausingDamage")
		emit_signal("hit",damage,source_location)
		queue_free()
	