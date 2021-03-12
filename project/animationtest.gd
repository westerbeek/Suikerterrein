extends Area2D

onready var interaction = get_node("interactiontest")


func _ready():
	pass
	
func _on_enemyarea_area_enter( area ):
	queue_free() 
	print("collision!")
	interaction.play("run")
	yield(get_node("interactiontest"), "animation_finished")

func _on_Collision_body_entered(body):
	queue_free() 
	print("collision!")
	interaction.play("run")
	yield(get_node("interactiontest"), "animation_finished")
