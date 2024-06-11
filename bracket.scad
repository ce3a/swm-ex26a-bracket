
$fn = 500;  // smoothness

h = 7;      // cylinder hight
r = 27.1;   // cylinder radius
s = 0.5;    // cylinder "conicalness"
t = 2.0;    // cyclinder wall thickness
d = 12.0;   // bridge width

sw = 8.2;   // sensor width
sh = 10;    // sensor hight (without laser window)
sm = 9.5;   // sensor mounting hole position 
lw = 6.2;   // laser window width
lh = 2.1;   // laser window hight

difference() {
    cylinder(h, r-s, r, true);
    translate([0, 0, -1]) cylinder(h+3, r-t, r-t, true);
}

difference() {
    union() {
        cube([d, (r-t)*2, h], true);
        translate([0, -r/2-t, h/2-lh-2])
        rotate([0, -90])
        linear_extrude(d, center=true){
            minkowski() {
                square([sh-2, (r*1.5-t)]);
                circle(2);
            }
        }
    }
    union(){        
        translate([0, 0, sm-(h/2) ]) {
            rotate([0, -90]) {
                translate([0, -r*0.5]) cylinder(d+1, 1.6, 1.6, true);
                translate([0, r-t-4]) cylinder(d+1, 1.6, 1.6, true);
            }
            translate([0, r*0.5/2-3]) cube([d+0.9, r*1.5-6, 1.6*2], true);
        }
    }
    translate([0, 0, h]) cube([sw, r*2, h], true);
    translate([0, 0, lh]) cube([sw, (r-t)*2, h], true);
    translate([0, (r-t)/2-8, -2]) cube([lw, r*1.2, h], true);
}
