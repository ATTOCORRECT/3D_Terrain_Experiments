extends Node3D

var pixels_per_unit

func _ready():
	pixels_per_unit = Singleton.viewport_resolution.y / $Camera3D.size

func _process(delta):
	var global_in_local_position = to_local(Vector3.ZERO)
	var offset = Vector3(fmod(global_in_local_position.x , 1.0 / pixels_per_unit), 
						 fmod(global_in_local_position.y , 1.0 / pixels_per_unit),
						 fmod(global_in_local_position.z , 1.0 / pixels_per_unit))
	
	$Camera3D.position = offset
	
	var pixel_offset = Vector2(offset.x, -offset.y) * pixels_per_unit
	Singleton.viewport_container.material.set_shader_parameter("cam_offset", pixel_offset)
# wow
