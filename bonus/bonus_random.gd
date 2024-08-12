extends Node2D

@export var DamageBonusScene: PackedScene

@export var game_stats: GameStats

@onready var spawner_component: = $SpawnerComponent as SpawnerComponent

var margin = 14
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")


# Called when the node enters the scene tree for the first time.
# Called when the node enters the scene tree for the first time.
func _ready():
	spaw_bonus(DamageBonusScene, Vector2(randf_range(margin, screen_width-margin), -16))


func spaw_bonus(bonus_scene: PackedScene, position: Vector2) -> void:
	spawner_component.scene = bonus_scene
	spawner_component.spawn(position)
