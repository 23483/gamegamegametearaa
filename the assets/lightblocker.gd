extends StaticBody2D

func _ready():
	for collision in get_children():
		if collision is CollisionShape2D:
			var shape = collision.shape

			if shape is RectangleShape2D:
				var half = shape.size / 2.0

				var occluder = LightOccluder2D.new()
				var polygon = OccluderPolygon2D.new()

				polygon.polygon = PackedVector2Array([
					Vector2(-half.x, -half.y),
					Vector2(half.x, -half.y),
					Vector2(half.x, half.y),
					Vector2(-half.x, half.y)
				])

				occluder.occluder = polygon
				occluder.position = collision.position
				add_child(occluder)
