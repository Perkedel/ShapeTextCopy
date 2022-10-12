extends Node

export(String) var character:String = "*"
export(Vector2) var size:Vector2 = Vector2(20,10)
export(PoolIntArray) var sizeInt:PoolIntArray = [20,10]
export(int,'Square', 'Triangle') var chooseShape = 0
enum shapes {Square, Triangle}
var toFillBB="[code]" + "***\n****" + "[/code]"
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	refreshLook()
	pass # Replace with function body.

func refreshLook():
	clearFillBB()
	match(chooseShape):
		0:
			fillSquare()
		_:
			fillSquare()
			pass
		
	
	$"%TextToCopy".bbcode_text = toFillBB
	pass

func clearFillBB()->void:
	toFillBB = ''
	$"%TextToCopy".bbcode_text = toFillBB

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func fillSquare():
	toFillBB += "[code]"
	
	# https://generalistprogrammer.com/godot/godot-for-loop-tutorial-definitive-guide-with-examples/
	for n in sizeInt[1]:
		for m in sizeInt[0]:
			toFillBB += character
			pass
		toFillBB +='\n'
		pass
	
	toFillBB += "[/code]"
	pass


func _on_SingleCharOption_hasChangedText(intoSay:String) -> void:
	character = intoSay
	refreshLook()
	pass # Replace with function body.


func _on_HeightOption_hasChangedNumber(newNum:int) -> void:
#	print(newNum)
	size.y = newNum
	sizeInt[1] = newNum
	refreshLook()
	pass # Replace with function body.


func _on_ShapeOption_hasChangedSelection(intoThe:int) -> void:
	chooseShape = intoThe
	refreshLook()
	pass # Replace with function body.


func _on_WidthOption_hasChangedNumber(newNum:int) -> void:
	size.x = newNum
	sizeInt[0] = newNum
	refreshLook()
	pass # Replace with function body.

# somehow not working!!!
func _on_HeightOption_hasChanged() -> void:
	size.y = $"%HeightOption".value
	sizeInt[1] = $"%HeightOption".value
	refreshLook()
	pass # Replace with function body.


func _on_WidthOption_hasChanged() -> void:
	size.x = $"%WidthOption".value
	sizeInt[0] = $"%WidthOption".value
	refreshLook()
	pass # Replace with function body.
