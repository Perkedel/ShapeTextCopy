tool
extends "res://GameDVDCardtridge/ShapeTextCopy/SpareParts/OptioningBase.gd"

export(int) var selecton:int = 0 setget set_selecton
export(int) var defaultSelecton:int = 0
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
signal hasChangedSelection(intoThe)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$OptionButton.selected = selecton
	pass # Replace with function body.

func set_selecton(newSelect:int)->int:
	selecton = newSelect
	if defaultSelecton != selecton:
		$ResetButton.show()
	else:
		$ResetButton.hide()
	emit_signal("hasChanged")
	emit_signal("hasChangedSelection",selecton)
	return selecton

func resetToDefault():
	$ResetButton.hide()
	set_selecton(defaultSelecton)
	$OptionButton.selected = selecton
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_OptionButton_item_selected(index: int) -> void:
	set_selecton(index)
	pass # Replace with function body.

func _on_ResetButton_pressed() -> void:
	resetToDefault()
	
	pass # Replace with function body.
