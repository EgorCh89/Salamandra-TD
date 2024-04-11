extends bullet


# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 10
	damage = 25
	can_damage =true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# self destory
	if self.position.x < -20 or self.position.x > 1200 or self.position.y < -20 or self.position.y >1000:
		queue_free() 
	# movement
	if enemy != null:
		var pos = enemy.position
		self.position+=Vector2.RIGHT.rotated(angle).normalized()*(speed/2)
		self.position+=Vector2.RIGHT.rotated((pos -self.position).angle()).normalized()*(speed/2)
	else:
		self.position+=Vector2.RIGHT.rotated(angle).normalized()*(speed)

	


func _on_area_2d_body_entered(body):
	if body.type == "enemy" and can_damage:
		can_damage = false
		body.hp-=damage
		queue_free()
		
