# Give the component a class name so it can be instanced as a custom node
class_name StatsComponent
extends Node

# Create the health variable and connect a setter
@export var health: int = 1:
	set(value):
		health = value
		
		# Signal out that the health has changed
		health_changed.emit()
		
		# Signal out when health is at 0
		if health <= 0: no_health.emit()

# Create our signals for health
signal health_changed() # Emit when the health value has changed
signal no_health() # Emit when there is no health left


@export var damage: float = 2.5:
	set(value):
		damage = value
		
		damage_changed.emit()
	
signal damage_changed()


@export var speed: int = 100
@export var shield: int = 0:
	set(value):
		shield = value
		
		shield_changed.emit()
	
signal shield_changed()
