class_name Boss
extends Node2D

@onready var stats_component: = $StatsComponent as StatsComponent
@onready var move_component: = $MoveComponent as MoveComponent
@onready var scale_component: = $ScaleComponent as ScaleComponent
@onready var flash_component: = $FlashComponent as FlashComponent
@onready var shake_component: = $ShakeComponent as ShakeComponent
@onready var hurtbox_component: = $HurtboxComponent as HurtboxComponent
@onready var hitbox_component: = $HitboxComponent as HitboxComponent
@onready var destroyed_component: = $DestroyedComponent as DestroyedComponent





func _ready() -> void:
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		scale_component.tween_scale()
		flash_component.flash()
		shake_component.tween_shake()
	)
	stats_component.no_health.connect(queue_free)

