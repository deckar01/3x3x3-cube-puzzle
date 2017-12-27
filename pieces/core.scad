include <../settings/default.scad>;
include <../settings/screw.scad>;

core_radius = plate_radius - plate_thickness - piece_gap;

module CorePiece() {
    difference() {
        sphere(r=core_radius, center=true, $fn=sphere_resolution);
        
        for(r = [
          [0, 0, 0], [0, 1, 0], [1, 0, 0],
          [2, 1, 0], [0, 2, 0], [3, 0, 0],
        ])
        rotate(r*90)
        translate([0, 0, width/2 + screw_diameter])
        cylinder(r=(screw_diameter - piece_gap)/2, h=width, $fn=cylinder_resolution, center=true);
    }
}
