class_name MoveComponent
extends Node

@export var actor: Node2D
@export var velocity: Vector2

var margin = 14
var left_border = 0
var right_border = ProjectSettings.get_setting("display/window/size/viewport_width")

func _process(delta: float) -> void:
	
	# Get the actor's current position
	var actor_position = actor.position

	# Move the actor based on the current velocity
	actor_position += velocity * delta

	# Update the actor's position
	actor.position = actor_position
