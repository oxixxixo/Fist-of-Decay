extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match global.fires:
		1:
			$fire1.position.y = 10000
		2:
			$fire2.position.y = 10000
		3:
			$fire3.position.y = 10000


func _on_boss_area_entered(area):
	$Aoverworld.playing = not $Aoverworld.playing
	$Aboss.playing = not $Aboss.playing



func _on_dungeon_area_entered(area):
	$Aoverworld.playing = not $Aoverworld.playing
	$Adungeon.playing = not $Adungeon.playing
