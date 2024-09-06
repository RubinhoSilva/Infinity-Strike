class_name BossTwo
extends Boss

@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var muzzle1: Marker2D = $Muzzle1
@onready var muzzle2: Marker2D = $Muzzle2
@onready var muzzle3: Marker2D = $Muzzle3
@onready var muzzle4: Marker2D = $Muzzle4
@onready var muzzle5: Marker2D = $Muzzle5
@onready var muzzle6: Marker2D = $Muzzle6
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
#@onready var laserboss_sfx = $laserboss_sfx


func _ready() -> void:
	super()
	fire_rate_timer.timeout.connect(fire_lasers)
	
	
func fire_lasers() -> void:
	spawner_component.spawn(muzzle1.global_position)
	spawner_component.spawn(muzzle2.global_position)
	spawner_component.spawn(muzzle3.global_position)
	spawner_component.spawn(muzzle4.global_position)
	spawner_component.spawn(muzzle5.global_position)
	spawner_component.spawn(muzzle6.global_position)
	#laserboss_sfx.play()
