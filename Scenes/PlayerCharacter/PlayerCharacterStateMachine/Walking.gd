extends CharacterState

func enter(_msg: Dictionary = {}) -> void:
	pass

func physics_update(_delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player_character.velocity = input_direction * player_character.speed
	
	if input_direction.x > 0:
		player_character.anim.play("walk_right")
	elif input_direction.x < 0:
		player_character.anim.play("walk_left")
	elif input_direction.y < 0:
		player_character.anim.play("walk_up")
	elif input_direction.y > 0: 
		player_character.anim.play("walk_down")
	
	player_character.move_and_slide()
	
	if is_equal_approx(player_character.velocity.x, 0.0) and is_equal_approx(player_character.velocity.y, 0.0):
		state_machine.transition_to("Idle")
	
