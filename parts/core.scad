use <../pieces/core.scad>;

include <../settings/default.scad>;

difference() {
    rotate([45, 37.5, 0])
    CorePiece();

    translate([0, 0, -width])
    cube(2*width, center=true);
}
