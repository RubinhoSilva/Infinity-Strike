class_name Enemy
extends Node2D

@onready var stats_component: = $StatsComponent as StatsComponent
@onready var move_component: = $MoveComponent as MoveComponent
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var scale_component: = $ScaleComponent as ScaleComponent
@onready var flash_component: = $FlashComponent as FlashComponent
@onready var shake_component: = $ShakeComponent as ShakeComponent
@onready var hurtbox_component: = $HurtboxComponent as HurtboxComponent
@onready var hitbox_component: = $HitboxComponent as HitboxComponent
@onready var destroyed_component: = $DestroyedComponent as DestroyedComponent
@onready var score_component: = $ScoreComponent as ScoreComponent
@onready var variable_pitch_audio_stream_player: = $VariablePitchAudioStreamPlayer as VariablePitchAudioStreamPlayer
@onready var damage_sfx = $damage_sfx as AudioStreamPlayer
@onready var explosion_sfx = $explosion_sfx as AudioStreamPlayer
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var left_muzzle: Marker2D = $LeftMuzzle
@onready var right_muzzle: Marker2D = $RightMuzzle
@onready var spawner_component_destroy = $SpawnerComponentDestroy as SpawnerComponent



func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_lasers)
	
	stats_component.no_health.connect(func():
		explosion_sfx.play() #Som não ta tocando
		score_component.adjust_score()
		
	)
	
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		#scale_component.tween_scale()
		flash_component.flash()
		shake_component.tween_shake()
		damage_sfx.play()
		variable_pitch_audio_stream_player.play_with_variance()
	)
	stats_component.no_health.connect(queue_free)
	hitbox_component.hit_hurtbox.connect(destroyed_component.destroy.unbind(1))
	hitbox_component.hit_hurtbox.connect(func(hurtbox: HurtboxComponent):
		spawner_component_destroy.spawn(position)
	)
	

	
	
func fire_lasers() -> void:
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	#scale_component.tween_scale()
