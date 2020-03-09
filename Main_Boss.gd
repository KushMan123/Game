extends KinematicBody2D
class_name Boss

signal shoot_from_turrent_1
signal shoot_from_turrent_2
signal shoot_from_turrent_3
signal shoot_from_turrent_4
signal shoot_fireball

export(PackedScene) var FireBall_1
export(PackedScene) var Fireball_2
export(PackedScene) var FireBall_2
export (float) var firing_speed
export (float) var health

var can_shoot_1=true
var can_shoot_2=true
var body_rotation_1=0
var body_rotation_2=0
var body_rotation_3=0
var body_rotation_4=0

var player: Player

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	if health>=600:
		body_rotation_1+=get_rotation_degrees()+4
		body_rotation_2+=get_rotation_degrees()+4
		body_rotation_3+=get_rotation_degrees()+4
		body_rotation_4+=get_rotation_degrees()+4
		$Node2D/Turrent_1.set_rotation_degrees(body_rotation_1)
		$Node2D/Turrent_2.set_rotation_degrees(body_rotation_2)
		$Node2D/Turrent_3.set_rotation_degrees(body_rotation_3)
		$Node2D/Turrent_4.set_rotation_degrees(body_rotation_4)
		shoot()
	elif health<600 and health>=300:
		var direction = (player.global_position-global_position).normalized()
		print("Bullet_direction",direction)
		var distance_to_player=global_position.distance_to(player.global_position)
		var curr_dir= Vector2(1,0). rotated($Node2D/Turrent_5.global_rotation)
		$Node2D/Turrent_5.global_rotation=curr_dir.linear_interpolate(direction,50*delta).angle()
		if direction.dot(curr_dir)>0.9:
			shoot()
			
	if health<300:
		body_rotation_1+=get_rotation_degrees()+4
		body_rotation_2+=get_rotation_degrees()+4
		body_rotation_3+=get_rotation_degrees()+4
		body_rotation_4+=get_rotation_degrees()+4
		$Node2D/Turrent_1.set_rotation_degrees(body_rotation_1)
		$Node2D/Turrent_2.set_rotation_degrees(body_rotation_2)
		$Node2D/Turrent_3.set_rotation_degrees(body_rotation_3)
		$Node2D/Turrent_4.set_rotation_degrees(body_rotation_4)
		var direction = (player.global_position-global_position).normalized()
		print("Bullet_direction",direction)
		var distance_to_player=global_position.distance_to(player.global_position)
		var curr_dir= Vector2(1,0). rotated($Node2D/Turrent_5.global_rotation)
		$Node2D/Turrent_5.global_rotation=curr_dir.linear_interpolate(direction,50*delta).angle()
		shoot()
		
	
func shoot():
	if health>=600:
		if can_shoot_1:
			can_shoot_1=false
			$"Position2D Collection/Firing_1 timer".start()
			var dir_1= Vector2(1,0).rotated($Node2D/Turrent_1.global_rotation)
			var dir_2= Vector2(1,0).rotated($Node2D/Turrent_2.global_rotation)
			var dir_3= Vector2(1,0).rotated($Node2D/Turrent_3.global_rotation)
			var dir_4= Vector2(1,0).rotated($Node2D/Turrent_4.global_rotation)
			print(dir_1,dir_2)
			emit_signal("shoot_from_turrent_1",FireBall_1,$Node2D/Turrent_1/Position2D_1.global_position,dir_1)
			emit_signal("shoot_from_turrent_2",FireBall_1,$Node2D/Turrent_2/Position2D_1.global_position,dir_2)
			emit_signal("shoot_from_turrent_3",FireBall_1,$Node2D/Turrent_3/Position2D_2.global_position,dir_3)
			emit_signal("shoot_from_turrent_4",FireBall_1,$Node2D/Turrent_4/Position2D_1.global_position,dir_4)
	if health<600 and health>=300:
		if can_shoot_2:
			can_shoot_2=false
			$"Position2D Collection/Firing_2 timer".start()
			var dir = Vector2(1, 0).rotated($Node2D/Turrent_5.global_rotation)
			emit_signal('shoot_fireball', FireBall_2, $Node2D/Turrent_5/Position2D.global_position, dir)
		
	if health<300 :
		if can_shoot_1:
			can_shoot_1=false
			$"Position2D Collection/Firing_1 timer".start()
			var dir_1= Vector2(1,0).rotated($Node2D/Turrent_1.global_rotation)
			var dir_2= Vector2(1,0).rotated($Node2D/Turrent_2.global_rotation)
			var dir_3= Vector2(1,0).rotated($Node2D/Turrent_3.global_rotation)
			var dir_4= Vector2(1,0).rotated($Node2D/Turrent_4.global_rotation)
			emit_signal("shoot_from_turrent_1",FireBall_1,$Node2D/Turrent_1/Position2D_1.global_position,dir_1)
			emit_signal("shoot_from_turrent_2",FireBall_1,$Node2D/Turrent_2/Position2D_1.global_position,dir_2)
			emit_signal("shoot_from_turrent_3",FireBall_1,$Node2D/Turrent_3/Position2D_2.global_position,dir_3)
			emit_signal("shoot_from_turrent_4",FireBall_1,$Node2D/Turrent_4/Position2D_1.global_position,dir_4)
		if can_shoot_2:
			can_shoot_2=false
			$"Position2D Collection/Firing_2 timer".start()
			var dir = Vector2(1, 0).rotated($Node2D/Turrent_5.global_rotation)
			emit_signal('shoot_fireball', FireBall_2, $Node2D/Turrent_5/Position2D.global_position, dir)
		
func _on_Firing_1_timer_timeout():
	can_shoot_1=true


func _on_Area2D_body_entered(body):
	if body is Player:
		player=body
		set_physics_process(true)


func _on_Firing_2_timer_timeout():
	can_shoot_2=true
	
func damage(damage):
	health-=damage
	if(health<=0):
		queue_free()
