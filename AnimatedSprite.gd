extends AnimatedSprite


signal Fire
export (PackedScene) var Pistol
export (PackedScene) var Shotgun
var Weapon

#Declare Ammo
export var pistol_ammo = 15
export var shotgun_ammo = 10

var max_current_cooldown
var current_ammo = pistol_ammo
var cooldown
# Called when the node enters the scene tree for the first time.
func _ready():
	Weapon = Pistol.instance() #Ready first weapon: Pistol
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
		current_ammo += -1
		cooldown = max_current_cooldown
		if Weapon.type == "Pistol":
			$PistolSound.play()
			pistol_ammo += -1
		if Weapon.type == "Shotgun":
			$ShotgunSound.play()
			shotgun_ammo += -1
	if Input.is_action_just_pressed("wp_pistol"):
		Weapon.queue_free()
		remove_child(Weapon)
		Weapon = Pistol.instance()
		max_current_cooldown = Weapon.cooldown
		add_child(Weapon)
		current_ammo = pistol_ammo
	if Input.is_action_just_pressed("wp_shotgun"):
		Weapon.queue_free()
		remove_child(Weapon)
		Weapon = Shotgun.instance()
		max_current_cooldown = Weapon.cooldown
		add_child(Weapon)
		current_ammo = shotgun_ammo

func MoreAmmo(type, ammount):
	if type == "Pistol":#A Pistol clip
		if Weapon.type == "Pistol":
			current_ammo += ammount
		pistol_ammo += ammount
			
	if type == "Shotgun":#A Shotgum magazines
		if Weapon.type == "Shotgun":
			current_ammo += ammount
		shotgun_ammo += ammount