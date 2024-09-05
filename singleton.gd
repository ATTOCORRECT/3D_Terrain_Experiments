extends Node

var viewport_container : SubViewportContainer = null
var viewport : SubViewport = null

const PIXEL_SCALE = 3

var window_resolution = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"),
								ProjectSettings.get_setting("display/window/size/viewport_height"))

var render_resolution = window_resolution / PIXEL_SCALE

var viewport_resolution = render_resolution + Vector2.ONE * 2
