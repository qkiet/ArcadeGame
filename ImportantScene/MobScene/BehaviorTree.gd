extends Node

const BehvError = preload("res://addons/godot-behavior-tree-plugin/error.gd")
const Tick = preload("res://addons/godot-behavior-tree-plugin/tick.gd")

##setup property to be used by behavior treee
var player 
var ranger
##
func _ready():
	player = get_tree().current_scene.find_node("Player")
	ranger = get_parent()
	if get_child_count() > 1:
		var msg = str("ERROR BehaviorTree node at ", get_name(), " has more than 1 child. Should only have one. Returning.")
		return BehvError.new(self, msg)
		
		

func tick(actor, blackboard):
	var tick = Tick.new()
	tick.tree = self
	tick.actor = actor
	tick.blackboard = blackboard

	var retVal = FAILED
	for c in get_children():
		retVal =  c._execute(tick)

	#close nodes from last tick, if needed.
	var lastOpenNodes = tick.blackboard.get('openNodes', self)
	var currentOpenNodes = [] + tick.openNodes

	#if node isn't in current, but is in last, close it
	for node in lastOpenNodes:
		if(!currentOpenNodes.has(node)):
			if tick.blackboard.get('isOpen', tick.tree, node) == true:
				node._close(tick)

	#populate the blackboard
	blackboard.set('openNodes', currentOpenNodes, self)
	return retVal
