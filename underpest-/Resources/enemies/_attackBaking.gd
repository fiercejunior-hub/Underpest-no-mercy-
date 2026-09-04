@tool
extends EditorScript
func _run() -> void:
	var samples : Array = EditorInterface.get_edited_scene_root().get_child(0).get_children()
	if (samples):
		_drawCircle(samples, Vector2.ZERO, 128)
	else: print("cannot bake!")
	print(EditorInterface.get_edited_scene_root().get_child(0))
func _drawCircle(samples : Array, center : Vector2, radius : float) -> void:
	var angle = 0
	var n = samples.size()
	for sample in samples:
		sample.position = center + Vector2(cos(angle), sin(angle)) * radius
		angle += deg_to_rad(360)/n
