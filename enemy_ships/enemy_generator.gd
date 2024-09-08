extends Node2D

@export var SquadOneScene: PackedScene
@export var SquadTwoScene: PackedScene
@export var SquadThreeScene: PackedScene
@export var SquadFourScene: PackedScene
@export var SquadFiveScene: PackedScene
@export var SquadSixScene: PackedScene
@export var SquadSevenScene: PackedScene
@export var SquadEightScene: PackedScene
@export var SquadNineScene: PackedScene
@export var SquadTenScene: PackedScene
@export var SquadElevenScene: PackedScene
@export var SquadTwelveScene: PackedScene
@export var Squad13Scene: PackedScene
@export var Squad14Scene: PackedScene
@export var Squad15Scene: PackedScene
@export var Squad16Scene: PackedScene
@export var Squad17Scene: PackedScene

@export var BossOneScene: PackedScene
@export var BossTwoScene: PackedScene
@export var BossThreeScene: PackedScene
@export var BossFourScene: PackedScene

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
@onready var squad_eight_spawn_timer: Timer = $SquadEightSpawnTimer
@onready var squad_nine_spawn_timer: Timer = $SquadNineSpawnTimer
@onready var squad_ten_spawn_timer: Timer = $SquadTenSpawnTimer
@onready var squad_eleven_spawn_timer: Timer = $SquadElevenSpawnTimer
@onready var squad_twelve_spawn_timer: Timer = $SquadTwelveSpawnTimer
@onready var squad_13_spawn_timer: Timer = $Squad13SpawnTimer
@onready var squad_14_spawn_timer: Timer = $Squad14SpawnTimer
@onready var squad_15_spawn_timer: Timer = $Squad15SpawnTimer
@onready var squad_16_spawn_timer: Timer = $Squad16SpawnTimer
@onready var squad_17_spawn_timer: Timer = $Squad17SpawnTimer



var margin = 30
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

	#Daqui para baixo eles são muito grande, se gera aleatorio o eixo acaba saindo no canto e ficando estranho
	#30, -30 solta sempre no meio la em cima
	#O tempo que vai sair uma squad é definido no timer
	squad_eight_spawn_timer.timeout.connect(spawn_fixed.bind(SquadEightScene, Vector2(30, -30)))
	squad_nine_spawn_timer.timeout.connect(spawn_fixed.bind(SquadNineScene, Vector2(30, -30)))
	squad_ten_spawn_timer.timeout.connect(spawn_fixed.bind(SquadTenScene, Vector2(30, -30)))
	squad_eleven_spawn_timer.timeout.connect(spawn_fixed.bind(SquadElevenScene, Vector2(0, -60)))
	squad_twelve_spawn_timer.timeout.connect(spawn_fixed.bind(SquadTwelveScene, Vector2(0, -90)))
	
	squad_13_spawn_timer.timeout.connect(spawn_fixed.bind(Squad13Scene, Vector2(80, -20)))
	squad_14_spawn_timer.timeout.connect(spawn_fixed.bind(Squad14Scene, Vector2(75, -25)))
	squad_15_spawn_timer.timeout.connect(spawn_fixed.bind(Squad15Scene, Vector2(75, -30)))
	squad_16_spawn_timer.timeout.connect(spawn_fixed.bind(Squad16Scene, Vector2(75, -15)))
	squad_17_spawn_timer.timeout.connect(spawn_fixed.bind(Squad17Scene, Vector2(80, -25)))
	

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
					clear_enemies(get_parent())
					spaw_bonus(BonusRandomScene)
					squad_one_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
					squad_two_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
					squad_three_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
					spawn_fixed(BossOneScene, Vector2(90, 45))
				
				
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
				
			if 	squad_seven_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(180, 210):
				print('BOSS 2')
				clear_enemies(get_parent())
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				squad_seven_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				spawn_fixed(BossTwoScene, Vector2(90, 30))		
				
						
		if game_stats.level == 3:
			if 	squad_eight_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(250, 300):
				print('STARTING SQUAD 9')
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				squad_eight_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				squad_nine_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
				
			if 	squad_nine_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(350, 400):
				print('STARTING SQUAD 10')
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				squad_nine_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				squad_ten_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT		
				
			if 	squad_ten_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(400, 450):
				print('STARTING SQUAD 11')
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				squad_ten_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				squad_eleven_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT		
				
			if 	squad_eleven_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(500, 600):
				print('BOSS 3')
				clear_enemies(get_parent())
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				squad_eleven_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				spawn_fixed(BossThreeScene, Vector2(90, 45))					
	
		
		if game_stats.level == 4:
			if 	squad_13_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(600, 750):
				print('STARTING SQUAD 14')
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				squad_13_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				squad_14_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
				
			if 	squad_14_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(800, 900):
				print('STARTING SQUAD 15')
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				squad_14_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				squad_15_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
				
			if 	squad_15_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(950, 1050):
				print('STARTING SQUAD 16')
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				squad_15_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				squad_16_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
				
			if 	squad_16_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(1100, 1200):
				print('STARTING SQUAD 17')
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				squad_16_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				squad_17_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
				
			if 	squad_17_spawn_timer.process_mode == Node.PROCESS_MODE_INHERIT and \
				new_score >= randi_range(1300, 1500):
				print('BOSS 4')
				clear_enemies(get_parent())
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				spaw_bonus(BonusRandomScene)
				squad_17_spawn_timer.process_mode = Node.PROCESS_MODE_DISABLED
				spawn_fixed(BossFourScene, Vector2(95, 60))		
	)
	
	game_stats.level_changed.connect(func(new_level: int):
		if new_level == 2:
			print('BOSS 1 F')
			print('STARTING SQUAD 4 ')
			spaw_bonus(BonusRandomScene)
			spaw_bonus(BonusRandomScene)
			spaw_bonus(BonusRandomScene)
			squad_four_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
		elif new_level == 3:
			print('BOSS 2 F')
			print('STARTING SQUAD 8')
			spaw_bonus(BonusRandomScene)
			spaw_bonus(BonusRandomScene)
			spaw_bonus(BonusRandomScene)
			squad_eight_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
		elif new_level == 4:
			print('BOSS 3 F')
			print('STARTING SQUAD 13')
			spaw_bonus(BonusRandomScene)
			spaw_bonus(BonusRandomScene)
			spaw_bonus(BonusRandomScene)
			squad_13_spawn_timer.process_mode = Node.PROCESS_MODE_INHERIT
		elif new_level == 5:
			print('BOSS 4 F')
			
			await get_tree().create_timer(1.0).timeout
			get_tree().change_scene_to_file("res://menus/game_sucess.tscn")
	)


func handle_spawn(enemy_scene: PackedScene, timer: Timer, time_offset: float = 1.0) -> void:
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width-margin), -16))
	var spawn_rate = time_offset / (0.5 + (game_stats.score * 0.01))
	timer.start(spawn_rate + randf_range(0.25, 0.5))
	
func spawn_fixed(boss_scene: PackedScene, position: Vector2) -> void:
	spawner_component.scene = boss_scene
	spawner_component.spawn(position)
	
func spaw_bonus(bonus_scene: PackedScene) -> void:
	spawner_component.scene = bonus_scene
	spawner_component.spawn(Vector2(0, 0))


func clear_enemies(node):
	# Itera sobre todos os filhos do nó atual
	for child in node.get_children():
		# Se o nó for do tipo Enemy, remove-o
		if child is Enemy:
			node.remove_child(child)
			child.queue_free()
		# Se o nó tiver filhos, chama a função recursivamente
		else:
			clear_enemies(child)
