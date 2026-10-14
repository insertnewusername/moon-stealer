extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var jump = false
var stars = 0
var alive = true
var attack = false

func _ready():
	animated_sprite_2d.animation_finished.connect(_on_animation_finished)
	# walking up slope stuff
	floor_max_angle = deg_to_rad(70.0)
	floor_snap_length = 9.0
	floor_stop_on_slope = true
func _physics_process(delta: float) -> void:
	

		
	if !alive:
		return
		
		
		
	
	if Input.is_action_just_pressed("attack") and not attack:
		attack = true
		$Chopinahhh.play()
		animated_sprite_2d.play("fight")

 
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
		animated_sprite_2d.flip_h = (direction < 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	


	if is_on_floor():  
		jump=false
		
	# Handle jump input
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump=true 
	

	# Animation Logic
	if not attack:
		if not is_on_floor():
			if animated_sprite_2d.animation != "jump":
				animated_sprite_2d.play("jump")
		elif direction != 0:
			animated_sprite_2d.play("walk")
		else:
			animated_sprite_2d.play("default")


	
	move_and_slide()
	
	

func score():
	stars = stars+1
	print(stars)
	
func die():
	$oof.play()
	alive = false
	animated_sprite_2d.play("ded")
	
func _on_animation_finished():

	if animated_sprite_2d.animation == "ded":
		respawn()
	elif animated_sprite_2d.animation == "fight":
		attack = false
		
func respawn():	
	alive = true
	attack = false
	global_position = Vector2(-346, 616)
	animated_sprite_2d.play("default")
	
func launch():
	velocity.y = -1000
	
func launchlaunch():
	velocity.y = -800
	velocity.x = -100000
	
	
func bounce():
	velocity.y = -500
	
func tp():
	global_position = Vector2(-345.108, -465.0276)
