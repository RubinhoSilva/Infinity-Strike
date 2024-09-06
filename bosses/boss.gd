class_name Boss
extends Node2D

@onready var stats_component: = $StatsComponent as StatsComponent
@onready var move_component: = $MoveComponent as MoveComponent
@onready var hurtbox_component: = $HurtboxComponent as HurtboxComponent
@onready var hitbox_component: = $HitboxComponent as HitboxComponent
@onready var destroyed_component: = $DestroyedComponent as DestroyedComponent
@onready var score_component: = $ScoreComponent as ScoreComponent


func _ready() -> void:
	stats_component.no_health.connect(func():
		score_component.adjust_score()
	)
	
	stats_component.no_health.connect(queue_free)
