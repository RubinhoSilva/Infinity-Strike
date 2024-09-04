extends Node2D

@onready var enemy_three: = $EnemyThree as Node
@onready var enemy_three2: = $EnemyThree2 as Node
@onready var enemy_three3: = $EnemyThree3 as Node


func _ready() -> void:
	var sign_ = (randi() % 2) * 2 - 1
	var velocity = randi_range(10, 15)
		
	if enemy_three:
		enemy_three.get_node('MoveComponent').velocity.x = velocity * sign_
		enemy_three.get_node('MoveComponent').velocity.y = velocity
		
	if enemy_three2:
		enemy_three2.get_node('MoveComponent').velocity.x = velocity * sign_
		enemy_three2.get_node('MoveComponent').velocity.y = velocity
		
			
	if enemy_three3:
		enemy_three3.get_node('MoveComponent').velocity.x = velocity * sign_
		enemy_three3.get_node('MoveComponent').velocity.y = velocity
