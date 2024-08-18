extends Control
@onready var bg_menu = $bg_menu

func _ready() -> void:
	bg_menu.play()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://world.tscn")
