class_name GameStats

extends Resource

@export var score: int = 0 :
	set(value):
		score = value
		score_changed.emit(score)
		
@export var level: int = 1 :
	set(value):
		level = value
		level_changed.emit(level)

@export var highscore: int = 0

signal score_changed(new_score)
signal level_changed(new_level)
