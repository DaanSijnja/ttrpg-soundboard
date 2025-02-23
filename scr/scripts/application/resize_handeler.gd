# Sources Used 
# 1. https://www.youtube.com/watch?v=naJ6hz6onTc&list=PLQsiR7DILTczMLsN8qmMym7pYfJXynzK0&index=15
# 

extends Control

enum ResizeDirection {
	TOP,
	BOTTOM,
	LEFT,
	RIGHT,
	TOP_LEFT,
	TOP_RIGHT,
	BOTTOM_LEFT,
	BOTTOM_RIGHT
}

@export var resize_direction : ResizeDirection
@export var hide_in_runtime : bool = true

var _following : bool = false

var _mouse_offset : Vector2i = Vector2i()
var _window_position : Vector2i = Vector2i()
var _window_size : Vector2i = Vector2i()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if resize_direction == ResizeDirection.TOP or resize_direction == ResizeDirection.BOTTOM:
		mouse_default_cursor_shape = CursorShape.CURSOR_VSIZE
			
	elif	 resize_direction == ResizeDirection.LEFT or resize_direction == ResizeDirection.RIGHT:
		mouse_default_cursor_shape = CursorShape.CURSOR_HSIZE
		
	elif	 resize_direction == ResizeDirection.TOP_LEFT or resize_direction == ResizeDirection.BOTTOM_RIGHT:
		mouse_default_cursor_shape = CursorShape.CURSOR_FDIAGSIZE
		
	elif	 resize_direction == ResizeDirection.TOP_RIGHT or resize_direction == ResizeDirection.BOTTOM_LEFT:
		mouse_default_cursor_shape = CursorShape.CURSOR_BDIAGSIZE
	
	if hide_in_runtime:
		get_child(0).set_visible(false)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _resize_window():
	if _following:
		
		var new_size : Vector2 = DisplayServer.window_get_size()
		var new_pos  : Vector2 = DisplayServer.window_get_position()
		
		if resize_direction == ResizeDirection.TOP or resize_direction == ResizeDirection.TOP_LEFT or resize_direction == ResizeDirection.TOP_RIGHT:
			new_pos.y = new_pos.y + get_global_mouse_position().y + _mouse_offset.y
			new_size.y = _window_size.y + (_window_position.y - new_pos.y)
			
		elif resize_direction == ResizeDirection.BOTTOM or resize_direction == ResizeDirection.BOTTOM_LEFT or resize_direction == ResizeDirection.BOTTOM_RIGHT:
			new_size.y = get_global_mouse_position().y + _mouse_offset.y
			
		if resize_direction == ResizeDirection.LEFT or resize_direction == ResizeDirection.TOP_LEFT or resize_direction == ResizeDirection.BOTTOM_LEFT:
			new_pos.x = new_pos.x + get_global_mouse_position().x - _mouse_offset.x
			new_size.x = _window_size.x + (_window_position.x - new_pos.x)
			
		elif resize_direction == ResizeDirection.RIGHT or resize_direction == ResizeDirection.BOTTOM_RIGHT or resize_direction == ResizeDirection.TOP_RIGHT:
			new_size.x = get_global_mouse_position().x + _mouse_offset.x
	
		

		DisplayServer.window_set_size(new_size)
		DisplayServer.window_set_position(new_pos)
		

func _on_gui_input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		_resize_window()
	
	if event is InputEventMouseButton:
		var mouse = (event as InputEventMouseButton)
		if mouse.button_index == MOUSE_BUTTON_LEFT:
			_mouse_offset = get_local_mouse_position()
			_window_position = DisplayServer.window_get_position()
			_window_size = DisplayServer.window_get_size()
			
			if mouse.pressed:
				_following = true
			else:
				_following = false
	
