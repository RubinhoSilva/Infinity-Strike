extends Node2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent as FlashComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent as HitboxComponent
@onready var lasershot_sfx = $lasershot_sfx as AudioStreamPlayer
@onready var spawner_component_destroy = $SpawnerComponentDestroy as SpawnerComponent


var triggering_scene: Node = null


func _ready() -> void:
	scale_component.tween_scale()
	flash_component.flash()
	lasershot_sfx.play()
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))

	hitbox_component.hit_hurtbox.connect(func(hurtbox: HurtboxComponent):
		if hurtbox.get_parent() is Boss:
			spawner_component_destroy.spawn(position)
			#var explosion = ExplosionScene.instance()
			#add_child(explosion)
			
	)
