/*rotate_extrude(convexity = 10, $fn = 100)
translate([2, 0, 0])
circle(6, $fn = 100);*/
difference(){
translate([0, 0, -4])
cylinder(8,25,25, $fn = 100);

rotate_extrude(convexity = 10, $fn = 100)
translate([25, 0, 0])
circle(3.5, $fn = 100);

translate([0, 0, -5])
cylinder(10,16,16,  $fn = 100);
    
 rotate_extrude(convexity = 10, $fn = 100)
translate([16, 0, 0])
circle(1, $fn = 100);
}