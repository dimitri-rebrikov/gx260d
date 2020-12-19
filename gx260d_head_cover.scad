module outside() {
    polygon(
        points=[ 
            [0, 0], 
            [215, 0], 
            [215, -20], 
            [180, -60], 
            [115, -65],
            [100, -65],
            [36, -60], 
            [0, -20]         
        ]
    );
};

module inside() {
    polygon(
        points=[ 
            [0, 0], 
            [211, 0], 
            [211, -17], 
            [176, -56], 
            [115, -61],
            [100, -61],
            [35, -56], 
            [0, -17]         
        ]
    );
};

module topshield() {
    cube([195, 2, 35]);
}

module holdertube() {
    union() {
        difference(){
            cylinder(32, d=12, $fn=50);
            translate([0, 0, 10])
                cylinder(22, d=8);
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
    

module all() {
    union() {
        difference(){
            linear_extrude(height=20)
                outside();
            
            translate([2,-2,2])
                linear_extrude(height=18)
                    inside();
            
            translate([107,-55, 20])
                outcut1();
            
            translate([44,-63, 12])
                outcut2();
            
            translate([163,-63, 12])
                outcut2();
           
        };
        
        translate([10,-2,0])
            topshield();
        
        translate([20, -12, 0])
            holdertube(); 
        
        translate([195, -12, 0])
            holdertube(); 
        
        translate([107, -47, 0])
            holder();
    };
};

// projection is for creating a dxf file to measure the object
//projection(cut=true) translate([0,0, -15])
all();
