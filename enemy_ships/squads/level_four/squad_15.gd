extends Node2D


@onready var enemy_four: = $EnemyFour as Node
@onready var enemy_four2: = $EnemyFour2 as Node
@onready var enemy_two: = $EnemyTwo as Node
@onready var enemy_three: = $EnemyThree as Node

func _ready() -> void:
	var velocity = randi_range(15, 25)
	enemy_four.get_node('MoveComponent').velocity.y = velocity
	
	enemy_four2.get_node('MoveComponent').velocity.y = velocity
	
	enemy_three.get_node('MoveComponent').velocity.y = velocity
	
	enemy_two.get_node('MoveComponent').velocity.y = velocity
