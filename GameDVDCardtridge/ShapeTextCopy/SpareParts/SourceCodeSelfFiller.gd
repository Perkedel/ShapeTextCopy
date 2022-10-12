extends VBoxContainer

export(PoolStringArray) var sourceCodePaths:PoolStringArray = [
	'res://GameDVDCardtridge/ShapeTextCopy/ShapeTextCopy.gd',
	'res://GameDVDCardtridge/ShapeTextCopy/README.md',
	'res://GameDVDCardtridge/ShapeTextCopy/SpareParts/OptionCheckButton.gd',
	'res://GameDVDCardtridge/ShapeTextCopy/SpareParts/OptionHeadering.gd',
	'res://GameDVDCardtridge/ShapeTextCopy/SpareParts/OptioningBase.gd',
	'res://GameDVDCardtridge/ShapeTextCopy/SpareParts/OptioningDropdown.gd',
	'res://GameDVDCardtridge/ShapeTextCopy/SpareParts/OptioningNumber.gd',
	'res://GameDVDCardtridge/ShapeTextCopy/SpareParts/OptioningTextInput.gd',
	'res://GameDVDCardtridge/ShapeTextCopy/SpareParts/SourceCodeSelfFiller.gd',
]
export(int) var chosenFile:int = 0
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selfFillThisSource()
	pass # Replace with function body.

func selfFillThisSource()->void:
	$"%SourceText".bbcode_text = ""
	$"%SourceText".bbcode_text += "[code]"
	var thisFile = File.new()
	thisFile.open(sourceCodePaths[chosenFile], File.READ)
	var contente:String = thisFile.get_as_text() 
	$"%SourceText".bbcode_text += contente
	$"%SourceText".bbcode_text += "[/code]"
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_OptioningDropdown_hasChangedSelection(intoThe) -> void:
	chosenFile = intoThe
	selfFillThisSource()
	pass # Replace with function body.
