class_name BonusHealth
extends Bonus


func _ready() -> void:
	super()

	hitbox_component.hit_hurtbox.connect(func(hurtbox: HurtboxComponent):
		print('bonus de health')		
	)
