use <../pieces/corner.scad>;
use <../pieces/edge.scad>;
use <../pieces/center.scad>;
use <../pieces/core.scad>;

include <../settings/default.scad>;

distance = piece_width;
//ease_in_out = (1 - cos(360*$t))/2;
//distance = 2*piece_width*ease_in_out;

translate([0, 0, 0.001]) // HACK: Avoid OpenSCAD coloring bug.
color("red")
for(r = [
    [0, 0, 0], [0, 0, 1], [0, 0, 2], [0, 0, 3],
    [1, 0, 0], [2, 0, 0], [0, 2, 0], [3, 2, 0],
])
rotate(r*90)
translate([1, 1, -1] * distance)
CornerPiece();

translate([0, 0, -0.001]) // HACK: Avoid OpenSCAD coloring bug.
color("blue")
for(r = [
    [0, 0, 0], [0, 0, 1], [0, 0, 2], [0, 0, 3],
    [0, 1, 0], [0, 1, 1], [0, 1, 2], [0, 1, 3],
    [1, 0, 0], [1, 0, 1], [1, 0, 2], [1, 0, 3],
])
rotate(r*90)
translate([0, 1, -1] * distance)
EdgePiece();

color("yellow")
for(r = [
    [0, 0], [0, -1], [0, 1],
    [-1, 0], [1, 0], [2, 0],
])
rotate(90*r)
translate([0, 0, -1] * distance)
CenterPiece();

color("white")
CorePiece();
