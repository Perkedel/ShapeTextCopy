extends Node

export(String) var character:String = "*"
export(Vector2) var size:Vector2 = Vector2(20,10)
export(PoolIntArray) var sizeInt:PoolIntArray = [20,10]
export(bool) var addSpace:bool = false;
export(int) var chooseSkin = 0 # each shape may have various like a a, 1 2, etc.
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
			fillLozenge()
			pass
		3:
			fillBottomLeftCorner()
			pass
		4:
			fillBottomRightCorner()
			pass
		5:
			fillTopLeftCorner()
			pass
		6:
			fillTopRightCorner()
			pass
		8:
			fillX()
		9:
			fillHelix()
		10:
			fillTriangleInverted()
		_:
			fillSquare()
			pass
	toFillBB += "[/code]"
	
	$"%TextToCopy".bbcode_text = toFillBB
	pass

func addCharacter(with:String = '', andSpace:bool = false, manual:bool = false):
	toFillBB += (with + (" " if (andSpace if manual else addSpace) else ""))
	
	#-> addCharacter(character) <-
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
			addCharacter(character)
			pass
		addCharacter('\n')
		pass
	
	
	pass

func arguTriangle(sizing:int):
	var k = 0
	for i in range(0,sizing+1):
		for j in sizing-i:
#			toFillBB += " "
			addCharacter(' ')
		
		while k != 2*i+1:
#			toFillBB += character
			addCharacter(character)
			k += 1
			if k > 2*i+1:
				break
			pass
		
#		toFillBB += "\n"
		addCharacter('\n')
		k = 0
		pass
	pass

func fillTriangle():
	# https://www.programiz.com/cpp-programming/examples/pyramid-pattern
	"""
	#include <iostream>
	using namespace std;

	int main()
	{
		int space, rows;

		cout <<"Enter number of rows: ";
		cin >> rows;

		for(int i = 1, k = 0; i <= rows; ++i, k = 0)
		{
			for(space = 1; space <= rows-i; ++space)
			{
				cout <<"  ";
			}

			while(k != 2*i-1)
			{
				cout << "* ";
				++k;
			}
			cout << endl;
		}    
		return 0;
	}
	"""
	# number
	#	        1
	#	      2 3 2
	#	    3 4 5 4 3
	#	  4 5 6 7 6 5 4
	#	5 6 7 8 9 8 7 6 5
	"""
	#include <iostream>
	using namespace std;

	int main()
	{
		int rows, count = 0, count1 = 0, k = 0;

		cout << "Enter number of rows: ";
		cin >> rows;

		for(int i = 1; i <= rows; ++i)
		{
			for(int space = 1; space <= rows-i; ++space)
			{
				cout << "  ";
				++count;
			}

			while(k != 2*i-1)
			{
				if (count <= rows-1)
				{
					cout << i+k << " ";
					++count;
				}
				else
				{
					++count1;
					cout << i+k-2*count1 << " ";
				}
				++k;
			}
			count1 = count = k = 0;

			cout << endl;
		}
		return 0;
	}
	"""
	#row uses sizeInt[1]
	
#	var k = 0
#	for i in sizeInt[1]:
#		for j in sizeInt[1]-i:
##			toFillBB += " "
#			addCharacter(' ')
#
#		while k != 2*i+1:
##			toFillBB += character
#			addCharacter(character)
#			k += 1
#			if k > 2*i+1:
#				break
#			pass
#
##		toFillBB += "\n"
#		addCharacter('\n')
#		k = 0
#		pass
	arguTriangle(sizeInt[1])
	pass

func arguTriangleInvert(sizing:int, bringFlipSpaceSpecial:bool = false):
	var flipCount = sizing
#	for i in sizing
#	while(flipCount >=1):
	if bringFlipSpaceSpecial:
		addCharacter(' ')
	for i in range(sizing,0,-1):
		var space = 0
		for j in range(0,sizing-i):
#		while !(space < sizing-i):
			addCharacter(' ')
			space += 1
			
#			if space < sizing-i:
#				break
			pass
		
		var jj = i
		while jj != (2*i-1):
			addCharacter(character)
			jj+=1
			
#			if jj <= ((2*i)-1):
#				break
			pass
		
		var jjj = 0
		for j in i:
#		while !(jjj < flipCount-1):
			addCharacter(character)
			jjj += 1
		
		addCharacter('\n' + (' ' if bringFlipSpaceSpecial else ''))
		
		flipCount -= 1
		pass
	pass

func fillTriangleInverted():
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
			for(int space = 0; space < rows-i; ++space)
				cout << "  ";

			for(int j = i; j <= 2*i-1; ++j)
				cout << "* ";

			for(int j = 0; j < i-1; ++j)
				cout << "* ";

			cout << endl;
		}

		return 0;
	}
	"""
	#rows uses sizeInt[1]
	
#	var flipCount = sizeInt[1]
##	for i in sizeInt[1]:
##	while(flipCount >=1):
#	for i in range(sizeInt[1],0,-1):
#		var space = 0
#		for j in range(0,sizeInt[1]-i):
##		while !(space < sizeInt[1]-i):
#			addCharacter(' ')
#			space += 1
#
##			if space < sizeInt[1]-i:
##				break
#			pass
#
#		var jj = i
#		while jj != (2*i-1):
#			addCharacter(character)
#			jj+=1
#
##			if jj <= ((2*i)-1):
##				break
#			pass
#
#		var jjj = 0
#		for j in i:
##		while !(jjj < flipCount-1):
#			addCharacter(character)
#			jjj += 1
#
#		addCharacter('\n')
#
#		flipCount -= 1
#		pass
	arguTriangleInvert(sizeInt[1])
	pass

func fillTopRightCorner():
#	var flipCount = sizeInt[1]
#	for i in sizeInt[1]:
#		for j in sizeInt[1]-flipCount:
#			addCharacter(' ')
#			pass
#
#		var jj = flipCount
#		while !(jj<= (2*flipCount-1)):
#			addCharacter(character)
#			jj+=1
#			pass
#
#		for j in flipCount-1:
#			addCharacter(character)
#
#		addCharacter('\n')
#
#		flipCount -= 1
#		pass
	
	# https://www.geeksforgeeks.org/programs-printing-pyramid-patterns-c/
	"""
	// C++ code to demonstrate pattern printing
	#include <iostream>
	using namespace std;
	 
	// Function to demonstrate printing pattern
	void pypart2(int n)
	{
		int i = n, j = 0, k = 0;
		while (i > 0) {
		   
			  // for number of spaces
			while (k < (n - i)) {
				cout << "  ";
				k++;
			}
	 
			  // resetting k because we want to run k from
			// beginning.
			k = 0;
			while (j < i) {
				cout << "* ";
				j++;
			}
		   
			  // resetting k so as it can start from 0.
			j = 0;
			i--;
			cout << endl;
		}
	}
	 
	// Driver Code
	int main()
	{
		int n = 5;
	   
		  // Function Call
		pypart2(n);
		return 0;
	}
	"""
	# Function to demonstrate printing pattern
	var n:int = sizeInt[1]
	var i:int = n
	var j:int = 0
	var k:int = 0
	
	while i > 0:
		# for number of spaces
		while k < (n - i): 
			addCharacter(' ')
			k+=1
#			if k < n - 1:
#				break
			pass
		
		# resetting k because we want to run k from
		# beginning.
		k = 0;
		while j < i: 
			addCharacter(character)
			j+=1
#			if j < i:
#				break
		
	   
		# resetting k so as it can start from 0.
		j = 0
		i-=1
		addCharacter('\n')
#		if i > 0:
#			break
	pass

func fillAccidentalSpotlight():
	var flipCount = sizeInt[1]
	for i in sizeInt[1]:
		for j in flipCount-1:
			addCharacter(' ')
			pass
		
		var jj = flipCount
		while !(jj<= (2*flipCount-1)):
			addCharacter(character)
			jj+=1
			pass
		
		for j in flipCount-1:
			addCharacter(character)
		
		addCharacter('\n')
		
		flipCount -= 1
		pass
	pass
	pass

func fillAccidentMonolith():
	var flipCount = sizeInt[1]
	for i in sizeInt[1]:
		for j in sizeInt[1]:
			addCharacter(' ')
			pass
		
		var jj = flipCount
		while !(jj< 2*flipCount+1):
			addCharacter(character)
			jj+=1
			pass
		
		for j in flipCount-1:
			addCharacter(character)
		
		addCharacter('\n')
		
		--flipCount
		pass
	pass

func fillLozenge():
	# Just have 2 triangle! the rightside up & upside down.
	# upside down minus one to merge with bottom feet of rightside up
	var divide = sizeInt[1]
	
	arguTriangle(divide)
	arguTriangleInvert(divide, true)
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
	
	for i in range(0,sizeInt[1]):
		for j in range(0,i+1):
			addCharacter(character)
			pass
		addCharacter('\n')
		pass
	
	pass

func fillBottomRightCorner():
	# https://www.geeksforgeeks.org/programs-printing-pyramid-patterns-c/
	"""
	// C++ code to demonstrate star pattern
	#include <iostream>
	using namespace std;
	 
	// Driver Code
	int main()
	{
		int n = 5;
	   
		//looping rows
		for(int i=n; i>0; i--)
		{
		  for(int j=0; j<=n; j++) //looping columns
		  {
			if (j>=i)
			{
			  cout<<"*";
			}
			else
			{
			  cout<<" ";
			}
		  }
		  cout<<endl;
		}
		return 0;
	}
	"""
	#n uses sizeInt[1]
	
	for i in range(sizeInt[1],0,-1):
		for j in range(0,sizeInt[1]):
			if (j>=i-1):
				addCharacter(character)
			else:
				addCharacter(' ')
			pass
		addCharacter('\n')
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
			addCharacter(character)
			pass
		addCharacter('\n')
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
#				toFillBB += character
				addCharacter(character)
			else:
#				toFillBB += " "
				addCharacter(" ")
			pass
		
		# print a new line character
#		toFillBB += "\n"
		addCharacter('\n')
		
		"""
		when the middle of x_size is reached, 
		it's time to decrease the position of the asterisk!
		"""
		asterisk_pos += inc
		if (asterisk_pos > (sizeInt[1]/2)-1):
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
				addCharacter(character)
			else:
				addCharacter(' ')
			pass
		
		# print a new line character
		addCharacter('\n')
		
		"""
		when the middle of x_size is reached, 
		it's time to decrease the position of the asterisk!
		"""
		asterisk_pos += inc
		if (asterisk_pos > (sizeInt[0]/2)-1):
			inc *= -1
		pass
	
	pass

# more misc codes
"""
https://www.programiz.com/cpp-programming/examples/pyramid-pattern
Pascal Triangle
		   1
		 1   1
	   1   2   1
	 1   3   3    1
   1  4    6   4   1
 1  5   10   10  5   1 

#include <iostream>
using namespace std;

int main()
{
	int rows, coef = 1;

	cout << "Enter number of rows: ";
	cin >> rows;

	for(int i = 0; i < rows; i++)
	{
		for(int space = 1; space <= rows-i; space++)
			cout <<"  ";

		for(int j = 0; j <= i; j++)
		{
			if (j == 0 || i == 0)
				coef = 1;
			else
				coef = coef*(i-j+1)/j;

			cout << coef << "   ";
		}
		cout << endl;
	}

	return 0;
}

Floyd Triangle
1
2 3
4 5 6
7 8 9 10

#include <iostream>
using namespace std;

int main()
{
	int rows, number = 1;

	cout << "Enter number of rows: ";
	cin >> rows;

	for(int i = 1; i <= rows; i++)
	{
		for(int j = 1; j <= i; ++j)
		{
			cout << number << " ";
			++number;
		}

		cout << endl;
	}

	return 0;
}
"""

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

func _on_CopyButton_pressed() -> void:
	if $"%Result".visible:
		OS.set_clipboard($"%TextToCopy".text)
		pass
	elif $"%Source Codes".visible:
		OS.set_clipboard($"UIBox/Contains/TabContainer/Source Codes/SourceCodeSelfFiller/SourceText".text)
		pass
	pass # Replace with function body.
