extends Node2D


func _ready():
	set_process(true)
	set_camera_limits()
	
func _process(delta):
	pass

func set_camera_limits():
	var map_limits=$"Tilemap collection/Grass".get_used_rect()
	var map_cellsize=$"Tilemap collection/Grass".cell_size
	$Player/Camera2D.limit_left=map_limits.position.x*map_cellsize.x
	$Player/Camera2D.limit_right=map_limits.end.x*map_cellsize.x
	$Player/Camera2D.limit_top=map_limits.position.y*map_cellsize.y
	$Player/Camera2D.limit_bottom=map_limits.end.y*map_cellsize.y
