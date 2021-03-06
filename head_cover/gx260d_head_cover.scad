include <polyround.scad> 

$fn=50;

module outside() {
    polygon(
        polyRound([ 
            [0, 0, 5], 
            [215, 0, 5], 
            [215, -20, 20], 
            [180, -57.5, 20], 
            [115, -62, 50],
            [100, -62, 50],
            [36, -57.5, 20], 
            [0, -20, 20]         
        ])
    );
};

module inside() {
    polygon(
        polyRound([ 
            [0, 0, 5], 
            [211, 0, 5], 
            [211, -17, 20], 
            [176, -53.5, 20], 
            [115, -58, 50],
            [100, -58, 50],
            [35, -53.5, 20], 
            [0, -17, 20]         
        ])
    );
};

module topshield() {
    cube([195, 2, 35]);
}

module holderhole() {
    union() {
        difference(){
            cylinder(32, d=11);
            translate([0, 0, 10])
                cylinder(22, d=7);
        }
        translate([-1, 5, 0])
            cube([2,6,32]);
    };
};

module holder() {
    cylinder(6, d=8);
}

module outcut1() {
    rotate([90, 0, 0])
    linear_extrude(height=10)
    polygon(
        points=[ 
            [-35, 0],
            [35, 0],
            [30, -6],
            [-30, -6],
        ]
    );
};

module outcut2() {
    cube(8);
}

module akailogo() {
    rotate([0,180,0])
      scale([0.05,0.05,0.05])
        import("akai.svg", center=true);
}

module gx260d() {
    rotate([0,180,0])
      scale([2,1,1])
        import("gx260d.svg", center=true);
} 
    
module all() {
    union() {
        difference(){
            linear_extrude(height=21)
                outside();
            
            translate([2,-2,2])
                linear_extrude(height=19)
                    inside();
            
            translate([107,-55, 21])
                outcut1();
            
            translate([46,-63, 13])
                outcut2();
            
            translate([161,-63, 13])
                outcut2();
            
            translate([107.5 ,-20, 0])
                linear_extrude(height=1)
                    akailogo();
            
            translate([107.5 ,-37, 0])
                linear_extrude(height=1)
                    gx260d();
           
        };
        
        translate([10,-2,0])
            topshield();
        
        translate([19, -11, 0])
            holderhole(); 
        
        translate([196, -11, 0])
            holderhole(); 
        
        translate([107, -47, 0])
            holder();
    };
};

// projection is for creating a dxf file to measure the object
// projection(cut=true) translate([0,0, -15])
all();
