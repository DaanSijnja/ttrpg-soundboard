@tool
extends Button
@export var title : String = "":
	set(mod_value):
		if(title == mod_value):
			return
		
		title = mod_value
		if is_node_ready():
			_update()

@export var open : bool = false:
	set(mod_value):
		if(open == mod_value):
			return
		
		open = mod_value
		if is_node_ready():
			_show_items(open)

@export var v_box: VBoxContainer

@export_group("ChildNodes")
@onready var label : Label = $Label
@onready var texture_rect : TextureRect = $TextureRect



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update()
	pass # Replace with function body.

func _update() -> void:
	if(title != null):
		label.text = title

func _show_items(value : bool) -> void:
	texture_rect.rotation_degrees = 0 if open == false else 90
	
	if v_box == null:
		return
		
	v_box.visible = value
	

func _on_pressed() -> void:
	open = !open
	_show_items(open)
