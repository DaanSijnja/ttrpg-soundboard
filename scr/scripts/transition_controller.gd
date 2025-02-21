# Sources Used
# 1. https://www.youtube.com/watch?v=2nv49zosKIY&list=PLEHvj4yeNfeGiG6ZJXDymk5dYBAjCGiwe&index=3
#
#

class_name SceneTransitionController extends Control

@export var background : ColorRect
@export var animation_player : AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	background.modulate.a = 0.0
	pass # Replace with function body.

func transition(animation : String, seconds : float) -> void:
	animation_player.play(animation, -1.0, 1 / seconds)
