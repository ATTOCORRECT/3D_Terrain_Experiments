extends VehicleBody3D

const MAX_RPM = 500
const MAX_TORQUE = 2000


func _physics_process(delta):
	
	var speed = linear_velocity.length() 
	var steering_limit = lerpf(1.2, 0.5, speed / (1 + speed))
	steering = lerp(steering, Input.get_axis("drive_steer_right","drive_steer_left") * steering_limit, 5 * delta)
	
	var acceleration = Input.get_axis("drive_accelerate","drive_brake") * MAX_TORQUE
	
	var rpm
	rpm = $Wheel_Front_Left.get_rpm()  # Front Left
	$Wheel_Front_Left.engine_force  = acceleration * ( 1 - (abs(rpm) / MAX_RPM))
	rpm = $Wheel_Front_Right.get_rpm() # Front Right
	$Wheel_Front_Right.engine_force = acceleration * ( 1 - (abs(rpm) / MAX_RPM))
	rpm = $Wheel_Back_Left.get_rpm()   # Back Left
	$Wheel_Back_Left.engine_force   = acceleration * ( 1 - (abs(rpm) / MAX_RPM))
	rpm = $Wheel_Back_Right.get_rpm()  # Back Right
	$Wheel_Back_Right.engine_force  = acceleration * ( 1 - (abs(rpm) / MAX_RPM))
	
	if Input.is_action_just_pressed("game_up"):
		linear_velocity.y = 20
		angular_velocity.z = 2
