use <../pieces/corner.scad>;

include <../settings/default.scad>;

// Slice the corner into 3 parts to avoid post print coloring
// and minimize overhangs.

rotate([45, 0, 0])
difference() {
    CornerPiece();

    rotate([-45, 0, 0])
    translate([0, 0, -width])
    cube(2*width, center=true);
    
    rotate([0, 0, 45])
    translate([0, -width, -width])
    cube(2*width, center=true);
}
