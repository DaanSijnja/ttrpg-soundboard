# Sources Used
# 1. https://www.youtube.com/watch?v=alKdkRJy-iY&list=PLQsiR7DILTczMLsN8qmMym7pYfJXynzK0&index=6
# => see comments for usefull tips
# 2. https://www.youtube.com/watch?v=fq0CVr1GBus&list=PLQsiR7DILTczMLsN8qmMym7pYfJXynzK0&index=7
#

extends Control

var _following : bool = false
var _drag_offset : Vector2 = Vector2()

func _process(delta: float) -> void:
	pass

func _move_application_window() -> void:
	if(_following):
		var real_p = DisplayServer.window_get_position() + Vector2i(get_global_mouse_position()) - Vector2i(_drag_offset)
		DisplayServer.window_set_position(real_p)

func _on_gui_input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		_move_application_window()
	
	if event is InputEventMouseButton:
		var mouse = (event as InputEventMouseButton)
		
		if mouse.button_index == MOUSE_BUTTON_LEFT and mouse.double_click: 
			_following = false
			if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_MAXIMIZED:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				$WindowButtons/Maximize.icon = load("res://assets/sprites/application/titlebar/maximize_window.png")
				
			elif  DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
				$WindowButtons/Maximize.icon = load("res://assets/sprites/application/titlebar/restore_window.png")
		else:	
			if mouse.pressed:
				_following = true
				_drag_offset = get_local_mouse_position()
			else:
				_following = false

func _on_minimize_pressed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MINIMIZED)

func _on_close_pressed() -> void:
	## add some saving or warning (later in version v1.0 or later)
	get_tree().quit()
	
func _on_maximize_pressed() -> void:
	
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_MAXIMIZED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$WindowButtons/Maximize.icon = load("res://assets/sprites/application/titlebar/maximize_window.png")
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
		$WindowButtons/Maximize.icon = load("res://assets/sprites/application/titlebar/restore_window.png")
		
