use <../utils/rounded-cube.scad>;
include <../settings/default.scad>;

module CornerPiece() {
    union() {
        // Cube
        difference() {
            translate([1, 1, -1] * (piece_width + piece_gap))
            RoundedCube(piece_width, piece_bevel, resolution);
            
            sphere(r=plate_radius - plate_thickness/2, center=true, $fn=sphere_resolution);
        }
        
        // Contact plate
        difference() {
            intersection() {
                sphere(r=plate_radius, center=true, $fn=sphere_resolution);
                
                translate([0, 0, -piece_width - piece_gap])
                translate([width/2 - outer_width/2, length, (outer_width - piece_width)/2])
                RoundedCube([outer_width, piece_width, outer_width], skid_bevel, resolution);
            }
        
            sphere(r=plate_radius - plate_thickness, center=true, $fn=sphere_resolution);
        }
    }
}
