@tool
extends Control
@export var title : String = "":
	set(mod_value):
		if(title == mod_value):
			return
		
		title = mod_value
		if is_node_ready():
			_update()
			
@export var value : String = "":
	set(mod_value):
		if(value == mod_value):
			return
		
		value = mod_value
		if is_node_ready():
			_update()

@onready var title_label = $Label
@onready var value_label = $Panel/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update()
	
func _update() -> void:
	if(title != null):
		title_label.text = title
		
	if(value != null):
		value_label.text = value
