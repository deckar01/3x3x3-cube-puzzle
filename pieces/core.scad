include <../settings/default.scad>;
include <../settings/screw.scad>;


module CorePiece() {
  difference() {
    // Ball
    core_radius = plate_radius - plate_thickness - piece_gap;
    sphere(r=core_radius, center=true, $fn=sphere_resolution);

    // Holes
    hole_radius = (screw_diameter - piece_gap)/2;
    hole_angles = [
      [0, 0, 0], [0, 90, 0], [90, 0, 0],
      [180, 90, 0], [0, 180, 0], [-90, 0, 0],
    ];
    for(hole_angle = hole_angles) {
      rotate(hole_angle)
      translate([0, 0, width/2 + screw_diameter])
      cylinder(r=hole_radius, h=width, $fn=cylinder_resolution, center=true);
    }
  }
}

CorePiece();
