extends Node2D
export (PackedScene) var Muzzle
var min_damage = 10
var max_damage = 15
var cooldown = 25
var type = "Pistol"
signal BulletOut
func _ready():
	get_parent().connect("Fire", self, "_on_Player_Turret_Fire")

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_Player_Turret_Fire(target):
	var muzzle = Muzzle.instance()
	get_tree().current_scene.add_child(muzzle)
	connect("BulletOut",muzzle,"MuzzleOut")
	emit_signal("BulletOut",global_position,target)
	disconnect("BulletOut",muzzle,"MuzzleOut")