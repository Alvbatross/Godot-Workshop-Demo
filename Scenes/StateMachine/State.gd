extends Node

class_name State

var state_machine: StateMachine = null

func input_handler(_event: InputEvent) -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func enter(_msg: Dictionary = {}) -> void:
	pass

func exit() -> void:
	pass
