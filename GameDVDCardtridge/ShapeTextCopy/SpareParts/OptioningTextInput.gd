tool
extends "res://GameDVDCardtridge/ShapeTextCopy/SpareParts/OptioningBase.gd"

#export(String) var labelText:String = "Option Name" setget set_labelText
export(String) var value:String = "*" setget set_value
export(String) var defaultValue:String = "*"
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
signal hasChangedText(intoSay)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ResetButton.hide()
	pass # Replace with function body.

#func set_labelText(newSay:String)->String:
##	print('iaaaaa')
#	$Label.text = newSay
#	labelText = newSay
#	return labelText
#	pass

func set_value(newSay:String)->String:
	$LineEdit.text = newSay
	value = newSay
#	if defaultValue.casecmp_to(value) != 0:
	if value != defaultValue:
		$ResetButton.show()
	else:
		$ResetButton.hide()
	emit_signal("hasChanged")
	emit_signal("hasChangedText",value)
	return value
	pass

func resetToDefault()->void:
	$ResetButton.hide()
	set_value(defaultValue)
#	value = defaultValue

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
##	if defaultValue.casecmp_to(value) != 0:
#	if value != defaultValue:
#		$ResetButton.show()
#	else:
#		$ResetButton.hide()
#	pass

func _on_ResetButton_pressed() -> void:
	resetToDefault()
	pass # Replace with function body.


func _on_LineEdit_text_changed(new_text: String) -> void:
#	value = new_text
	set_value(new_text)
	pass # Replace with function body.
