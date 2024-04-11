extends tower

var arrow_scene = preload("res://Objects/bullets/Arrow.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	damage = 25
	fire_rate = 1
	rotation_speed = 1
	$CooldownTimer.wait_time=fire_rate
	self.position = pos
	enemys = []
	ready_to_shoot = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if len(enemys)>0:
		$ArcherHead.rotation = (self.position -enemys.front().position).normalized().angle() -PI
	
	if len(enemys)>0 and ready_to_shoot:
		var enemy_ = enemys.front()
		ready_to_shoot = false
		$CooldownTimer.start()
		var arr = arrow_scene.instantiate()
		arr.position = self.position
		arr.angle = (self.position -enemy_.position).normalized().angle() -PI
		arr.rotation = (self.position -enemy_.position).normalized().angle() -PI
		arr.damage = self.damage
		arr.enemy = enemy_
		$bullets.add_child(arr)
		print("Mam ho")
	


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
