extends Node2D
export (PackedScene) var Muzzle
var min_damage = 8
var max_damage = 11
var shells = 3
export var arc = PI/30
export var cooldown = 75
var type = "Shotgun"
signal BulletOut
func _ready():
	get_parent().connect("Fire", self, "_on_Player_Turret_Fire")

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_Player_Turret_Fire(target):
	for i in range(0,shells):
		var muzzle = Muzzle.instance()
		get_tree().current_scene.add_child(muzzle)
		connect("BulletOut",muzzle,"MuzzleOut")
		var offset = (target - global_position).rotated(-arc + arc*i )
		emit_signal("BulletOut",global_position, global_position + offset)
		disconnect("BulletOut",muzzle,"MuzzleOut")

	


	