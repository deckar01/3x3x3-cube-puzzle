use <../utils/rounded-cube.scad>;
include <../settings/default.scad>;
include <../settings/screw.scad>;

module CenterPiece() {
    difference() {
        union() {
            difference() {
                translate([0, 0, -width/2])
                cylinder(r=skid_width/2, h=width/2, $fn=cylinder_resolution);
                
                sphere(r=plate_radius - plate_thickness, center=true, $fn=sphere_resolution);
            }
            
            difference() {
                translate([0, 0, -1] * (piece_width + piece_gap + piece_width/4 + piece_bevel))
                RoundedCube([piece_width, piece_width, piece_width/2 - 2*piece_bevel], piece_bevel, resolution);
                
                sphere(r=plate_radius + piece_gap, center=true, $fn=sphere_resolution);
            }
        }
        
        translate([0, 0, -width/2 - 0.1])
        cylinder(r=screw_diameter/2 + piece_gap, h=width/2, $fn=cylinder_resolution);
        
        translate([0, 0, -width + screw_head_thickness + piece_gap])
        cylinder(r=screw_head_diameter/2 + piece_gap, h=width/2, $fn=cylinder_resolution);
    }
}
