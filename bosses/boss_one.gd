class_name BossOne
extends Boss

@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var left_muzzle: Marker2D = $LeftMuzzle
@onready var right_muzzle: Marker2D = $RightMuzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent


func _ready() -> void:
	super()
	fire_rate_timer.timeout.connect(fire_lasers)
	
	
func fire_lasers() -> void:
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()
