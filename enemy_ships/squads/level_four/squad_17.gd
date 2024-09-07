extends Node2D

@onready var enemy_one: = $EnemyOne as Node
@onready var enemy_two: = $EnemyTwo as Node
@onready var enemy_two2: = $EnemyTwo2 as Node
@onready var enemy_two3: = $EnemyTwo3 as Node
@onready var enemy_two4: = $EnemyTwo4 as Node
@onready var enemy_two5: = $EnemyTwo5 as Node
@onready var enemy_three: = $EnemyThree as Node
@onready var enemy_three2: = $EnemyThree2 as Node
@onready var enemy_four: = $EnemyFour as Node
@onready var enemy_four2: = $EnemyFour2 as Node
@onready var enemy_four3: = $EnemyFour3 as Node
@onready var enemy_four4: = $EnemyFour4 as Node



func _ready() -> void:
	var velocity = randi_range(15, 25)
	enemy_one.get_node('MoveComponent').velocity.y = velocity
	enemy_two.get_node('MoveComponent').velocity.y = velocity
	enemy_two2.get_node('MoveComponent').velocity.y = velocity
	enemy_two3.get_node('MoveComponent').velocity.y = velocity
	enemy_two4.get_node('MoveComponent').velocity.y = velocity
	enemy_two5.get_node('MoveComponent').velocity.y = velocity
	enemy_three.get_node('MoveComponent').velocity.y = velocity
	enemy_three2.get_node('MoveComponent').velocity.y = velocity
	enemy_four.get_node('MoveComponent').velocity.y = velocity
	enemy_four2.get_node('MoveComponent').velocity.y = velocity
	enemy_four3.get_node('MoveComponent').velocity.y = velocity
	enemy_four4.get_node('MoveComponent').velocity.y = velocity
	
