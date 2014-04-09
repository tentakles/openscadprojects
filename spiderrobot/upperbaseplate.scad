use <MCAD/shapes.scad>

baseheight=3;
baseradius=60;

baseholewidth=50;
baseholeheight=8;

baseservoholeradius=7.5;
baseservoholeoffset=20;


module baseplate()
{



difference(){


	difference() {
 cylinder(r=baseradius,h=baseheight);
cube([baseholewidth, baseholeheight, baseholeheight], center = true);
}
translate([0, baseservoholeoffset, 0])
cylinder(r=baseservoholeradius,h=baseholeheight);


}

}


baseplate();

/*
module example002()
{
	intersection() {
		difference() {
			union() {
				cube([30, 30, 30], center = true);
				translate([0, 0, -25])
					cube([15, 15, 50], center = true);
			}
			union() {
				cube([50, 10, 10], center = true);
				cube([10, 50, 10], center = true);
				cube([10, 10, 50], center = true);
			}
		}
		translate([0, 0, 5])
			cylinder(h = 50, r1 = 20, r2 = 5, center = true);
	}
}
*/