extends CheckButton

export(bool) var defaultStatus = false
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func resetToDefault():
	pressed = defaultStatus

func _on_OptionCheckButton_toggled(button_pressed: bool) -> void:
	if button_pressed:
		pass
	else:
		pass
	pass # Replace with function body.
