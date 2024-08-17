extends Control

const FORMAT_STRING: String = "Switch to %dD scene"

@onready var scene_2d: Node2D = $Test2D
@onready var scene_3d: Node3D = $Test3D
@onready var switch_scene: Button = $SwitchScene

func _ready() -> void:
	scene_2d.show()
	scene_3d.hide()
	format_string()

func _on_switch_scene_pressed() -> void:
	scene_2d.visible = not scene_2d.visible
	scene_3d.visible = not scene_3d.visible
	
	format_string()

func format_string() -> void:
	if scene_2d.visible:
		switch_scene.text = FORMAT_STRING % 3
	else:
		switch_scene.text = FORMAT_STRING % 2
