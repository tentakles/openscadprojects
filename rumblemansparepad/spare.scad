//makes a hollow cylinder
module cylshell(r,h,t){
r2 =  r-t;

difference() {
	cylinder(r = r, h = h, center = true);
	cylinder(r = r2, h = h+1, center = true);
	}
}


module pad(includebuttom){

$fn=50;

d1=13;
//d2=10;

d2=7;

d3=11;

h1=8;
h2=8;
h3=1.6;
h4=1.6;
h5=0.8;

w1=2;
w2=1.2;

wfudge=0.8;

difference(){

union(){

	if(includebuttom)
	{
		cylinder(r = d1/2, h = h4, center = false);
		
		translate([0,0,h4])
		cylinder(r1 = d1/2, r2=d2/2,h = h3, center = false);
		
		translate([0,0,-h5])
		cylinder(r1 = d3/2, r2=d1/2,h = h5, center = false);
		
	}

	translate([0,0,h4+h3])
	cylinder(r = d2/2,h = h2, center = false);
	
	}
	

	translate([0,0,h4+h3+h2-h1/2])
	cube([w1+wfudge,w2+wfudge, h1], center = true);
	}

}

pad(true);