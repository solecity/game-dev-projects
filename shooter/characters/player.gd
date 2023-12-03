extends CharacterBody2D

const Bullet = preload("res://weapons/bullet.tscn")
#
@onready var sprite = $Sprite2D
@onready var marker = $Marker2D
#
@export var speed : float = 200.0
@export var health : float = 100.0

var has_shield : bool = false
var is_shooting : bool = false

signal bullet_shot(Bullet, position)


func _physics_process(_delta):
	get_input()
	
	move_and_slide()


func get_input():
	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	velocity = direction * speed
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("click"):
		shoot()


func shoot():
	bullet_shot.emit(Bullet, marker.global_position)


func take_damage(amount : float):
	if (has_shield):
		amount /= 2;
	
	health = max(health - amount, 0)
