difference() {
  translate([0,0,-1])  cylinder(1,60,60, $fn=100);
translate([0,0,-2]) cylinder(3,58,58, $fn=100);
}
difference() {
  translate([0,0,-1])  cylinder(1,54,54, $fn=100);
translate([0,0,-2]) cylinder(3,50,50, $fn=100);
}
difference() {
  translate([0,0,-1])  cylinder(1,46,46, $fn=100);
translate([0,0,-2]) cylinder(3,42,42, $fn=100);
}
difference() {
  translate([0,0,-1])  cylinder(1,38,38, $fn=100);
translate([0,0,-2]) cylinder(3,34,34, $fn=100);
}
difference() {
  translate([0,0,-1])  cylinder(1,30,30, $fn=100);
translate([0,0,-2]) cylinder(3,26,26, $fn=100);
}
difference() {
  translate([0,0,-1])  cylinder(1,22,22, $fn=100);
translate([0,0,-2]) cylinder(3,18,18, $fn=100);
}
difference() {
  translate([0,0,-1])  cylinder(1,14,14, $fn=100);
translate([0,0,-2]) cylinder(3,7,7, $fn=100);
}



difference() {
    cylinder(1,60,60, $fn=100);
translate([0,0,-1]) cylinder(10,7,7, $fn=100);
}

difference() {
  translate([0,0,1])  cylinder(5,59.2,59.2, $fn=100);
translate([0,0,0]) cylinder(10,7,7, $fn=100);
}

difference() {
translate([0,0,6])    cylinder(1,60,60, $fn=100);
translate([0,0,5]) cylinder(10,7,7, $fn=100);
}

difference() {
   translate([0,0,7]) cylinder(5,59.2,59.2, $fn=100);
translate([0,0,6]) cylinder(10,7,7, $fn=100);
}

difference() {
translate([0,0,12])    cylinder(1,60,60, $fn=100);
translate([0,0,11]) cylinder(10,7,7, $fn=100);
}

difference() {
   translate([0,0,13]) cylinder(12,16,16, $fn=100);
    translate([0,0,12]) cylinder(22,7,7, $fn=50);
    rotate ([90,0,0]) translate([0,19,5]) cylinder(12,2,2, $fn=50);
     translate([-5,-13,12])  cube(size = [10,4,14]);
}
