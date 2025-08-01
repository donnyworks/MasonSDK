extends Node3D

@export var number = 0
@export var speed = 1.0
@export var max_chambers = 0
var strmaxchambers = ""
var strnumbers = ""
var strnumbert = ""
func _ready():
	strnumbers = str(number - round(number/10)*10)
	strnumbert = str(number)
	if number < 10:
		strnumbert = "0"
	else:
		strnumbert = str(round(number/10))
	strmaxchambers = str(max_chambers)
	if max_chambers < 10:
		strmaxchambers = "0" + strmaxchambers
	$chamberlabel.text = "00/" + strmaxchambers
	$Sprite3D/SubViewport/Control/ProgressBar.max_value = max_chambers
var animcycle_subdigit = 0.0
var animcycle_maindigit = 0.0
var passes = 0
func _process(delta: float) -> void:
	#animcycle_subdigit += delta*speed
	animcycle_subdigit = 1
	var digit1s = $digit1s.text
	var digit10s = $digit10s.text
	if strnumbert == "0":
		if int(digit1s) < 9:
			if animcycle_subdigit > 0.5:
				digit1s = str(int(digit1s) + 1)
				$Sprite3D/SubViewport/Control/ProgressBar.value += 1
				animcycle_subdigit = 0.0
	else:
		if int(digit1s) < 9 and passes == 0: # Cycle 1
			if animcycle_subdigit > 0.5:
				digit1s = str(int(digit1s) + 1)
				$Sprite3D/SubViewport/Control/ProgressBar.value += 1
				animcycle_subdigit = 0.0
		else:
			if int(digit1s) == 9: # Cycle 1
				if animcycle_subdigit > 0.5:
					digit1s = "0"
					digit10s = str("0")
					passes = 1
			elif int(digit1s) < 9 and not digit1s == strnumbers and passes == 1:
				if animcycle_subdigit > 0.5:
					digit1s = str(int(digit1s) + 1)
					$Sprite3D/SubViewport/Control/ProgressBar.value += 1
					animcycle_subdigit = 0.0
			elif digit1s == strnumbers and passes == 1:
				animcycle_maindigit += delta*speed
				if int(digit10s) < int(strnumbert):
					if animcycle_maindigit > 0.5:
						digit10s = str(int(digit10s) + 1)
						$Sprite3D/SubViewport/Control/ProgressBar.value += 1
						animcycle_maindigit = 0.0
	$digit1s.text = digit1s
	$digit10s.text = digit10s
