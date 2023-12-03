extends StaticBody2D
class_name Bullet

signal hit_something

@export var speed : float = 400.0


func _physics_process(delta):
	global_position += transform.x * speed * delta


#func _on_bullet_body_entered(target):
#	if target.is_in_group("mobs"):
#		target.queue_free()
#
#	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
