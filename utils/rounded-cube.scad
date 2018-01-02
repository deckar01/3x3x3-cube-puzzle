module RoundedCube(size, bevel, resolution) {
    if(len(size) == undef) {
        _RoundedCube([1, 1, 1] * size, bevel, resolution);
    } else {
        _RoundedCube(size, bevel, resolution);
    }
}

module _RoundedCube(size, bevel, resolution) {
    cut = [[0, 1, 1], [1, 0, 1], [1, 1, 0]];
    axis = [[0, 1, 0], [1, 0, 0], [0, 0, 0]];
    for(i = [0, 1, 2]) {
        // Faces
        cube(size - 2*bevel*cut[i], center=true);
        // Rounded edges
        for(x = [-1, 1]) for(y = [-1, 1]) for(z = [-1, 1])
        translate([
          x*cut[i][0]*(size[0]/2 - bevel),
          y*cut[i][1]*(size[1]/2 - bevel),
          z*cut[i][2]*(size[2]/2 - bevel)
        ])
        rotate(90*axis[i])
        cylinder(r=bevel, h=size[i] - 2*bevel, center=true, $fn=2*resolution);
    }
    // Rounded corners
    for(x = [-1, 1]) for(y = [-1, 1]) for(z = [-1, 1])
    translate([
      x*(size[0]/2 - bevel),
      y*(size[1]/2 - bevel),
      z*(size[2]/2 - bevel)
    ])
    sphere(r=bevel, $fn=2*resolution);
}
