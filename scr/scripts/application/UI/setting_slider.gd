@tool
extends Control

var current_value : float = 0

@onready var title_label : Label = $Label
@onready var spin_box : SpinBox = $Panel/SpinBox
@onready var slider : Slider = $Panel/HSlider

@export var title : String = "":
	set(mod_value):
		if(title == mod_value):
			return
		
		title = mod_value
		if is_node_ready():
			_update()

@export_group("Value Settings")
@export var start_value : float = 0

@export var min_value : float = 0:
	set(mod_value):
		if(min_value == mod_value):
			return
		
		min_value = mod_value
		if is_node_ready():
			_update()
			
@export var max_value : float = 0:
	set(mod_value):
		if(max_value == mod_value):
			return
		
		max_value = mod_value
		if is_node_ready():
			_update()

@export var suffix : String = "":
	set(mod_value):
		if(suffix == mod_value):
			return
		
		suffix = mod_value
		if is_node_ready():
			_update()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_value = start_value
	_update()

	pass

func _update():
	
	title_label.text = title
	
	slider.value = start_value
	spin_box.value = start_value
	
	slider.min_value = min_value
	spin_box.min_value = min_value
	
	slider.max_value = max_value
	spin_box.max_value = max_value
	
	spin_box.suffix = suffix
	
func _on_spin_box_value_changed(value: float) -> void:
	if(value == current_value):
		return
	
	current_value = value
	slider.value = value
	

func _on_h_slider_value_changed(value: float) -> void:
	if(value == current_value):
		return
			
	current_value = value
	spin_box.value = value
		
