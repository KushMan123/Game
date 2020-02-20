extends Node2D
onready var Player=get_node("Player")
var key_found=false
func _ready():
	pass
func _physics_process(delta):
	var  pos=Player.position

	if Player.position.y>1000:
		
		
		Player.dead()
		Player.position=Vector2(0,345)






func _on_key_key_found(value:bool):
	if value==true:
		key_found=true
		print("inside key")
		$key.queue_free()
		

	
			




func _on_door_In_door_area(value1):
	print("Hhhhheello")
	if value1==true:
		if key_found==true:
			print("Inside Door func")
			$door/Timer.start()
			$door/spikeA.set_visible(false)
			$door.queue_free()