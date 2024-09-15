extends Node2D

@export var game_stats: GameStats

@onready var music_player: AudioStreamPlayer
@onready var ship: Node2D = $Ship
@onready var score_label: Label = $ScoreLabel
@onready var health_label: Label = $HealthLabel
@onready var damage_label: Label = $DamageLabel
@onready var new_level_label: Label = $NewLevelLabel
@onready var show_new_level_label_timer: Timer = $ShowNewLevelLabelTimer
@onready var bg_fase_1 = $bg_fase1
@onready var bg_fase_2 = $bg_fase2
@onready var bg_fase_3 = $bg_fase3
@onready var bg_fase_4 = $bg_fase4



func _ready() -> void:
	randomize()

	update_score_label(game_stats.score)
	update_health_label(ship.get_node('StatsComponent').health)
	update_damage_label(ship.get_node('StatsComponent').damage)
	
	game_stats.score_changed.connect(update_score_label)
	ship.get_node('StatsComponent').health_changed.connect(update_health_label)
	
	game_stats.level_changed.connect(on_level_changed)
	
	on_level_changed(game_stats.level)

	
	ship.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://menus/game_over.tscn")
	)

func _process(delta):
	new_level_label.visible = !show_new_level_label_timer.is_stopped()

func update_score_label(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)
	
func update_health_label(new_health: int) -> void:
	health_label.text = "Health: " + str(new_health)

func update_damage_label(new_damage: int) -> void:
	damage_label.text = "Damage: " + str(new_damage)
	
func on_level_changed(new_level: int) -> void:
	if new_level == 1:
		bg_fase_2.stop()  # Para a música da fase 2, se estiver tocando
		bg_fase_1.play()  # Inicia a música da fase 1
	elif new_level == 2:
		new_level_label.text = "Nível 1 Concluído"
		bg_fase_1.stop()  # Para a música da fase 1
		bg_fase_2.play()  # Inicia a música da fase 2
	elif new_level == 3:
		new_level_label.text = "Nível 2 Concluído"
		bg_fase_2.stop()
		bg_fase_3.play()
	elif new_level == 4:
		new_level_label.text = "Nível 3 Concluído"
		bg_fase_3.stop()
		bg_fase_4.play()
		
	if new_level != 1:
		show_new_level_label_timer.wait_time = 5
		show_new_level_label_timer.start()
