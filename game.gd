extends Node3D

func _ready():
	setup_viewport()
	DebugDraw2D.create_fps_graph("GRAPH")

func _process(_delta):
	# Debug stuff
	DebugDraw2D.set_text("FPS", Engine.get_frames_per_second())
	#DebugDraw3D.draw_gizmo(Transform3D.IDENTITY)

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
