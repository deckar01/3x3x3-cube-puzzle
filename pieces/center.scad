use <../utils/rounded-cube.scad>;
include <../settings/default.scad>;
include <../settings/screw.scad>;

module CenterPiece() {
  difference() {
    union() {
      // Cube
      difference() {
        translate([0, 0, -3*piece_width/2 - piece_gap + piece_bevel])
        RoundedCube(
          [piece_width, piece_width, 2*piece_bevel],
          piece_bevel,
          resolution
        );
        
        sphere(r=plate_radius + piece_gap, center=true, $fn=sphere_resolution);
      }

      // Axle
      difference() {
        translate([0, 0, -width/2])
        cylinder(r=skid_width/2, h=width/2, $fn=cylinder_resolution);
        
        sphere(r=plate_radius - plate_thickness, center=true, $fn=sphere_resolution);
      }
    }

    // Countersink
    outer_radius = screw_head_diameter/2 + piece_gap;
    inner_radius = screw_diameter/2 + piece_gap;
    translate([0, 0, -width/2 - screw_head_thickness])
    cylinder(
      r1=2*outer_radius,
      r2=inner_radius,
      h=2*screw_head_thickness,
      $fn=cylinder_resolution
    );

    // Screw hole
    translate([0, 0, -width/2 - 0.1])
    cylinder(r=screw_diameter/2 + piece_gap, h=width/2, $fn=cylinder_resolution);
  }
}

CenterPiece();
