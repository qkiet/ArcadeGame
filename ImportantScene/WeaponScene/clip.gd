extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal more_ammo
var type = "Pistol"
var ammo = 15
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("more_ammo",get_tree().current_scene.get_node("Player/Player_Turret"),"MoreAmmo")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Clip_body_entered(body):
	emit_signal("more_ammo",type,ammo)
	queue_free()
