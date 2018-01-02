use <../utils/rounded-cube.scad>;
include <../settings/default.scad>;

module EdgePiece() {
  difference() {
    union() {
      // Cube
      difference() {
        translate([0, 1, -1] * (piece_width + piece_gap))
        RoundedCube(piece_width, piece_bevel, resolution);
        
        sphere(r=plate_radius + piece_gap, center=true, $fn=sphere_resolution);
      }

      // Contact skid
      difference() {
        intersection() {
          sphere(r=plate_radius, center=true, $fn=sphere_resolution);

          translate([0, length, -length])
          RoundedCube(
            [skid_width, piece_width, piece_width],
            skid_bevel,
            resolution
          );
        }

        sphere(
          r=plate_radius - plate_thickness,
          center=true,
          $fn=sphere_resolution
        );
      }

      // Skid connector
      difference() {
        intersection() {
          sphere(
            r=plate_radius + 2*piece_gap,
            center=true,
            $fn=sphere_resolution
          );

          translate([0, 1, -1] * (piece_width + piece_gap + skid_bevel))
          cube([skid_width/2, piece_width, piece_width], center=true);
        }

        sphere(
          r=plate_radius - plate_thickness/2,
          center=true,
          $fn=sphere_resolution
        );
      }
    }
  }
}

EdgePiece();
