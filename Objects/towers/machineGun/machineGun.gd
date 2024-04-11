extends tower

var bullet_scene = preload("res://Objects/bullets/bullet.tscn")

var ready_to_shoot: = true
var enemys:Array = []
# Called when the node enters the scene tree for the first time.
func _ready():
	damage = 10
	fire_rate = 0.5
	rotation_speed = 1
	$CooldownTimer.wait_time=fire_rate
	self.position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if len(enemys)>0:
		$MachineGunHead.rotation = (self.position -enemys.front().position).normalized().angle() -PI
	
	if len(enemys)>0 and ready_to_shoot:
		var enemy_ = enemys.front()
		ready_to_shoot = false
		$CooldownTimer.start()
		var bull = bullet_scene.instantiate()
		bull.position = self.position
		bull.angle = (self.position -enemy_.position).normalized().angle() -PI
		bull.rotation = (self.position -enemy_.position).normalized().angle() -PI
		bull.damage = self.damage
		bull.enemy = enemy_
		$bullets.add_child(bull)
	


func _on_cooldown_timer_timeout():
	ready_to_shoot = true


func _on_attack_area_body_entered(body):
	print(body.type)
	if body.type == "enemy":
		enemys.append(body)
	pass # Replace with function body.


func _on_attack_area_body_exited(body):
	if body.type == "enemy":
		enemys.erase(body)
	print("removed")
