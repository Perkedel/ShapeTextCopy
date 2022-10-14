tool
extends "res://GameDVDCardtridge/ShapeTextCopy/SpareParts/OptioningBase.gd"

export(int) var value:int = 10 setget set_value
export(int) var defaultValue:int = 10
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
signal hasChangedNumber(newNum)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpinBox.value = value
	pass # Replace with function body.

func set_value(newNum:int)->int:
#	print(newNum)
	value = newNum
#	$SpinBox.value = value
	if value != defaultValue:
		$ResetButton.show()
	else:
		$ResetButton.hide()
	emit_signal("hasChanged")
	emit_signal("hasChangeNumber", value)
	return value

func resetToDefault()->void:
	$ResetButton.hide()
	set_value(defaultValue)
	$SpinBox.value = value

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#
#	pass

func _on_ResetButton_pressed() -> void:
	resetToDefault()
	
	pass # Replace with function body.


func _on_SpinBox_value_changed(value: float) -> void:
	set_value(value)
	pass # Replace with function body.
