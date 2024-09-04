extends Node2D

@onready var enemy_one: = $EnemyOne as Node
@onready var enemy_two: = $EnemyTwo as Node
@onready var enemy_three: = $EnemyThree as Node

func _ready() -> void:
	var sign_ = (randi() % 2) * 2 - 1
	var velocity = randi_range(10, 15)
	
	if enemy_one:
		enemy_one.get_node('MoveComponent').velocity.x = velocity * sign_
		enemy_one.get_node('MoveComponent').velocity.y = velocity
		
	if enemy_two:
		enemy_two.get_node('MoveComponent').velocity.x = velocity * sign_
		enemy_two.get_node('MoveComponent').velocity.y = velocity
		
			
	if enemy_three:
		enemy_three.get_node('MoveComponent').velocity.x = velocity * sign_
		enemy_three.get_node('MoveComponent').velocity.y = velocity
