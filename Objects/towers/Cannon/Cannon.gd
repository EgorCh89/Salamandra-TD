extends tower

var ball_scene = preload("res://Objects/bullets/CannonBall.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	damage = 45 
	fire_rate = 3
	rotation_speed = 1
	$CooldownTimer.wait_time=fire_rate
	self.position = pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if len(enemys)>0:
		$CannonHead.rotation = (self.position -enemys.front().position).normalized().angle() -PI
	
	if len(enemys)>0 and ready_to_shoot:
		var enemy_ = enemys.front()
		ready_to_shoot = false
		$CooldownTimer.start()
		var ball = ball_scene.instantiate()
		ball.position = self.position
		ball.angle = (self.position -enemy_.position).normalized().angle() -PI
		ball.rotation = (self.position -enemy_.position).normalized().angle() -PI
		ball.damage = self.damage
		ball.enemy = enemy_
		$bullets.add_child(ball)



func _on_cooldown_timer_timeout():
	ready_to_shoot = true


func _on_attack_area_body_entered(body):
	if body.type == "enemy":
		enemys.append(body)
	pass # Replace with function body.


func _on_attack_area_body_exited(body):
	if body.type == "enemy":
		enemys.erase(body)
