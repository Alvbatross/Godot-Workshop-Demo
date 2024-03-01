extends Node

class_name StateMachine

signal transitioned(state_name)

@export var initial_state: NodePath

@onready var state: State = get_node(initial_state)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await owner.ready
	
	for child in get_children():
		child.state_machine = self
	state.enter()

func _unhandled_input(event) -> void:
	state.input_handler(event) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	state.update(delta)

func _physics_process(delta) -> void:
	state.physics_update(delta)

func transition_to(target_state: String, msg: Dictionary = {}) -> void:
	if not has_node(target_state):
		return
	
	state.exit()
	state = get_node(target_state)
	state.enter(msg)
	emit_signal("transitioned", state.name)
