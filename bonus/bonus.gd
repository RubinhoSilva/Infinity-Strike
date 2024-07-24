class_name Bonus
extends Node2D

@onready var hitbox_component: = $HitboxComponent as HitboxComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('jadsjdj')
	hitbox_component.hit_hurtbox.connect(func(hurtbox: HurtboxComponent):
		print('HI')
	)
