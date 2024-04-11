extends StaticBody2D
class_name bullet

@export var speed:float = 10
@export var damage:int
@export var angle:float = 0
@export var enemy:CharacterBody2D
@export var type:String = "bullet"
@export var can_damage =true
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
		body.hp-=damage
		queue_free()
