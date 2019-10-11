extends KinematicBody2D



var action_cooldown = 0
	
var destination = global_position
export (PackedScene) var Projectile

signal Fire

###These are "action behavior" functions used for 
###direct mob what to do when trigger an action
###The last line of every function set action cooldown
func RangeAttackBehave():
	destination = global_position
	action_cooldown = 10 
	
func BasicAttackBehave():
	$"Sprite".stop()
	$"Sprite".play("attack")
	action_cooldown = 30

###end
func _action(type, target_position):
	if type == "BasicAttack":
		BasicAttackBehave()
	if type == "RangeAttack":
		var proj = Projectile.instance()
		add_child(proj)
		connect("Fire", proj, "Fire")
		emit_signal("Fire", target_position)
		disconnect("Fire", proj, "Fire")
		RangeAttackBehave()
		
func _ready():
	pass

func _process(delta):
	$BehaviorTree.tick(self, $BehaviorBlackboard)
	


func _physics_process(delta): #Only using for moving
	var velocity = (destination - global_position).normalized() * $Core.speed
	if (destination - global_position).length() < (velocity*delta).length():
		velocity = Vector2(0,0)
	move_and_collide(velocity * delta)


