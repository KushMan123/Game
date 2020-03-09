extends Bullet_xz
class_name Boss_bullet_2

func _on_Boss_bullet_2_body_entered(body):
	if body is Player:
		explode()
