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
#	selfFillThisSource()
	pass # Replace with function body.

func refreshLook():
	clearFillBB()
	toFillBB += "[code]"
	match(chooseShape):
		0:
			fillSquare()
		1:
			fillTriangle()
		2:
			pass
		3:
			fillBottomLeftCorner()
			pass
		4:
			pass
		5:
			fillTopLeftCorner()
			pass
		8:
			fillX()
		9:
			fillHelix()
		_:
			fillSquare()
			pass
	toFillBB += "[/code]"
	
	$"%TextToCopy".bbcode_text = toFillBB
	pass

func clearFillBB()->void:
	toFillBB = ''
	$"%TextToCopy".bbcode_text = toFillBB

func resetAllToDefault():
	$"%SingleCharOption".resetToDefault()
	$"%WidthOption".resetToDefault()
	$"%HeightOption".resetToDefault()
	$"%ShapeOption".resetToDefault()
	pass

func selfFillThisSource()->void:
#	$"%SourceText".bbcode_text = ""
#	$"%SourceText".bbcode_text += "[code]"
#	var thisFile = File.new()
#	thisFile.open("res://GameDVDCardtridge/ShapeTextCopy/ShapeTextCopy.gd", File.READ)
#	var contente:String = thisFile.get_as_text() 
#	$"%SourceText".bbcode_text += contente
#	$"%SourceText".bbcode_text += "[/code]"
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

"""
SHAPE FILLERS
"""

func fillSquare():
	# https://generalistprogrammer.com/godot/godot-for-loop-tutorial-definitive-guide-with-examples/
	for n in sizeInt[1]:
		for m in sizeInt[0]:
			toFillBB += character
			pass
		toFillBB +='\n'
		pass
	
	
	pass

func fillTriangle():
	pass

func fillBottomLeftCorner():
	# https://www.programiz.com/cpp-programming/examples/pyramid-pattern
	"""
	#include <iostream>
	using namespace std;

	int main()
	{
		int rows;

		cout << "Enter number of rows: ";
		cin >> rows;

		for(int i = 1; i <= rows; ++i)
		{
			for(int j = 1; j <= i; ++j)
			{
				cout << "* ";
			}
			cout << "\n";
		}
		return 0;
	}
	"""
	# & alternates, 
	# 1 
	# 1 2
	# 1 2 3
	"""
	#include <iostream>
	using namespace std;

	int main()
	{
		int rows;

		cout << "Enter number of rows: ";
		cin >> rows;

		for(int i = 1; i <= rows; ++i)
		{
			for(int j = 1; j <= i; ++j)
			{
				cout << j << " ";
			}
			cout << "\n";
		}
		return 0;
	}
	"""
	# MOAR
	# A
	# B B
	# C C C
	# D D D D
	"""
	#include <iostream>
	using namespace std;

	int main()
	{
		char input, alphabet = 'A';

		cout << "Enter the uppercase character you want to print in the last row: ";
		cin >> input;

		for(int i = 1; i <= (input-'A'+1); ++i)
		{
			for(int j = 1; j <= i; ++j)
			{
				cout << alphabet << " ";
			}
			++alphabet;

			cout << endl;
		}
		return 0;
	}
	"""
	# rows use sizeInt[1]
	
	for i in sizeInt[1]:
		for j in i:
			toFillBB += character
			pass
		toFillBB += "\n"
		pass
	
	pass

func fillTopLeftCorner():
	# https://www.programiz.com/cpp-programming/examples/pyramid-pattern
	"""
	#include <iostream>
	using namespace std;

	int main()
	{
		int rows;

		cout << "Enter number of rows: ";
		cin >> rows;

		for(int i = rows; i >= 1; --i)
		{
			for(int j = 1; j <= i; ++j)
			{
				cout << "* ";
			}
			cout << endl;
		}
		
		return 0;
	}
	"""
	# 1 2 3 4 5
	# 1 2 3 4
	# 1 2 3
	# 1 2
	# 1
	"""
	#include <iostream>
	using namespace std;

	int main()
	{
		int rows;

		cout << "Enter number of rows: ";
		cin >> rows;

		for(int i = rows; i >= 1; --i)
		{
			for(int j = 1; j <= i; ++j)
			{
				cout << j << " ";
			}
			cout << endl;
		}

		return 0;
	}
	"""
	# rows use sizeInt[1]
	var flipCount:int = sizeInt[1] # not sizeInt[0]
	for i in sizeInt[1]:
		for j in flipCount:
			toFillBB += character
			pass
		toFillBB += "\n"
		flipCount -= 1
		pass
	pass

func fillX():
	# https://stackoverflow.com/a/48466313/9079640
	"""
	int main()
	{
		int x_size = 7;        // size of the drawing
		int asterisk_pos = 0;  // initial position of the asterisk
		int inc = 1;           // amount of increment added to asterisk_pos after an entire line has been printed

		// height is the line number
		for (int height = 0; height < x_size; height++)
		{
			// width is the column position of the character that needs to be printed for a given line
			for (int width = 0; width < x_size; width++)
			{
				int end_pos = (x_size - width) - 1; // the position of the 2nd asterisk on the line

				if (asterisk_pos == width || asterisk_pos == end_pos)
					cout << "*";
				else
					cout << " ";
			}

			// print a new line character
			cout << std::endl;

			/* when the middle of x_size is reached, 
			 * it's time to decrease the position of the asterisk!
			 */
			asterisk_pos += inc;    
			if (asterisk_pos > (x_size/2)-1)
				inc *= -1;
		}    

		return 0;
	}
	"""
	# x_size use sizeInt[1]
	var asterisk_pos:int = 0 # initial position of the asterisk
	var inc = 1 # amount of increment added to asterisk_pos
	# after an entire line has been printed
	
	# height is the line number
	for n in sizeInt[1]:
		# width is the column position of the character that needs to be printed for a given line
		for m in sizeInt[1]:
			var end_pos:int = (sizeInt[1] - m) - 1 # the position of the 2nd asterisk on the line
			
			if (asterisk_pos == m || asterisk_pos == end_pos):
				toFillBB += character
			else:
				toFillBB += " "
			pass
		
		# print a new line character
		toFillBB += "\n"
		
		"""
		when the middle of x_size is reached, 
		it's time to decrease the position of the asterisk!
		"""
		asterisk_pos += inc
		if (asterisk_pos > (sizeInt[0]/2)-1):
			inc *= -1
		pass
	
	pass

func fillHelix():
	# accidental DNA helix
	# x_size use sizeInt[0]
	var asterisk_pos:int = 0 # initial position of the asterisk
	var inc = 1 # amount of increment added to asterisk_pos
	# after an entire line has been printed
	
	# height is the line number
	for n in sizeInt[0]:
		# width is the column position of the character that needs to be printed for a given line
		for m in sizeInt[0]:
			var end_pos:int = (sizeInt[1] - m) - 1 # the position of the 2nd asterisk on the line
			
			if (asterisk_pos == m || asterisk_pos == end_pos):
				toFillBB += character
			else:
				toFillBB += " "
			pass
		
		# print a new line character
		toFillBB += "\n"
		
		"""
		when the middle of x_size is reached, 
		it's time to decrease the position of the asterisk!
		"""
		asterisk_pos += inc
		if (asterisk_pos > (sizeInt[0]/2)-1):
			inc *= -1
		pass
	
	pass
	pass

"""
END SHAPE FILLERS
"""

func _on_SingleCharOption_hasChangedText(intoSay:String) -> void:
	character = intoSay
	refreshLook()
	pass # Replace with function body.


func _on_HeightOption_hasChangedNumber(newNum:int) -> void:
#	print(newNum)
#	size.y = newNum
#	sizeInt[1] = newNum
#	refreshLook()
	pass # Replace with function body.


func _on_ShapeOption_hasChangedSelection(intoThe:int) -> void:
	chooseShape = intoThe
	refreshLook()
	pass # Replace with function body.


func _on_WidthOption_hasChangedNumber(newNum:int) -> void:
#	size.x = newNum
#	sizeInt[0] = newNum
#	refreshLook()
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

func _on_ResetAllButton_pressed() -> void:
	resetAllToDefault()
	pass # Replace with function body.


func _on_QuitButton_pressed() -> void:
	if Engine.has_singleton('Singletoner'):
		# Singletoner call change dvd
		pass
	else:
		get_tree().quit(0)
	pass # Replace with function body.
