include <BOSL2/std.scad>
include <BOSL2/wiring.scad>
module first() {
  union() {
    // body
    //translate([0, 0, 3.5])
      //cylinder(r = 50, h = 11.5);
    
    // frets
    translate([-7.5, 15, 14.65])
    cube([15, 2, 1]);
    
    translate([-7.5, 20, 14.75])
    cube([15, 2, 1]);
      
    translate([-7.5, 30, 14.9])
    cube([15, 2, 1]);
      
    translate([-7.5, 45, 14.15])
    cube([15, 2, 2]);
      
    translate([-7.5, 60, 14.39])
    cube([15, 2, 2]);
    
    translate([-7.5, 75, 14.6])
    cube([15, 2, 2]);
     
    //string
    wire_bundle([[-3,113.5,10], [-3,107.5,17.3], [-3, -25, 15]], wirediam=0.2,rounding=10,wires=1);
    
    wire_bundle([[-1,118.5,10], [-1,107.5,17.3], [-1, -25, 15]], wirediam=0.2,rounding=10,wires=1);
    
    wire_bundle([[1,125.5,10], [1,107.5,17.3], [1, -25, 15]], wirediam=0.2,rounding=10,wires=1);
   
    wire_bundle([[3,132.5,10.8], [3,107.5,17.3], [3, -25, 15]], wirediam=0.2,rounding=10,wires=1);
     
    // tuning pegs with spherical tops
    for (k = [[5, 118, 10], [5, 133, 10], [-5, 112, 10], [-5, 127, 10]]) {
      translate([k[0], k[1], k[2]])
      rotate([0, k[0] > 0 ? 270 : 90, 0]) {
        cylinder(r1 = 1.5, r2 = 4, h = 40,$fn=100);
        translate([0, 0, 40])  // moving to the top of the cylinder
          sphere(r = 4,$fn=100);
      }
    }
    
  
    translate([0, -20, 17])
      rotate([180, 0, 0])
        linear_extrude(height = 3)
          polygon([
            [-15, 0], [-9, 5], [0, 7], [9, 5], [15, 0], [0, 0]
          ]);
  }
}

module winding() {
    translate([-2.9, 112, 10.07]) {
        rotate([0, 270, 0]) {
            /*cylinder(r1 = 1.6, r2 = 1.65 h = 2);*/
            for (i = [0: 2: 6]) {
                difference() {
                    translate([0, 0, 0.1 * i])
                        cylinder(h = 0.12, r = 2.15, center = false, $fn = 100);

                    translate([0, 0, 0.1 * i])
                        cylinder(h = 0.12, r1 = 2.10 , center = false, $fn = 100);
                }
            }
        }
    }
   translate ([-1,118,10.07]){
       rotate([0, 270, 0]){
           for (i = [0: 2: 6]) {
                difference() {
                    translate([0, 0, 0.1 * i])
                        cylinder(h = 0.12, r = 2.3, center = false, $fn = 100);

                    translate([0, 0, 0.1 * i])
                        cylinder(h = 0.12, r1 = 2.25 , center = false, $fn = 100);
           }
       }
    }
}
  translate ([1,127,9.8]){
      rotate ([0 , 270, 0])
        //cylinder (r = 2.5, h = 2);
      for (i = [0: 2: 6]) {
                difference() {
                    translate([0, 0, 0.1 * i])
                        cylinder(h = 0.12, r = 2.4, center = false, $fn = 100);

                    translate([0, 0, 0.1 * i])
                        cylinder(h = 0.12, r1 = 2.35 , center = false, $fn = 100);
      }
   }
}
      
   translate ([3,133, 10.0]){
       rotate ([0, 270, 0])
       //cylinder (r = 2.6, h = 2);
       for (i = [0: 2: 6]) {
                difference() {
                    translate([0, 0, 0.1 * i])
                        cylinder(h = 0.12, r = 2.45, center = false, $fn = 100);

                    translate([0, 0, 0.1 * i])
                        cylinder(h = 0.12, r1 = 2.40 , center = false, $fn = 100);
        }
      }
   }
}

module head() {
  union() {
    // neck
    translate([-7.5, 45, 5])
      cube([15, 80, 10]);
    // head
    color("red"){
    translate([-10, 100, 5])
      cube([20, 40, 12]);
    }
    
  }
}

module curve () {
    union () {
        difference(){
         // main 
        translate ([0, 120, 5 + 10 * sqrt (11)]){
            rotate ([0, 90, 0])
                cylinder (r = 40, h = 20, center = true, $fn = 200); 
        }
        // block 1
        translate ([-10, 100, 5])
           cube ([30, 100, 80]); 
        
        translate ([-10, 140, -10])
        
           cube ([30, 100, 120]);
        //block 2
        translate ([-15, 20, -40])
                cube ([40, 80, 120]);
        //block 3
         translate([-5, 105, -40])
               cube([10, 30, 120]);
    }
  }
}

module hole() {
  translate([-5, 105, 5])
    cube([10, 30, 12]);
}

module headWithHole() {
  difference() {
    head(); 
    hole(); 
  }
}

module moonL(){
  difference() {
    translate([-25,0,15])
    cylinder(r = 10, h = 3,$fn=200);
    translate([-15,0,15])
    cylinder(r = 10, h = 3,$fn=200);
  }
}

module moonR(){
  difference() {
    translate([25,0,12])
    cylinder(r = 10, h = 3, $fn=200);
    translate([15,0,12])
    cylinder(r = 10, h = 3,$fn=200);
  }
}
/*
module test(){
    color("red"){
        winding();
        }
}
*/
//body with moon
module bodyMoon(){
  difference() {
    translate([0, 0, 3.5])
    cylinder(r = 50, h = 11.5,$fn=200);
    moonR();
 }
}

module main() {
 translate ([0, 0, 0]){
  union() {
    winding();
    bodyMoon();
    //test();

    first();         
    headWithHole();
    curve();
    moonL();
  }
}
}


main();