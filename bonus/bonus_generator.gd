extends Node2D


@export var BonusDamageScene: PackedScene

@export var game_stats: GameStats

@onready var spawner_component: = $SpawnerComponent as SpawnerComponent
@onready var timer: Timer = $TesteTimer

var margin = 14
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")


func _ready():
	timer.timeout.connect(handle_spawn.bind(BonusDamageScene, timer))
	
	
	
func handle_spawn(enemy_scene: PackedScene, timer: Timer, time_offset: float = 1.0) -> void:
	print('bonus')
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(randf_range(margin, screen_width-margin), -16))
	var spawn_rate = time_offset / (0.5 + (game_stats.score * 0.01))
	timer.start(spawn_rate + randf_range(0.25, 0.5))
