extends Node2D

const SPEED = 40
var direction = 1

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	if ray_cast_2d.is_colliding():
		direction =-1
		animated_sprite_2d.flip_h=true
		
	if ray_cast_2d_2.is_colliding():
		direction =1
		animated_sprite_2d.flip_h=false
		
	position.x += direction * SPEED * delta
	
