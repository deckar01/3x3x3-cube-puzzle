use <../pieces/Edge.scad>;
use <../utils/rounded-cube.scad>;

include <../settings/default.scad>;

// Slice the side into 2 parts to avoid post print coloring
// and minimize overhangs.

difference() {
    rotate([45, 0, 0])
    EdgePiece();
    

    translate([0, 0, -width])
    cube(2*width, center=true);
}
