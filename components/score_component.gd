# Give the component a class name so it can be instanced as a custom node
class_name ScoreComponent
extends Node

# Export the game stats so we can manipulate the game score
@export var game_stats: GameStats

# Export the amount the score should be adjusted
@export var adjust_amount = 5

# This is the function that we call to activate this component. By default it will
# Use the adjust_amount when called but we could optionally pass in a different amount.
func adjust_score(amount: int = adjust_amount):
	if(get_parent() is BossOne):
		#Verificando 1 a 1 pq tava dando erro de incremento
		game_stats.level = 2
		get_parent().get_parent().get_node('Ship').get_node('StatsComponent').damage = 10
		get_parent().get_parent().get_node('Ship').get_node('StatsComponent').health += 50
	elif(get_parent() is BossTwo):
		#Verificando 1 a 1 pq tava dando erro de incremento
		game_stats.level = 3
		get_parent().get_parent().get_node('Ship').get_node('StatsComponent').damage = 15
		get_parent().get_parent().get_node('Ship').get_node('StatsComponent').health += 100
	elif(get_parent() is BossThree):
		#Verificando 1 a 1 pq tava dando erro de incremento
		game_stats.level = 4
		get_parent().get_parent().get_node('Ship').get_node('StatsComponent').damage = 30
		get_parent().get_parent().get_node('Ship').get_node('StatsComponent').health += 200
	elif(get_parent() is BossFour):
		#Verificando 1 a 1 pq tava dando erro de incremento
		game_stats.level = 5
		
	game_stats.score += amount
