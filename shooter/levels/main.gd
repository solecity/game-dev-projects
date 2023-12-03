extends Node2D

@onready var bullets_container = $BulletsContainer


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _on_player_bullet_shot(Bullet, position):
	var bullet = Bullet.instantiate()
	bullet.global_position = position
	bullets_container.add_child(bullet)

