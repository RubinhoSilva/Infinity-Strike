class_name Bonus
extends Node2D

@onready var hitbox_component: = $HitboxComponent as HitboxComponent
@onready var move_component: = $MoveComponent as MoveComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sign_ = (randi() % 2) * 2 - 1
	var velocity = randi_range(0, 50)
	
	move_component.velocity.x = velocity * sign_
	print('jadsjdj')
	hitbox_component.hit_hurtbox.connect(func(hurtbox: HurtboxComponent):
		print('HI')
	)
