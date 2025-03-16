extends Control

@onready var file_name_label : Label = $Panel/Label

var file_location : String
var file_name : String = "":
	set(mod_value):
		if(file_name == mod_value):
			return
			
		file_name = mod_value
		if is_node_ready():
			file_name_label.text = file_name

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	var dialog = FileDialog.new()
	dialog.set_file_mode(FileDialog.FILE_MODE_OPEN_FILE)
	dialog.set_access(FileDialog.ACCESS_FILESYSTEM)
	dialog.add_filter("*.mp3","MP3")
	dialog.set_use_native_dialog(true) 
	dialog.connect("file_selected", _on_file_selected)
	add_child(dialog)
	dialog.popup_centered_ratio()
	
func _on_file_selected(path):
	print(path)
	file_location = path
	file_name = file_location.get_file()
	print(file_name)
