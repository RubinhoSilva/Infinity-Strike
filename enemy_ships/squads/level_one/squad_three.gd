extends Node2D


@onready var enemy_one: = $EnemyOne as Node
@onready var enemy_one2: = $EnemyOne2 as Node
@onready var enemy_one3: = $EnemyOne3 as Node

func _ready() -> void:
	var sign_ = (randi() % 2) * 2 - 1
	var velocity = randi_range(20, 30)
	enemy_one.get_node('MoveComponent').velocity.x = velocity * sign_
	enemy_one2.get_node('MoveComponent').velocity.x = velocity * sign_
	enemy_one3.get_node('MoveComponent').velocity.x = velocity * sign_
