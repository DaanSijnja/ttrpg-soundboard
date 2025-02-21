# Sources Used
# 1. https://www.youtube.com/watch?v=xy-ssYTQ3as&list=PLEHvj4yeNfeGiG6ZJXDymk5dYBAjCGiwe&index=6
# 2. https://www.youtube.com/watch?v=QKAuacUG0y4&list=PLEHvj4yeNfeGiG6ZJXDymk5dYBAjCGiwe&index=5
# 3. https://www.youtube.com/watch?v=32h8BR0FqdI&list=PLEHvj4yeNfeGiG6ZJXDymk5dYBAjCGiwe&index=4
#

extends Control

@export var in_time : float = 0.5
@export var fade_in_time : float = 1.5
@export var pause_time : float = 1.5
@export var fade_out_time : float = 1.5
@export var out_time : float = 0.5
@export var splash_screen_container : Node
@export var version_label : Label

var splash_screens : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	version_label.text = Global.current_version
	get_screens()
	fade()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_pressed():
		Global.app_controller.change_gui_scene("res://scenes/application.tscn")

func get_screens() -> void:
	splash_screens = splash_screen_container.get_children()
	for screen in splash_screens:
		screen.modulate.a = 0.0
		
func fade() -> void:

	for screen in splash_screens:
		var tween = self.create_tween()
		tween.tween_interval(in_time)
		tween.tween_property(screen, "modulate:a", 1.0, fade_in_time)
		tween.tween_interval(pause_time)
		tween.tween_property(screen, "modulate:a", 0.0, fade_out_time)
		tween.tween_interval(out_time)
		await tween.finished
		
	Global.app_controller.change_gui_scene("res://scenes/application.tscn")
