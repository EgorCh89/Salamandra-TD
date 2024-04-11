extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Variables.enemy_path = $EnemyPath2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	var salam_scene = preload("res://Objects/enemys/noob salamandr/salamandr.tscn")
	var sal = salam_scene.instantiate()
	$enemys.add_child(sal)
