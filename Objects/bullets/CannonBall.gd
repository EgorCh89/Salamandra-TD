extends StaticBody2D

@export var speed:float = 4
@export var damage:int
@export var angle:float = 0
@export var enemy:CharacterBody2D
@export var type:String = "bullet"
@export var can_damage =true
@export var enemys_in_range:Array
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

"""
func _init(pos,angle):
	self.position = pos
	self.angle = angle
"""

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
		for enemy in enemys_in_range:
			enemy.hp-=damage
			
		print(enemys_in_range)
		queue_free()



func _on_explode_area_2d_body_entered(body):
	if body.type == "enemy":
		enemys_in_range.append(body)


func _on_explode_area_2d_body_exited(body):
	if body.type == "enemy":
		enemys_in_range.erase(body)
