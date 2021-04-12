extends Node2D

#menu
var menu = true

#plant
var planted = false
var soaked = false
var fertilzed = false

#plot
var plantTime = 120
var plantStage = 0
var plantTimer = plantTime

#menu
onready var menuAnimationPlayer = $PlotMenu/MenuAnimationPlayer

#plant
onready var plant = $Plant
onready var plantAnimationPlayer = $Plant/PlantAnimationPlayer

#plot
onready var wateringCan = $Sprite/WateringCan
onready var animationPlayer = $Sprite/AnimationPlayer
onready var stageLabel = $Sprite/StageLabel

func _ready():
	wateringCan.hide()

func _process(delta):
	
	stageLabel.text = "Stage " + str(plantStage) + " Time " + str(plantTimer)
	
	if (planted == false):
		plantStage = 0
	else:
		if (soaked == true) and (plantStage <= 4):
			plantTimer -= 1
			if (plantTimer < 0):
				plantStage += 1
				plantTimer = plantTime
	
	if soaked == true:
		animationPlayer.play("PlotSoaked")
	else:
		animationPlayer.play("PlotDry")
	
	match plantStage:
		0:
			plant.hide()
			plantAnimationPlayer.play("Stage1")
		1:
			if (soaked == false):
				wateringCan.show()
			else:
				wateringCan.hide()
			plant.show()
			plantAnimationPlayer.play("Stage1")
		2:
			plantAnimationPlayer.play("Stage2")
		3:
			plantAnimationPlayer.play("Stage3")
		4:
			plantAnimationPlayer.play("Stage4")
		5:
			plantAnimationPlayer.play("Stage5")

func _on_PlotButton_pressed():
	if planted == true and soaked == false:
		soaked = true
	
	if menu == true and planted == false:
		menu = false
		menuAnimationPlayer.play("MenuShow")
	elif menu == false:
		menu = true
		menuAnimationPlayer.play("MenuHide")
	
	if plantStage == 5:
		planted = false
		soaked = false
		plantStage = 0
	


func _on_MenuButton1_pressed():
	planted = true
	menu = true
	menuAnimationPlayer.play("MenuHide")
	plantStage = 1
