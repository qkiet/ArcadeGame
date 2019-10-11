extends Node2D
var cooldown = 50

export (PackedScene) var Projectile
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func Fire(target):
	#
	var proj = Projectile.instance()
	proj.direction = (target - global_position).normalized()
	get_tree().current_scene.add_child(proj)
	get_parent().get_node("Sprite").stop()
	get_parent().get_node("Sprite").play("attack")
	queue_free()
