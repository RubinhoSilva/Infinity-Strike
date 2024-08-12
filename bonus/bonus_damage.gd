class_name BonusDamage
extends Bonus

#@onready var hitbox_component: = $HitboxComponent as HitboxComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()

	#hitbox_component.hit_hurtbox.connect(func(hurtbox: HurtboxComponent):
		#print('HI')
	#)
