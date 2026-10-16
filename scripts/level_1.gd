extends Node2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var transitionscreen: ColorRect = $Transitionscreen

var finished = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player.play()
	$Transitionscreen.show()
	$Transitionscreen/Timer.start()
	$Transitionscreen/AnimationPlayer.play("fade_out")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_audio_stream_player_finished() -> void:
	audio_stream_player.play()


func _on_lavaaa_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.die()



func _on_timer_timeout() -> void:
	if finished == true:
		finished = false
		get_tree().change_scene_to_file("res://Scenes/finish.tscn")
	$Transitionscreen.hide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	transitionscreen.hide()
	if body.name == "player":
		finished = true
		$Transitionscreen.show()
		$Transitionscreen/Timer.start()
		$Transitionscreen/AnimationPlayer.play("fade_in")
		 
