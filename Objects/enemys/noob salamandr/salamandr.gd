extends enemy_class


# Called when the node enters the scene tree for the first time.
func _ready():
	hp = 100
	speed = 100
	path = $"../../Path2D"
	path_follow = PathFollow2D.new()
	path.add_child(path_follow)
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path_follow.progress+=speed * delta
	self.rotation = path_follow.rotation
	self.position = path_follow.position
	if hp <=0:
		queue_free()

"""
func _on_area_2d_body_entered(body):
	if body.type == "bullet":
		self.hp -= body.damage
		body.queue_free()
"""
