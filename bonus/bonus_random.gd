extends Node2D

@export var DamageBonusScene: PackedScene
@export var HealthBonusScene: PackedScene
@export var ShieldBonusScene: PackedScene

@export var game_stats: GameStats

@onready var spawner_component: = $SpawnerComponent as SpawnerComponent

var margin = 14
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")


# Called when the node enters the scene tree for the first time.
# Called when the node enters the scene tree for the first time.
func _ready():
	var number_rand = randi() % 3 + 1

	#if (number_rand == 1):
		#spaw_bonus(DamageBonusScene, Vector2(randf_range(margin, screen_width-margin), -16))
	#elif (number_rand == 2):
		#spaw_bonus(HealthBonusScene, Vector2(randf_range(margin, screen_width-margin), -16))
	#else:
		#spaw_bonus(ShieldBonusScene, Vector2(randf_range(margin, screen_width-margin), -16))


func spaw_bonus(bonus_scene: PackedScene, position: Vector2) -> void:
	spawner_component.scene = bonus_scene
	spawner_component.spawn(position)
