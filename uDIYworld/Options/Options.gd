extends Node2D

var showOptions = true

onready var optionsButton = $OptionsButton
onready var optionsContainer = $OptionsContainer
onready var animationPlayer = $AnimationPlayer

func _ready():
	optionsContainer.hide()

func options():
	if (showOptions == true):
		animationPlayer.play("OptionsShow")
		optionsButton.hide()
		optionsContainer.show()
	elif (showOptions == false):
		animationPlayer.play("OptionsHide")
		optionsContainer.hide()
		optionsButton.show()


func _on_OptionsButton_pressed():
	showOptions = true
	options()

func _on_CloseButton_pressed():
	showOptions = false
	options()


func _on_SettingButton_pressed():
	showOptions = false
	options()


func _on_MenuButton_pressed():
	showOptions = false
	options()
