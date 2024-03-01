extends State

class_name CharacterState

var player_character

# Called when the node enters the scene tree for the first time.
func _ready():
	await owner.ready
	
	player_character = owner as PlayerCharacter
	
	assert(player_character != null)
