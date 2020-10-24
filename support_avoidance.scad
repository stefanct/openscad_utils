overhang_angle=55;

module triangle(top_angle=60, oppo_len=10) {
  h=oppo_len/2/tan(top_angle/2);

  translate([0, h]) // move baseline to y=0
    polygon(points=[[-oppo_len/2,-h],[0,0],[oppo_len/2,-h]]);
}

module triangular_prism(w, depth, top_angle) { // extruded triangle
  rotate([90, 0, 0])
    linear_extrude(height=depth)
      triangle(top_angle=top_angle, oppo_len=w);
}

module supportless_arc_top(arc_base_w, depth) {
  tri_w = cos(overhang_angle)*arc_base_w; // width of a triangle that tangents the arc at overhang_angle
  arc_r = arc_base_w/2;
  z=-arc_r+arc_r*sin(overhang_angle); // offset from the center of the arc (i.e., height where the arc changes to a straight line)

  translate([0, 0, z])
    triangular_prism(tri_w, depth, overhang_angle*2);
}

// supportless_arc_top(arc_base_w, depth);
