extends Node2D


@onready var enemy_two: = $EnemyTwo as Node
@onready var enemy_two2: = $EnemyTwo2 as Node

func _ready() -> void:
	var sign_ = (randi() % 2) * 2 - 1
	var velocity = randi_range(30, 40)
	enemy_two.get_node('MoveComponent').velocity.x = velocity * sign_
	enemy_two2.get_node('MoveComponent').velocity.x = velocity * sign_
