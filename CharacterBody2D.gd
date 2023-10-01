extends CharacterBody2D

var speed = 120

var inDir = Vector2.ZERO

var knockback = true
var swing = true

func _process(delta):
	$AnimatedSprite2D.frame = global.health
	if global.health < 0:
		get_tree().change_scene_to_file("res://assets/end.tscn")

func _physics_process(delta):
	if knockback:
		get_input()
	
	if Input.is_action_pressed("ui_accept"):
		$sword/CollisionShape2D.set_deferred('disabled', false)
		$sword.visible = true
		$sword.position = inDir*8
		$sword.rotation = inDir.angle() + PI/2
		print(global.keys)
	else:
		$sword.visible = false
		$sword/CollisionShape2D.set_deferred('disabled', true)
		move_and_collide(velocity * delta)
		
		
		

func get_input():
#	var temp = input_dir			 #ICE
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
#	if input_dir == Vector2.ZERO:	#ICE
#		input_dir = temp			#ICE
	if not input_dir == Vector2.ZERO:
		inDir = input_dir

	velocity = input_dir * speed


func _on_area_2d_body_entered(body): #hitbox
	print(body)
	knockback = false
	$knockbackTime.start()
	global.health -= 1
	velocity = inDir * -300
	print('plyr dmg')


func _on_knockback_time_timeout():
	knockback = true


func _on_swing_timer_timeout():
	swing = true
