use <../pieces/corner.scad>;
use <../pieces/edge.scad>;
use <../pieces/center.scad>;
use <../pieces/core.scad>;

translate([0, 0.005, 0.005]) // HACK: Avoid OpenSCAD coloring bug.
color("red")
for(r = [
    [0, 0, 0], [0, 0, 1], [0, 0, 2], [0, 0, 3],
    [1, 0, 0], /*[2, 0, 0],*/ [0, 2, 0], [3, 2, 0],
])
rotate(r*90)
CornerPiece();

translate([0, -0.005, -0.005]) // HACK: Avoid OpenSCAD coloring bug.
color("blue")
for(r = [
    [0, 0, 0], [0, 0, 1], [0, 0, 2], [0, 0, 3],
    [0, 1, 0], [0, 1, 1], /*[0, 1, 2],*/ [0, 1, 3],
    [1, 0, 0], [1, 0, 1], /*[1, 0, 2], [1, 0, 3],*/
])
rotate(r*90)
EdgePiece();

color("yellow")
for(r = [
    [0, 0], /*[0, -1],*/ [0, 1],
    /*[-1, 0],*/ [1, 0], [2, 0],
])
rotate(90*r)
CenterPiece();

color("white")
CorePiece();
