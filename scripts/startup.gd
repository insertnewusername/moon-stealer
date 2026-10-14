extends Node2D

var button = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	button = 1
	transition()


func _on_tutorial_pressed() -> void:
	button = 2
	transition()

func transition():
	$CanvasLayer/Transitionscreen.show()
	$CanvasLayer/Transitionscreen/AnimationPlayer.play("fade_in")
	$CanvasLayer/Transitionscreen/Timer.start()


func _on_timer_timeout() -> void:
	if button == 1:
		button = 0
		get_tree().change_scene_to_file("res://level1.tscn")
	if button == 2:
		button = 0
		get_tree().change_scene_to_file("res://level1.tscn")
