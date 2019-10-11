extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
var speed = 340
var direction = Vector2(0,0)
var damage = 25
signal CauseDamage

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")
	connect("CauseDamage",get_tree().current_scene.get_node("Player"), "TakeDamage")

func _physics_process(delta):
	var velocity = direction * speed
	var target = move_and_collide(velocity * delta)
	if target:
		if is_connected("CauseDamage",target.collider,"TakeDamage"):
			emit_signal("CauseDamage",damage)
		queue_free()


func Fire(target):
	direction = (target - global_position).normalized()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
