extends Node2D

@onready var stats_component: = $StatsComponent as StatsComponent
@onready var left_muzzle: Marker2D = $LeftMuzzle
@onready var right_muzzle: Marker2D = $RightMuzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $Anchor/AnimatedSprite2D
@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var hurtbox_component: = $HurtboxComponent as HurtboxComponent
@onready var flash_component: = $FlashComponent as FlashComponent
@onready var shake_component: = $ShakeComponent as ShakeComponent


func _ready() -> void:
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		flash_component.flash()
		shake_component.tween_shake()
		#variable_pitch_audio_stream_player.play_with_variance()
		
		print(hitbox.bonus)
	)
	
	stats_component.no_health.connect(queue_free)


func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			fire_lasers()

func fire_lasers() -> void:
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()
