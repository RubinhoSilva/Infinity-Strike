extends Node2D

@export var SquadOneScene: PackedScene
@export var SquadTwoScene: PackedScene
@export var SquadThreeScene: PackedScene

@export var game_stats: GameStats

@onready var spawner_component: = $SpawnerComponent as SpawnerComponent
@onready var squad_one_spawn_timer: Timer = $SquadOneSpawnTimer
@onready var squad_two_spawn_timer: Timer = $SquadTwoSpawnTimer
@onready var squad_three_spawn_timer: Timer = $SquadThreeSpawnTimer

var margin = 8
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")


# Called when the node enters the scene tree for the first time.
func _ready():
	squad_one_spawn_timer.timeout.connect(handle_spawn.bind(SquadOneScene, squad_one_spawn_timer))
	squad_two_spawn_timer.timeout.connect(handle_spawn.bind(SquadTwoScene, squad_two_spawn_timer))
	squad_three_spawn_timer.timeout.connect(handle_spawn.bind(SquadThreeScene, squad_three_spawn_timer))


func handle_spawn(enemy_scene: PackedScene, timer: Timer, time_offset: float = 1.0) -> void:
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width-margin), -16))
	var spawn_rate = time_offset / (0.5 + (game_stats.score * 0.01))
	timer.start(spawn_rate + randf_range(0.25, 0.5))
