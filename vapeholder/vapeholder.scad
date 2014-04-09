//radie av hållaren, 
//radie av hålet där man stoppar i ecigg, 
//% att ta av botten, 
//antal millimeter under hålet i botten
//kvalitet, 100 är bra kvalitet.

module vapeholder(container_radius,hole_radius,bottom_shave,absolute_hole_offset,q)
{
$fn=q;

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
}



//vapeholder(20,5,0.25,5, 10);

//v1: 18, 7.5
//v2: 25, 8
vapeholder(25,8,0.4,3, 100);

