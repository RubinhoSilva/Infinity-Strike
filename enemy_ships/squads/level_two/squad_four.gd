extends Node2D


@onready var enemy_one: = $EnemyOne as Node
@onready var enemy_two: = $EnemyTwo as Node

func _ready() -> void:
	enemy_one.get_node('MoveComponent').velocity.y = enemy_two.get_node('MoveComponent').velocity.y
