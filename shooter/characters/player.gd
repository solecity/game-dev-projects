extends CharacterBody2D

@export var speed : float = 100


func _physics_process(_delta):
	var direction : Vector2 = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	)
	
	velocity = direction * speed
	
	move_and_slide()
