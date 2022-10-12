extends HBoxContainer

export(String) var labelText:String = "Option Name" setget set_labelText
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
signal hasChanged

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_labelText(newSay:String)->String:
#	print('iaaaaa')
	$Label.text = newSay
	labelText = newSay
	return labelText
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_ResetButton_pressed() -> void:
	pass # Replace with function body.
