@tool
extends Control

@export var title : String = "":
	set(mod_value):
		if(title == mod_value):
			return
		
		title = mod_value
		if is_node_ready():
			_update()

@export var default_text : String = "":
	set(mod_value):
		if(default_text == mod_value):
			return
		
		default_text = mod_value
		if is_node_ready():
			_update()

@export var editable : bool = true:
	set(mod_value):
		if(editable == mod_value):
			return
		
		editable = mod_value
		if is_node_ready():
			_update()
			
@onready var label : Label = $Label
@onready var line_edit : LineEdit = $LineEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update()

func _update() -> void:
	if(title != null):
		label.text = title
	if(default_text != null):
		line_edit.text = default_text
		
	line_edit.editable = editable
	
