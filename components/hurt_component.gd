# Give the component a class name so it can be instanced as a custom node
class_name HurtComponent
extends Node


# Grab the stats so we can alter the health
@export var stats_component: StatsComponent

# Grab a hurtbox so we know when we have taken a hiet
@export var hurtbox_component: HurtboxComponent

func _ready() -> void:
	# Connect the hurt signal on the hurtbox component to an anonymous function
	# that removes health equal to the damage from the hitbox
	hurtbox_component.hurt.connect(func(hitbox_component: HitboxComponent):
		#print(hitbox_component)
		if (hitbox_component.get_parent() is EnemyLaser):
			print(hitbox_component.get_parent().triggering_scene)
			print(hitbox_component.get_parent().triggering_scene.get_node('StatsComponent').damage)
			
		
		if hitbox_component.get_parent() is BonusHealth:
			stats_component.health += 20
		elif hitbox_component.get_parent() is BonusShield:
			stats_component.shield += 10
		elif hitbox_component.get_parent() is BonusDamage:
			stats_component.damage *= 2
		else:
			if stats_component.shield == 0:
				#TOMAR DANO
				stats_component.health -= stats_component.damage
			else:
				stats_component.shield -= 1
	)
