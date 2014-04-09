
moduleservoarmend(length,height,width){


	cylinder(r=length,h=100);
}

module servoarm(length,height,width,topwidth,holewidth,ballradius,q=10)
{
$fn=q;



	//cube([length,height,width],center=true);



moduleservoarmend(topwidth,height,width);


/*
cubesize=container_radius*2;
bottom_offset=(container_radius*2)*(1-bottom_shave);
hole_height=1000;
hole_offset=-bottom_offset +container_radius +absolute_hole_offset;

difference() {
		sphere(r =container_radius);

		translate([0,0,-bottom_offset])
		cube([cubesize,cubesize,cubesize],center=true);

		translate([0,0,hole_offset])
		cylinder(r=hole_radius,h=100);
		}	
*/
}


servoarm(50,10,6,30,10,5);

