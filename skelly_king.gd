extends StaticBody2D

var spike = preload("res://bullet.tscn")

var vect = Vector2.ZERO
var rand = RandomNumberGenerator.new()
var angle = 0
var health = 20


func _ready():
	rand.randomize()
	$AnimatedSprite2D.play("default")


func _process(delta):
	move_and_collide(vect)
	
	if health <= 0:
		get_tree().change_scene_to_file('')


func _on_timer_timeout():
	vect = Vector2(rand.randi_range(-1,1),rand.randi_range(-1,1)).normalized() / 2
	var spine = spike.instantiate()
	get_parent().add_child(spine)
	spine.global_position = position
	spine.rotation = angle
	angle += PI/16

func _on_hitbox_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print('skell dmg')
	health -= 1
	vect = -vect*10
	
