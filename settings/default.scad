include <./development.scad>;
//include <./production.scad>;

width = 57;
piece_bevel = 1;
skid_bevel = 4;

plate_thickness = 6;

piece_width = (width - 2*piece_gap) / 3;
skid_width = piece_width/2 - 2*piece_gap;
outer_width = width/2 - piece_width/4;
length = piece_width/2 + skid_width/2 + piece_gap;
plate_radius = 1.25*piece_width;

cylinder_resolution = 2*resolution;
sphere_resolution = 8*resolution;
