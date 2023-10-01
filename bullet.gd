extends Area2D

const speed = 150
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#	rotation = PI


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var distance = speed * delta
	var motion = transform.y * speed * delta
	
	global_position += motion


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
#	global.health -= 1
	print('bullet')


func _on_timer_timeout():
	queue_free()
