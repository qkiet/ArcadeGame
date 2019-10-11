extends "res://addons/godot-behavior-tree-plugin/bt_base.gd"

var distance = 100
# Leaf Node
func tick(tick):
	print('Check distance')
	if distance > 1:
		print('Check distance success')
		return OK
	print('Check distance failed')
	return FAILED
