extends Node2D

@export var SquadOneScene: PackedScene
@export var SquadTwoScene: PackedScene
@export var SquadThreeScene: PackedScene
@export var SquadFourScene: PackedScene
@export var SquadFiveScene: PackedScene
@export var SquadSixScene: PackedScene
@export var SquadSevenScene: PackedScene

@export var BossOneScene: PackedScene

@export var BonusRandomScene: PackedScene

@export var game_stats: GameStats

@onready var spawner_component: = $SpawnerComponent as SpawnerComponent
@onready var squad_one_spawn_timer: Timer = $SquadOneSpawnTimer
@onready var squad_two_spawn_timer: Timer = $SquadTwoSpawnTimer
@onready var squad_three_spawn_timer: Timer = $SquadThreeSpawnTimer
@onready var squad_four_spawn_timer: Timer = $SquadFourSpawnTimer
@onready var squad_five_spawn_timer: Timer = $SquadFiveSpawnTimer
@onready var squad_six_spawn_timer: Timer = $SquadSixSpawnTimer
@onready var squad_seven_spawn_timer: Timer = $SquadSevenSpawnTimer


var margin = 14
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")


# Called when the node enters the scene tree for the first time.
# Called when the node enters the scene tree for the first time.
func _ready():
	#pass
	squad_one_spawn_timer.timeout.connect(handle_spawn.bind(SquadOneScene, squad_one_spawn_timer, 1))
	squad_two_spawn_timer.timeout.connect(handle_spawn.bind(SquadTwoScene, squad_two_spawn_timer, 3))
	squad_three_spawn_timer.timeout.connect(handle_spawn.bind(SquadThreeScene, squad_three_spawn_timer, 5))
	
	squad_four_spawn_timer.timeout.connect(handle_spawn.bind(SquadFourScene, squad_four_spawn_timer, 3))
	squad_five_spawn_timer.timeout.connect(handle_spawn.bind(SquadFiveScene, squad_five_spawn_timer, 4))
	squad_six_spawn_timer.timeout.connect(handle_spawn.bind(SquadSixScene, squad_six_spawn_timer, 5))
	squad_seven_spawn_timer.timeout.connect(handle_spawn.bind(SquadSevenScene, squad_seven_spawn_timer, 6))
	

	game_stats.score_changed.connect(func(new_score: int):
		if game_stats.level == 1:
			if 	squad_one_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(7, 10):
					print('STARTING SQUAD 2')
					spaw_bonus(BonusRandomScene)
					squad_one_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
					squad_two_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT

			if squad_two_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(20, 25):
					print('STARTING SQUAD 3')
					spaw_bonus(BonusRandomScene)
					squad_two_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
					squad_three_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
					
			if squad_three_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(40, 50):
					print('BOSS 1')
					spaw_bonus(BonusRandomScene)
					squad_one_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
					squad_two_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
					squad_three_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
					spawn_boss(BossOneScene, Vector2(-3, 7))
				
				
		if game_stats.level == 2:
			if 	squad_four_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
			new_score >= randi_range(80, 100):
				print('STARTING SQUAD 5')
				squad_four_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				squad_five_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
				
			if 	squad_five_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(110, 130):
				print('STARTING SQUAD 6')
				spaw_bonus(BonusRandomScene)
				squad_five_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				squad_six_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT		
				
			if 	squad_six_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(140, 160):
				print('STARTING SQUAD 7')
				spaw_bonus(BonusRandomScene)
				squad_six_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				squad_seven_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT					
				
							
	)
	
	game_stats.level_changed.connect(func(new_level: int):
		if new_level == 2:
			print('BOSS 1 F')
			print('STARTING SQUAD 4 ')
			spaw_bonus(BonusRandomScene)
			spaw_bonus(BonusRandomScene)
			spaw_bonus(BonusRandomScene)
			squad_four_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
	)


func handle_spawn(enemy_scene: PackedScene, timer: Timer, time_offset: float = 1.0) -> void:
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width-margin), -16))
	var spawn_rate = time_offset / (0.5 + (game_stats.score * 0.01))
	timer.start(spawn_rate + randf_range(0.25, 0.5))
	
func spawn_boss(boss_scene: PackedScene, position: Vector2) -> void:
	spawner_component.scene = boss_scene
	spawner_component.spawn(position)
	
func spaw_bonus(bonus_scene: PackedScene) -> void:
	spawner_component.scene = bonus_scene
	spawner_component.spawn(Vector2(0, 0))
