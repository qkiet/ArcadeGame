extends "res://addons/godot-behavior-tree-plugin/bt_base.gd"
# Leaf Node
var behavior_tree

func _ready():
	behavior_tree = find_parent("BehaviorTree")

func tick(tick):
	#Let's get distance
	var distance = behavior_tree.ranger.global_position - behavior_tree.player.global_position
	print(behavior_tree.ranger, ' ',distance.length())
	return FAILED
