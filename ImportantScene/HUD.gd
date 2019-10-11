extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$BottomBox/HBoxContainer/WeaponHuD/Type.text = get_parent().get_node("Player_Turret").Weapon.type
	$BottomBox/HBoxContainer/WeaponHuD/Ammo.text = str(get_parent().get_node("Player_Turret").current_ammo)
	$BottomBox/HBoxContainer/VBoxContainer/HealthBar/HealthProgress.value = float(get_parent().health)/float(get_parent().max_health)*100
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
