extends Node2D


@onready var enemy_four: = $EnemyFour as Node
@onready var enemy_four2: = $EnemyFour2 as Node

func _ready() -> void:
	var sign_ = (randi() % 2) * 2 - 1
	var velocity = randi_range(15, 25)
	enemy_four.get_node('MoveComponent').velocity.x = velocity * sign_
	enemy_four2.get_node('MoveComponent').velocity.x = velocity * sign_
