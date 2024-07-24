class_name Bonus
extends Node2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var scale_component: = $ScaleComponent as ScaleComponent
@onready var flash_component: = $FlashComponent as FlashComponent
@onready var shake_component: = $ShakeComponent as ShakeComponent
#@onready var hitbox_component: = $HitboxComponent as HitboxComponent
@onready var variable_pitch_audio_stream_player: = $VariablePitchAudioStreamPlayer as VariablePitchAudioStreamPlayer

func _ready() -> void:
	
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	
	#hitbox_component.hit_hurtbox.connect(func(hitbox: HitboxComponent):
		#print('aaaa')	
	#)
	#hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		#scale_component.tween_scale()
		#flash_component.flash()
		#shake_component.tween_shake()
		#variable_pitch_audio_stream_player.play_with_variance()
	#)
 
	#hitbox_component.hit_hurtbox.connect(destroyed_component.destroy.unbind(1))
