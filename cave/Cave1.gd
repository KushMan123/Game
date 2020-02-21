extends Area2D

func _ready():
	pass


func _on_Cave1_body_entered(body):
	if body is Player_in_xz:
		get_tree().change_scene("res://stage/xy_A/Stage.tscn") 
