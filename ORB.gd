extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$sprite.rotation += 3*PI*delta
	$sprite.modulate.r = sin(Time.get_ticks_msec()/100)
	$sprite.modulate.b = cos(Time.get_ticks_msec()/100)

func _on_body_entered(body):
	global.fires += 1
	queue_free()
