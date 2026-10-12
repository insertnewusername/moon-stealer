extends Area2D
@onready var transitionscreen: ColorRect = $"../Transitionscreen"
@onready var transitionscreenan: AnimationPlayer = $"../Transitionscreen/AnimationPlayer"
@onready var timer: Timer = $"../Transitionscreen/Timer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		timer.start()
		transitionscreenan.play("fade_in")
		
		 
	


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/finish.tscn")
