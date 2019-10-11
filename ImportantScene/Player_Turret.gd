extends AnimatedSprite


signal Fire
export (PackedScene) var Pistol
export (PackedScene) var Shotgun
var Weapon

#Declare Ammo
export var pistol_ammo = 5
export var shotgun_ammo = 10

export var pistol_cooldown = 20
var reserve_ammo = pistol_ammo 
var current_ammo = pistol_ammo 
var max_current_cooldown
var cooldown 
# Called when the node enters the scene tree for the first time.
func _ready():
	Weapon = Shotgun.instance()
	max_current_cooldown = Weapon.cooldown
	cooldown = 0
	add_child(Weapon)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cooldown > 0:
		cooldown += - 1
	var target = get_global_mouse_position()
	rotation = (target-global_position).angle()
	if Input.is_action_pressed("left_click") && current_ammo > 0 && cooldown == 0:
		emit_signal("Fire",target)
		cooldown = max_current_cooldown
	if Input.is_action_just_pressed("wp_pistol"):
		Weapon.queue_free()
		remove_child(Weapon)
		Weapon = Pistol.instance()
		max_current_cooldown = Weapon.cooldown
		add_child(Weapon)
	if Input.is_action_just_pressed("wp_shotgun"):
		Weapon.queue_free()
		remove_child(Weapon)
		Weapon = Shotgun.instance()
		max_current_cooldown = Weapon.cooldown
		add_child(Weapon)