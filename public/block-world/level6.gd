extends Node2D
var winvalue = 14

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in 3:
		Globalvariable.coincollected = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globalvariable.coincollected == winvalue:
		get_tree().change_scene_to_file("res://winners.tscn")
