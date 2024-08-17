# Vector RNG Demo
 This demo showcases the use of a custom-built class that extends RandomNumberGenerator to generate random points in vector space.

 ## Project Overview
  The project is composed of three scenes:
   - A 2D scene
   - A 3D scene
   - A HUD scene that encapsulates the above scenes

  There exists a custom written script that extends Godot's RandomNumberGenerator class. This script makes use of RandomNumberGenerator's built-in methods to generate random points in Vector space, both 2D and 3D!
  The example scenes make use of some of the custom written functions to generate a vector point within world space.

 ## Scene Overview
  - Common
    * Controls to change the shape and generate a new point are provided.
    * Scene info to tell what is being done.
    * Provided a button to switch between the 2D scene and the 3D scene.
    * Displays data about the pointer's location and the current shape's size.
   
  - 2D Scene
    * The godot icon is used as a pointer to showcase the random generation within the boundaries of a circle and a rectangle.
    * Hand-made circle and rectangle shapes used as sprite textures to showcase the within-boundary generation.

  - 3D Scene
    * A red sphere is used as a pointer to showcase the random generation within the boundaries of a sphere, a box and a plane.
    * Uses two SubViewports to create a splitscreen, divided by a Line2D to show the random generation from two angles.
    * Sphere, Box and Plane are MeshInstances with "Flip Faces" enabled (except Plane) to showcase the within-boundary generation.
   
 ## Uses
  - _AI Navigation_: Generate a random point in world space where the navigation agent can travel to.
  - _Spawning Objects_: Instantiate objects at random points.
  - _Particle Systems_: Emit particles at random points.
  
 ## Limitations
  - **Complex Shapes**: The current implementation does not support complex shapes. Only boxes, planes and spheres/circles are supported.
  - **Position-based Generation**: The implementation only generates points based on a shape's position and size. Rotation is not taken into account. Planes, however, use Vector axes (UP, RIGHT, FORWARD) to generate points by exluding the specified axis.


 ### Discalimer
 The graphical shapes in both 2D and 3D scenes are used only to showcase and verify the random generation within bounds.
