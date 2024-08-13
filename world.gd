extends Node2D

@export var game_stats: GameStats

@onready var ship: Node2D = $Ship
@onready var score_label: Label = $ScoreLabel
@onready var health_label: Label = $HealthLabel
@onready var damage_label: Label = $DamageLabel
@onready var bg_fase_1 = $bg_fase1


func _ready() -> void:
	randomize()
	bg_fase_1.play()
	update_score_label(game_stats.score)
	update_health_label(ship.get_node('StatsComponent').health)
	update_damage_label(ship.get_node('StatsComponent').damage)
	
	game_stats.score_changed.connect(update_score_label)
	ship.get_node('StatsComponent').health_changed.connect(update_health_label)
	print(	ship.get_node('StatsComponent').health_changed)
	
	ship.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://menus/game_over.tscn")
	)
#
func update_score_label(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)
	
func update_health_label(new_health: int) -> void:
	health_label.text = "Health: " + str(new_health)

func update_damage_label(new_damage: int) -> void:
	damage_label.text = "Damage: " + str(new_damage)
