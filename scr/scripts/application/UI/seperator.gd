@tool
extends Panel

@export var title : String = "":
	set(mod_value):
		if(title == mod_value):
			return
			
		title = mod_value
		if is_node_ready():
			_update()
		
@export var texture : Texture2D = null:
	set(mod_value):
		if(texture == mod_value):
			return
		
		texture = mod_value
		if is_node_ready():
			_update()



@export_group("ChildNodes")
@onready var label : Label = $HBoxContainer/Label 
@onready var texture_rect : TextureRect = $HBoxContainer/TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update()
	
func _update() -> void:
	if(title != null):
		label.text = title
		
	if(texture != null):
		texture_rect.texture = texture
