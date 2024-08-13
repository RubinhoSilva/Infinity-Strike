class_name BonusHealth
extends Bonus


func _ready() -> void:
	super()

	hitbox_component.hit_hurtbox.connect(func(hurtbox: HurtboxComponent):
		print('bonus de health')
		var loaded_resource = load("res://player_ship/player_ship_stats.tres")

		if loaded_resource:

			print(loaded_resource)  # Saída: 100
		
	)
