module body() {
    linear_extrude(height = 3, scale=[0.94, 0.9])
        square(size = [58, 17], center=true);
}

module buttonhole() {
    cylinder(h=3, r= 3, $fn=50);
}

module digithole() {
   cube([5,6,3]);
}

module digitholes() {
    digithole();
    translate([6, 0 ,0])
        digithole();
    translate([12, 0 ,0])
        digithole();
    translate([18, 0 ,0])
        digithole();
}

module buttonoutcut() {
    cylinder(h=2, r1=4.5, r2=6.5, $fn=50);
}

module digitoutcut() {
    linear_extrude(height = 2, scale=[1.1, 1.4])
        square(size = [27, 8], center=true);
}

module all() {
    difference(){
        body();
        translate([18,0,0])
            buttonhole();        
        translate([18,0,1])
            buttonoutcut();
        translate([-19,-3,0])
            digitholes();
        translate([-7.3,0,1])
            digitoutcut();
        
    }
}

// projection is for creating a dxf file to measure the object
//projection(cut=true) translate([0,0, -0.5])
all();