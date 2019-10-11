extends KinematicBody2D

#This is the AI of the Mob

##set variable
#
#var SmellRange = 300
#var speed = 100
#var max_health = 100
#var max_cooldown = 50
#var cooldown = max_cooldown
#var health = max_health
#var damage = 10
#var direction = Vector2(0,0)
#var rng = RandomNumberGenerator.new()
#
#var wander_cooldown_max = 40
#var wander_cooldown = wander_cooldown_max
#var wander_stop_cooldown_max = 40
#var wander_stop_cooldown = wander_stop_cooldown_max 
#export (PackedScene) var DamageText
#signal CauseDamage
## Called when the node enters the scene tree for the first time.
#func _ready():
#	rng.randomize()
#	get_parent().get_node("Player").connect("AlertZombie", self, "_on_Player_AlertZombie")
#	connect("CauseDamage",get_tree().current_scene.get_node("Player"), "TakeDamage")
#
#func _on_Player_AlertZombie(source_location):
#	#Its behavior: Zombie is always in wander mode. 
#	#IF smell player within smell range it will come closer and 
#	#try to hit the player.
#	#When it's out of the smell range, it returns to wander mode again
#
#
#	#Measure distance between zombie and signal source
#	var distance = global_position.distance_to(source_location)
#	if distance <= SmellRange: #If within range and not in wander mode
#		direction = (source_location-position).normalized()
#	else: #In Wander Mode
#		if wander_cooldown > 0:
#			wander_cooldown += -1
#		else:
#			if wander_stop_cooldown > 0:
#				wander_stop_cooldown += -1
#				direction=Vector2(0,0)
#			else:
#				direction=Vector2(rng.randf_range(-1,1) ,rng.randf_range(-1,1)).normalized()
#				wander_cooldown = wander_cooldown_max 
#				wander_stop_cooldown = wander_stop_cooldown_max
#
#
#func _process(delta):
#	$HealthBar.value = float(health)/ float(max_health)*100
#	if cooldown > 0:
#		cooldown += -1
#
#func _physics_process(delta):
#	var velocity = direction * speed
#	var target = move_and_collide(velocity * delta)
#	if target && cooldown <= 0 && is_connected("CauseDamage",target.collider, "TakeDamage"):
#		emit_signal("CauseDamage",damage)
#		cooldown = max_cooldown
#
#func CausingDamage(base_damage, source_location):
#	var damage = base_damage
#	var size = Vector2(2,2)
#	var color = Color(1,1,1)
#	if source_location.distance_to(position) > 550:
#		damage = damage * 0.5
#	elif source_location.distance_to(position) < 200: #Close range
#		damage = damage * 1.5
#		color = Color(1,0.8,0)
#		size = Vector2(2.6,2.6)
#	health += -damage
#	var text = DamageText.instance()
#	get_tree().current_scene.add_child(text)
#	text.rect_position = position
#	text.text = str(int(damage))
#	text.modulate = color
#	text.rect_scale = size
#
#
#	if health <= 0:
#		queue_free()
#	for i in 4:
#        modulate = modulate.inverted()
#        yield(get_tree(), "idle_frame")
#        modulate = modulate.inverted()
#        yield(get_tree(), "idle_frame")
	
var destination=position
	
func _ready():
	pass
	

	
func _physics_process(delta): #Only using for speed
	var velocity = (destination - global_position).normalized() * $Core.speed
	if (destination - global_position).length() < (velocity*delta).length():
		velocity = Vector2(0,0) 
	move_and_collide(velocity * delta)
	
	