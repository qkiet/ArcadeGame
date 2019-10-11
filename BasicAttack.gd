extends Node2D
var cooldown = 50
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("Sprite").stop()
	get_parent().get_node("Sprite").play("attack")
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
