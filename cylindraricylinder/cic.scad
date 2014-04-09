//makes a hollow cylinder
module cylshell(r,h,t){
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
}
//4ci1c(o_radius,i_radius,thickness,height,connect_inner_cylinders)

//4ci1c(30,11,1.2,10,true);
4ci1c(72,30,0.8,2,false);

