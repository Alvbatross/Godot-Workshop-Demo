extends CharacterState

func enter(_msg: Dictionary = {}) -> void:
	player_character.velocity = Vector2.ZERO
	if player_character.anim.animation == "walk_up":
		player_character.anim.play("idle_up")
	elif player_character.anim.animation == "walk_down":
		player_character.anim.play("idle_down")
	elif player_character.anim.animation == "walk_left":
		player_character.anim.play("idle_left")
	elif player_character.anim.animation == "walk_right":
		player_character.anim.play("idle_right")

func update(_delta: float) -> void:
	if Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_machine.transition_to("Walking")
