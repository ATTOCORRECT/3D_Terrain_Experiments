extends CharacterBody3D

const MOUSE_SENSITIVITY = 0.002  # radians/pixel

var speed = 10.0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Vector3(
	Input.get_axis("game_left","game_right"),       # X
	Input.get_axis("game_down","game_up"),          # Y
	Input.get_axis("game_forward","game_backward")) # Z

	var direction = (transform.basis * input_dir).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()

func _unhandled_input(event):
	# Looking Around
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		$Pivot.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -1.2, 1.2)

	# Changing Speed
	if event is InputEventMouseButton:
		if event.is_pressed():
			# Scroll up
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				speed *= 1.1 # speed up
			# Scroll down
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				speed /= 1.1 # speed down
