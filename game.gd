extends Node3D

func _ready():
	setup_viewport()

func setup_viewport():
	# assign variables
	Singleton.viewport_container = $SubViewportContainer
	Singleton.viewport = $SubViewportContainer/SubViewport
	
	# adjust viewport to resolution
	Singleton.viewport.size = Singleton.viewport_resolution
	Singleton.viewport_container.size = Singleton.viewport_resolution
	var viewport_scale = Vector2i.ONE * Singleton.PIXEL_SCALE
	Singleton.viewport_container.position = -viewport_scale
	Singleton.viewport_container.scale = viewport_scale
