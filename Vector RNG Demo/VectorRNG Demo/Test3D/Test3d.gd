extends Node3D

const FORMAT_STRING: String = "%2.3f"

@onready var pointer: MeshInstance3D = $Pointer
@onready var sphere_display: MeshInstance3D = %SphereDisplay
@onready var box_display: MeshInstance3D = %BoxDisplay
@onready var plane_display: MeshInstance3D = %PlaneDisplay
@onready var pointer_location: Label = $PointerLocation
@onready var shape_info: Label = $ShapeInfo

var vec_rng: VectorRNG = VectorRNG.new()
var point_generated: Vector3 = Vector3.ZERO
var current_display_shape: int = 0

func _ready() -> void:
	for child in get_children():
		if child is WorldEnvironment:
			continue
		child.visible = visible

func generate_point() -> void:
	if sphere_display.visible:
		point_generated = vec_rng.rand_inside_unit_sphere(sphere_display.global_position, \
		sphere_display.mesh.get("radius"))
	elif box_display.visible:
		point_generated = vec_rng.rand_inside_unit_cube(box_display.global_position, \
		box_display.mesh.get("size"))
	elif plane_display.visible:
		point_generated = vec_rng.rand_on_unit_plane(plane_display.global_position, \
		plane_display.mesh.get("size"))
	
	pointer.global_position = point_generated
	
	var x_string = FORMAT_STRING % point_generated.x
	var y_string = FORMAT_STRING % point_generated.y
	var z_string = FORMAT_STRING % point_generated.z
	pointer_location.text = "Pointer's Location: (" + x_string + ", " + y_string + ", " + z_string + ")"

func _on_generate_button_pressed() -> void:
	generate_point()

func _on_switch_shape_button_pressed() -> void:
	current_display_shape = wrapi(current_display_shape + 1, 0, 3)
	sphere_display.visible = current_display_shape == 0
	box_display.visible = current_display_shape == 1
	plane_display.visible = current_display_shape == 2
	
	match current_display_shape:
		0:
			var formatted_radius = FORMAT_STRING % sphere_display.mesh.get("radius")
			shape_info.text = "Sphere Radius: " + formatted_radius
		1:
			var box_x = FORMAT_STRING % (box_display.mesh.get("size") as Vector3).x
			var box_y = FORMAT_STRING % (box_display.mesh.get("size") as Vector3).y
			var box_z = FORMAT_STRING % (box_display.mesh.get("size") as Vector3).z
			shape_info.text = "Box Size: (" + box_x + ", " + box_y + ", " + box_z + ")"
		2:
			var plane_x = FORMAT_STRING % (plane_display.mesh.get("size") as Vector2).x
			var plane_y = FORMAT_STRING % (plane_display.mesh.get("size") as Vector2).y
			shape_info.text = "Plane Size: (" + plane_x + ", " + plane_y + ")"

func _on_visibility_changed() -> void:
	for child in get_children():
		if child is WorldEnvironment:
			continue
		child.visible = visible
