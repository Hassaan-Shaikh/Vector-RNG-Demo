extends Node2D

const FORMAT_STRING: String = "%2.3f"

@onready var pointer_location: Label = $CanvasLayer/PointerLocation
@onready var shape_info: Label = $CanvasLayer/ShapeInfo
@onready var pointer: Sprite2D = $Pointer
@onready var ring_display: Sprite2D = %RingDisplay
@onready var square_display: Sprite2D = %SquareDisplay

var vec_rng: VectorRNG = VectorRNG.new()
var point_generated: Vector2 = Vector2.ZERO
var current_display_shape: int = 0

func _ready() -> void:
	var formatted_radius = FORMAT_STRING % (ring_display.texture.get_height() * ring_display.scale.y / 2)
	shape_info.text = "Circle Radius: " + formatted_radius
	
	for child in get_children():
		child.visible = visible

func generate_point() -> void:
	if ring_display.visible:
		point_generated = vec_rng.rand_inside_unit_circle(ring_display.global_position, \
		ring_display.texture.get_height() * ring_display.scale.y / 2)
	elif square_display.visible:
		point_generated = vec_rng.rand_inside_unit_rectangle(square_display.global_position, \
		square_display.texture.get_size() * square_display.scale)
	
	pointer.global_position = point_generated
	
	var x_string = FORMAT_STRING % point_generated.x
	var y_string = FORMAT_STRING % point_generated.y
	pointer_location.text = "Pointer's Location: (" + x_string + ", " + y_string + ")"

func _on_visibility_changed() -> void:
	for child in get_children():
		child.visible = visible

func _on_generate_button_pressed() -> void:
	generate_point()

func _on_switch_shape_button_pressed() -> void:
	current_display_shape = wrapi(current_display_shape + 1, 0, 2)
	ring_display.visible = current_display_shape == 0
	square_display.visible = current_display_shape == 1
	
	match current_display_shape:
		0:
			var formatted_radius = FORMAT_STRING % (ring_display.texture.get_height() * ring_display.scale.y / 2)
			shape_info.text = "Circle Radius: " + formatted_radius
		1:
			var square_x = FORMAT_STRING % (square_display.texture.get_size() * square_display.scale).x
			var square_y = FORMAT_STRING % (square_display.texture.get_size() * square_display.scale).y
			shape_info.text = "Box Size: (" + square_x + ", " + square_y + ")"
