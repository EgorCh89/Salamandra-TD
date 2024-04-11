extends Node2D

var show_options = false
var pos:Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	self.pos = Vector2(int(position.x/64),int((position.y-64)/64))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sniper.visible = show_options
	$Cannon.visible = show_options
	$Archer.visible = show_options
	$MachineGun.visible = show_options
	$CloseButton.visible = show_options

func _on_button_pressed():
	show_options = true


func _on_close_button_pressed():
	show_options =false


func _on_machine_gun_pressed():
	var machine_scene = preload("res://Objects/towers/machineGun/machineGun.tscn")
	var machine = machine_scene.instantiate()
	machine.pos = Vector2(self.pos.x*64 +32, self.pos.y *64 + 64 +32)
	machine.level = 1
	
	$"../../Towers".add_child(machine)
	queue_free()


func _on_sniper_pressed():
	pass


func _on_archer_pressed():
	pass # Replace with function body.


func _on_cannon_pressed():
	pass # Replace with function body.
