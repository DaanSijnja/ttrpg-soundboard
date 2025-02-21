# Sources used:
# 1. https://www.youtube.com/watch?v=32h8BR0FqdI&list=PLEHvj4yeNfeGiG6ZJXDymk5dYBAjCGiwe&index=4
# 2. https://www.youtube.com/watch?v=2nv49zosKIY&list=PLEHvj4yeNfeGiG6ZJXDymk5dYBAjCGiwe&index=3

class_name AppController extends Node

@export var gui : Control

@export var transition_controller : SceneTransitionController

var current_gui_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.app_controller = self
	current_gui_scene = $GUI/SplashScreenManager

func change_gui_scene(
	new_scene : String, 
	delete : bool = true, 
	keep_running : bool = false,
	transition : bool = true,
	transition_in : String = "Fade In",
	transition_out : String = "Fade Out",
	seconds : float = 0.25
) -> void:
	
	if transition:
		transition_controller.transition(transition_out, seconds)
		await transition_controller.animation_player.animation_finished
		
	if current_gui_scene != null:
		if delete:
			current_gui_scene.queue_free()
			
		elif keep_running:
			current_gui_scene.visible = false
			
		else:
			gui.remove_child(current_gui_scene)
			
	var new = load(new_scene).instantiate()
	gui.add_child(new)
	current_gui_scene = new
	
	transition_controller.transition(transition_in, seconds)
