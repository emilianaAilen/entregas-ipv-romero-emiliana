extends "res://entities/AbstractState.gd"

func enter():
	yield(get_tree().create_timer(0.5), "timeout")
	parent._play_animation("dead")


func update(delta):
	parent._handle_deacceleration()
	parent._apply_movement()
