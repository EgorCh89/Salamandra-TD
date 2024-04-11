extends CharacterBody2D

class_name enemy_class

@export var hp = 0
@export var speed = 0
@export var path:Path2D
@export var path_follow:PathFollow2D
@export var type = "enemy"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
