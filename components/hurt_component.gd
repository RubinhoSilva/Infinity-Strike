# Give the component a class name so it can be instanced as a custom node
class_name HurtComponent
extends Node


# Grab the stats so we can alter the health
@export var stats_component: StatsComponent

# Grab a hurtbox so we know when we have taken a hiet
@export var hurtbox_component: HurtboxComponent

func _ready() -> void:
	var damage = 5
		
	# Connect the hurt signal on the hurtbox component to an anonymous function
	# that removes health equal to the damage from the hitbox
	hurtbox_component.hurt.connect(func(hitbox_component: HitboxComponent):
		
		# Verifica se o hitbox_component e seu pai são válidos
		if is_instance_valid(hitbox_component) and is_instance_valid(hitbox_component.get_parent()):
			var parent = hitbox_component.get_parent()
			
			# Tenta acessar triggering_scene
			if "triggering_scene" in parent:
				var triggering_scene = parent.triggering_scene
				
				# Verifica se a triggering_scene é válida e se possui o nó 'StatsComponent'
				if is_instance_valid(triggering_scene):
					var stats_component_dar_dano = triggering_scene.get_node_or_null('StatsComponent')
					
					# Se o 'StatsComponent' existir, obtém o valor de 'damage'
					if stats_component:
						damage = stats_component_dar_dano.damage
						
						var bonus_damage_timer = stats_component_dar_dano.get_parent().get_node('DamageBonusTimer')
						if bonus_damage_timer:
							if !bonus_damage_timer.is_stopped():
								print('DAMAGE BONUS ON')
								damage *= 2
						

			
		
		#print(hitbox_component.get_parent().get_node('DamageBonusTimer'))
		if hitbox_component.get_parent() is BonusHealth:
			var health = 15.0 * hitbox_component.get_parent().get_parent().game_stats.level
			
			stats_component.health += health
		elif hitbox_component.get_parent() is BonusShield:
			var shield = 5 * hitbox_component.get_parent().get_parent().game_stats.level
			
			stats_component.shield += shield
		elif hitbox_component.get_parent() is BonusDamage:
			var time = 10.0 * hitbox_component.get_parent().get_parent().game_stats.level
			
			if !stats_component.get_parent().get_node('DamageBonusTimer').is_stopped():
				stats_component.get_parent().get_node('DamageBonusTimer').wait_time += stats_component.get_parent().get_node('DamageBonusTimer').time_left + time
			else:
				stats_component.get_parent().get_node('DamageBonusTimer').wait_time = time
				stats_component.get_parent().get_node('DamageBonusTimer').start()
		else:
			if stats_component.shield == 0:
				#TOMAR DANO
				stats_component.health -= damage
			else:
				stats_component.shield -= 1
	)
