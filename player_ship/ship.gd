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
@onready var damage_sfx = $damage_sfx as AudioStreamPlayer
@onready var damage_bonus_timer: Timer = $DamageBonusTimer


func _ready() -> void:
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		flash_component.flash()
		shake_component.tween_shake()
		damage_sfx.play() 
		#variable_pitch_audio_stream_player.play_with_variance()
	)
	
	stats_component.no_health.connect(queue_free)

func _process(delta):
	if !damage_bonus_timer.is_stopped():
		get_parent().get_node('TimerDamageLabel').text = "Bonus Time: " + str(damage_bonus_timer.time_left)
		get_parent().get_node('TimerDamageLabel').visible = true  # Mostra o Label quando o timer está ativo
	else:
		get_parent().get_node('TimerDamageLabel').visible = false  # Esconde o Label quando o timer está parado


func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			fire_lasers()

func fire_lasers() -> void:
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()


func _on_stats_component_health_changed():
	get_parent().get_node('HealthLabel').text = "Health: " + str(stats_component.health)
	
func _on_stats_component_shield_changed():
	if stats_component.shield > 0:
		get_parent().get_node('HealthLabel').text = "Health: " + str(stats_component.health) + "(+" + str(stats_component.shield) + ")"
	
func _on_stats_component_damage_changed():
	var damage = stats_component.damage
	if !damage_bonus_timer.is_stopped():
		damage *= 2
		
	get_parent().get_node('DamageLabel').text = "Damage: " + str(damage)
