extends bullet


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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

