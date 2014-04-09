//patriks dators reservdel, Acer.


module removecylinderfromcube(roundingradius,height,rot){

rotate([0,0,rot]){
	difference(){
	cube([roundingradius,roundingradius,height],center=true);
	translate([roundingradius/2,roundingradius/2,1])
	cylinder(r = roundingradius, h = height, center = true);		
	}
	}
}

module asuspart(debug){


partwidth=17;
partheight=2;  //TODO FIXME REAL STUFFS5;
partlength=27;
roundingradius =5/2;
boreholeradius=2;
$fn=50;
borderwidth=2;
borderheight=2;
boreholexoffset=6;
boreholeyoffset=8;


rotate([0,180,0]){


union(){


translate([-partlength/2+borderwidth/2,0,-partheight])
cube([borderwidth,partwidth,borderheight],center=true);



translate([0,partwidth/2 -borderwidth/2,-partheight])
cube([partlength,borderwidth,borderheight],center=true);

difference(){
	cube([partlength,partwidth,partheight],center=true);
//	translate([-(partlength/2  -roundingradius/2),partwidth/2  - roundingradius/2])
//	removecylinderfromcube(roundingradius,partheight,-90);
	
	translate([-partlength/2+ (boreholexoffset-boreholeradius/2 ) ,partwidth/2  -boreholeyoffset+boreholeradius/2])
	cylinder(r = boreholeradius, h = partheight, center = true);	
	
	}

	
}
	
	
	}
	
	
/*
difference(){
cube([partlength,partwidth,partheight],center=true);

translate([-(partlength/2  -roundingradius),partwidth/2  - roundingradius])
cylinder(r = roundingradius, h = partheight, center = true);
	
}

r2 =  r-t;

difference() {
	cylinder(r = r, h = h, center = true);
	cylinder(r = r2, h = h+1, center = true);
	}
}

//makes a cylinder with four cylinders inside, optionally connecting them.
module 4ci1c(o_radius,i_radius,thickness,height,connect_inner_cylinders)
{
//oc == outercylinder, ic == innercylinder

//computed, normalized values.

//quality!
$fn=50;

ic_h=height;
ic_r=i_radius;
ic_t=thickness;

oc_h=ic_h;
oc_r=o_radius;              
oc_t=thickness;

ic_offset=oc_r-ic_r;

c_offset=ic_offset/2;  
c_length=sqrt(pow(ic_offset,2)*2)-(ic_r*2);

module connector(offset1,offset2,rot) {
		translate([offset1,offset2,0])
		rotate([0,0,rot])
		cube([thickness,c_length,height],center=true);	
	}
	
module innercylinder(offset1,offset2) {
		translate([offset1,offset2,0])
		cylshell(ic_r, ic_h,ic_t);
	}	
	
union(){
	innercylinder(0,ic_offset);
	innercylinder(0,-ic_offset);
	innercylinder(ic_offset,0);
	innercylinder(-ic_offset,0);

	cylshell(oc_r, oc_h,oc_t);
		
	if(connect_inner_cylinders){
		connector(c_offset,c_offset,45);
		connector(c_offset,-c_offset,-45);
		connector(-c_offset,-c_offset,45);
		connector(-c_offset,c_offset,-45);
		}
	}
	
	*/
	
}

asuspart(true);

