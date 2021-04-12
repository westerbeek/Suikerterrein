extends Node2D

var menuOn = true

#menu buttons
onready var menuScreen = $MenuScreen
onready var settingScreen = $SettingsScreen

#the options buttons
onready var options = $Options


#the buttons for settings
onready var fullscreenButton = $SettingsScreen/UI/CheckButton

#Recipe book
onready var recipeBook = $RecipeBook

func _ready():
	options.hide()
	recipeBook.hide()
	settingScreen.hide()

#func _process(delta):
#	pass


func _on_StartButton_pressed():
	menuOn = false
	menuScreen.hide()
	options.show()
	recipeBook.show()


func _on_SettingsButton_pressed():
	menuScreen.hide()
	settingScreen.show()


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_BackButton_pressed():
	if (menuOn == true):
		settingScreen.hide()
		menuScreen.show()
	else:
		settingScreen.hide()
		options.show()
		recipeBook.show()


# warning-ignore:unused_argument
func _on_CheckButton_toggled(button_pressed):
	OS.set_window_fullscreen(!OS.window_fullscreen)


func _on_MenuButton_pressed():
	menuOn = true
	options.hide()
	recipeBook.hide()
	menuScreen.show()


func _on_SettingButton_pressed():
	options.hide()
	recipeBook.hide()
	settingScreen.show()
