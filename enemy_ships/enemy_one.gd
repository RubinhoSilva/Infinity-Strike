class_name EnemyOne
extends Enemy

@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var left_muzzle: Marker2D = $LeftMuzzle
@onready var right_muzzle: Marker2D = $RightMuzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent

func _ready() -> void:
	super()
	fire_rate_timer.timeout.connect(fire_lasers)
	
	
	hitbox_component.hit_hurtbox.connect(func(hurtbox: HurtboxComponent):
		print('enemy_one')	
	)
	
	#for state in states.get_children():
		#state = state as StateComponent
		#state.disable()
	#
	#move_side_component.velocity.x = [-20, 20].pick_random()
	#
	#move_down_state.state_finished.connect(move_side_state.enable)
	#move_side_state.state_finished.connect(func():
		#fire_state.enable()
		#scale_component.tween_scale()
		#projectile_spawner_component.spawn(global_position)
		#fire_state.disable()
		#fire_state.state_finished.emit()
	#)
	#fire_state.state_finished.connect(pause_state.enable)
	#pause_state.state_finished.connect(move_down_state.enable)
	#
	#move_down_state.enable()
	
func fire_lasers() -> void:
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()
