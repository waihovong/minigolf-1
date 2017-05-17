# Status of `entities` branch

The new collision physics system is now in place. There are two main classes:

* **`Ball(float x, float y, float radius)`** represents the (or technically a) golf ball in the environment. It takes three arguments: an initial `x` coordinate, an initial `y` coordinate, and a `radius`. Its location is determined by the values of two vectors: `position` and `velocity`, with the current value of `velocity` added to `position` by calling the `update()` method.

* **`Object(float... coords)`** represents an environmental object that is subject to collisions with the ball. It takes an arbitrary number of arguments (although the number must be divisible by two), which are pairs of coordinates representing the vertices of the object. An `Object` with only two arguments is a point; one with four arguments is a line, and one with six or more arguments is a polygon.

Collision physics are handled by calling one of two functions:

* **`checkPolygonCollision(Ball ball, Object poly)`** takes a Ball and an Object as arguments, and is used for testing collisions with polygons.

* **`checkLineCollision(Ball ball, PVector la, PVector la)`** takes a Ball and two vectors representing the endpoints of the line segment as arguments. This function is actually called by `checkPolygonCollision()` internally, as polygons are handled by breaking them up into constitutent line segments, but it can also be called directly to minimize the number of calculations done per frame, e.g. to test collisions with the boundaries of the canvas.

I might need to do some optimization of how things are handled. For example, right now, the system just tests for collisions on every line segment in the map for every frame. This probably won't scale very well. I'll have a think about how I can streamline things, perhaps by only checking against lines within a certain distance of the ball. I'll also try to build in some more features, so let me know if there's anything you guys think would be useful!
