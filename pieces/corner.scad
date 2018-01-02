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
                
                translate([1, 1, -1] * length)
                RoundedCube(
                    [piece_width, piece_width, piece_width],
                    skid_bevel,
                    resolution
                );
            }
        
            sphere(r=plate_radius - plate_thickness, center=true, $fn=sphere_resolution);
        }
    }
}

CornerPiece();
