extends Node2D

var pressed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/Transitionscreen.show()
	$CanvasLayer/Transitionscreen/Timer.start()
	$CanvasLayer/Transitionscreen/AnimationPlayer.play("fade_out")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	$click.play()
	$CanvasLayer/Transitionscreen.show()
	$CanvasLayer/Transitionscreen/Timer.start()
	$CanvasLayer/Transitionscreen/AnimationPlayer.play("fade_in")
	pressed = true
	

func _on_timer_timeout() -> void:
	$CanvasLayer/Transitionscreen.hide()
	if pressed == true:
		get_tree().change_scene_to_file("res://Scenes/startup.tscn")
