extends Node2D

const MAX_PAGES = 2

var page = 0
var recipeShow = false

onready var bookSprite = $BookSprite
onready var nextButton = $BookSprite/NextButton
onready var previousButton = $BookSprite/PreviousButton
onready var titleLabel = $BookSprite/TitleLabel

# warning-ignore:unused_argument
func _process(delta):
	if recipeShow == false:
		bookSprite.hide()
	else:
		bookSprite.show()
	match page:
		0:
			titleLabel.text = "Brandnetel"
		1:
			titleLabel.text = "Tee"
		2:
			titleLabel.text = "Koffie"


func _on_NextButton_pressed():
	page += 1
	if (page > MAX_PAGES):
		page = 0


func _on_PreviousButton_pressed():
	page -= 1
	if (page < 0):
		page = MAX_PAGES


func _on_TextureButton_pressed():
	if recipeShow == false:
		recipeShow = true
	else:
		recipeShow = false
