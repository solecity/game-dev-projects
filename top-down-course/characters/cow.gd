extends CharacterBody2D

enum STATE { IDLE, WALK }

@export var move_speed : float = 20
@export var idle_time : float = 5
@export var walk_time : float = 2

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var sprite = $Sprite2D
@onready var timer = $Timer

var move_direction : Vector2 = Vector2.ZERO
var current_state : STATE = STATE.IDLE

func _ready():
	set_new_state()


func _physics_process(_delta):
	if (current_state == STATE.WALK):
		velocity = move_direction * move_speed
		print(velocity)
	
		move_and_slide()


func set_new_direction():
	move_direction = Vector2(
		randi_range(-1, 1),
		randi_range(-1, 1)
	)

	sprite.flip_h = move_direction.x < 0


func set_new_state():
	if (current_state == STATE.IDLE):
		state_machine.travel("Walk")
		current_state = STATE.WALK

		set_new_direction()
		
		timer.start(walk_time)
	elif (current_state == STATE.WALK):
		state_machine.travel("Idle")
		current_state = STATE.IDLE
		
		timer.start(idle_time)


func _on_timer_timeout():
	set_new_state()
