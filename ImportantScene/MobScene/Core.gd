extends Node2D

export var speed = 250
export var damage = 25
export var max_health = 100
var health
signal Move
signal Attack

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("Move",self,"_unit_move")

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _unit_move(location):
	get_parent().destination = location
	
