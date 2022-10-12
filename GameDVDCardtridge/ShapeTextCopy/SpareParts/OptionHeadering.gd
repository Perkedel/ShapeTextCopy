extends HBoxContainer

export(String) var title:String = "Hello World"
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LabelTitle.text = title
	pass # Replace with function body.

func set_title(into:String)->String:
	title = into
	$LabelTitle.text = title
	return title

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
