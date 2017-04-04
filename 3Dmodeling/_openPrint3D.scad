
//chassis
translate([0,190,140]) {
color([0.8,0.8,0])  cube([500,20,20]);
}

module equerre (){
cube([20,400,20]);

rotate([35, 0, 0]) cube([20,250,20]);

mirror([0,1,0]) translate([0,-400,0]) rotate([35, 0, 0]) cube([20,250,20]);
}

color([0.8,0.8,0]) equerre ();
color([0.8,0.8,0]) translate([480,0,0]) equerre ();

//plateforme
translate([0,200,0]) {
  color([0.8,0.8,0.88]) cube([500,120,5]);
};
translate([0,200,0]) {
  color([0.8,0.8,0.88])  cube([500,5,140]);
};


//bombe
translate([100,260,0]) {
color([0.8,0.8,0.88])  can();
    }

module can (){
cylinder(120, 40, 40, center = false);
translate ([0,0,120]) sphere(r = 40);
cylinder(180, 14, 14, center = false);
cylinder(195, 6, 6, center = false);
}

//rail
translate([0,199,70]) {
  color([0.5,0.5,0.5]) cube([500,1,10]);
};
translate([0,197,65]) {
  color([0.5,0.5,0.5]) cube([500,2,20]);
};
    
translate([0,196,67]) {
  color([0.5,0.5,0.5]) cube([500,1,16]);
};
translate([0,194,65]) {
  color([0.5,0.5,0.5]) cube([500,2,20]);
};

//chariot
module chariot (){
cube([40,2,40]);
translate([0,-30,0])cube([40,30,2]);
translate([5,5,5])rotate([90, 0, 0]) cylinder(2, 5, 5, center = false);
translate([5,5,35])rotate([90, 0, 0]) cylinder(2, 5, 5, center = false);
translate([35,5,5])rotate([90, 0, 0]) cylinder(2, 5, 5, center = false);
translate([35,5,35])rotate([90, 0, 0]) cylinder(2, 5, 5, center = false);
}

translate([80,192.5,55]) color([0.8,0,0]) chariot();

//moteurX
module motor (){
import("/openPrint/3Dmodeling/Stepper Motor-5mm-Shaft NEMA-17.stl");
translate([-8,-8,32]) rotate([0, 0, 0])import("/openPrint/3Dmodeling/5mm_2GT-20_Teeth_Timing_Pulley_Wheel.STL");
translate([-8,460,32]) rotate([0, 0, 0])import("/openPrint/3Dmodeling/5mm_2GT-20_Teeth_Timing_Pulley_Wheel.STL");
}

translate([20,225,75]) rotate([90, 90, 0]) color([0.3,0.3,0.3]) motor();

module trigger (){
rotate([0,0,180])import("/openPrint/3Dmodeling/Servo_controlled_Silly-String_Trigger/bracket.stl");
rotate([90,-30,180])translate([32,34,-7])import("/openPrint/3Dmodeling/Servo_controlled_Silly-String_Trigger/trigger.stl");
}

translate([100,260,175]) color([0.8,0,0]) rotate([0,0,-90]) trigger();

module roues (){
translate([-5,15,15])rotate([90, 90, 90]) cylinder(4, 20, 20, center = false);
translate([-5,385,15])rotate([90, 90, 90]) cylinder(4, 20, 20, center = false);
}

color([0.3,0.3,0.3]) roues ();
translate([506,0,0]) color([0.3,0.3,0.3]) roues ();

translate([-5,15,15])rotate([90, 90, 90]) cylinder(510, 2.5, 2.5, center = false);
translate([-5,385,15])rotate([90, 90, 90]) cylinder(510, 2.5, 2.5, center = false);

translate([480,225,25]) rotate([180, 90, 0]) color([0.3,0.3,0.3]) motor();

