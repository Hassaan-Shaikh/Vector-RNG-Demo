class_name VectorRNG
extends RandomNumberGenerator
## VectorRNG extends RandomNumberGenerator to add additional functionality to the random number genration,
## mainly generating a random point in Vector space.

## Returns a random point inside a sphere, using the origin position(centroid) and the radius of the sphere.
## Works in 3D space.
func rand_inside_unit_sphere(origin: Vector3 = Vector3.ZERO, radius: float = 1.0) -> Vector3:
	while true:
		var point = Vector3(
			randf_range(-1.0, 1.0),
			randf_range(-1.0, 1.0),
			randf_range(-1.0, 1.0)
		)
		if point.length_squared() <= 1.0:
			return origin + point * radius
	return origin

## Returns a random point inside a cube, using the origin position(centroid) and the dimensions(size) of the cube.
## Works in 3D space.
func rand_inside_unit_cube(origin: Vector3 = Vector3.ZERO, dimensions: Vector3 = Vector3.ONE) -> Vector3:
	var x_min: float = origin.x - dimensions.x / 2
	var x_max: float = origin.x + dimensions.x / 2
	
	var y_min: float = origin.y - dimensions.y / 2
	var y_max: float = origin.y + dimensions.y / 2
	
	var z_min: float = origin.z - dimensions.z / 2
	var z_max: float = origin.z + dimensions.z / 2
	
	var x_point: float = randf_range(x_min, x_max)
	var y_point: float = randf_range(y_min, y_max)
	var z_point: float = randf_range(z_min, z_max)
	
	return Vector3(x_point, y_point, z_point)

## Returns a random point on a plane, using the origin position(centroid) and the dimensions(size) of the plane.
## Since a plane is a two-dimensional shape in 3D space, the orientation(UP, RIGHT or FORWARD vector) is used to
## determine where the point will be generated.
## Works in 3D space.
func rand_on_unit_plane(origin: Vector3 = Vector3.ZERO, dimensions: Vector2 = Vector2.ONE, orientation: Vector3 = Vector3.UP) -> Vector3:
	var x_min: float = origin.x - dimensions.x / 2
	var x_max: float = origin.x + dimensions.x / 2
	
	var y_min: float = origin.y - dimensions.y / 2
	var y_max: float = origin.y + dimensions.y / 2
	
	var x_point: float = randf_range(x_min, x_max)
	var y_point: float = randf_range(y_min, y_max)
	
	var composed_point: Vector3 = Vector3.ZERO
	match orientation:
		Vector3.UP:
			composed_point = Vector3(x_point, origin.y, y_point)
		Vector3.RIGHT:
			composed_point = Vector3(origin.x, x_point, y_point)
		Vector3.FORWARD:
			composed_point = Vector3(x_point, y_point, origin.z)
	return composed_point

## Returns a random point inside a rectangle, using the origin position(center) and dimensions(size) of the recatngle.
## Works in 2D space.
func rand_inside_unit_rectangle(origin: Vector2 = Vector2.ZERO, dimensions: Vector2 = Vector2.ONE) -> Vector2:
	var x_min: float = origin.x - dimensions.x / 2
	var x_max: float = origin.x + dimensions.x / 2
	
	var y_min: float = origin.y - dimensions.y / 2
	var y_max: float = origin.y + dimensions.y / 2
	
	var x_point: float = randf_range(x_min, x_max)
	var y_point: float = randf_range(y_min, y_max)
	
	return Vector2(x_point, y_point)

## Returns a random point inside a circle, using the origin position(center) and the radius of the circle.
## Works in 2D space.
func rand_inside_unit_circle(origin: Vector2 = Vector2.ZERO, radius: float = 1.0) -> Vector2:
	while true:
		var point = Vector2(
			randf_range(-1.0, 1.0),
			randf_range(-1.0, 1.0)
		)
		if point.length_squared() <= 1.0:
			return origin + point * radius
	return origin
