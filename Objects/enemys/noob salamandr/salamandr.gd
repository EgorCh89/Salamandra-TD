extends enemy_class

class_name salamandr
# Called when the node enters the scene tree for the first time.
func _ready():
	self.hp = 100
	self.speed = 100
	self.path = Variables.enemy_path
	self.path_follow = PathFollow2D.new()
	if self.path != null:
		self.path.add_child(path_follow)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path_follow.progress+=speed * delta
	self.rotation = path_follow.rotation
	self.position = path_follow.position
	$HpBar.value = hp
	if hp <=0:
		queue_free()

"""
func _on_area_2d_body_entered(body):
	if body.type == "bullet":
		self.hp -= body.damage
		body.queue_free()
"""
