extends Node2D


func _ready():
	pass # Replace with function body.
	
func _on_shoot(bullet, _position, _direction):
	var b=bullet.instance()
	add_child(b)
	b.start(_position,_direction)

