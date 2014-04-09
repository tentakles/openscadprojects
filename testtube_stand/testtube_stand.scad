stand_height=100;
stand_thickness=4;
stand_bottom_thickness=8;

//number of tubes in stand
tube_num=3;

//spacing between tubes
tube_spacing=12.5;

tube_cirumference=26;

//tube recession through bottom, less than bottom thickness is desirable
tube_recession = stand_bottom_thickness *0.75;

//makes tube stand
module maketubestand()
{
//rotates for good printing on FDM machines, might not be desirable for other machine-types
rotate([90,0,0])
	{
	difference()
		{
		tubestand();
		testtubes();
		}
	}
}

//creates the frame
module tubestand()
{
height = stand_height;
width = tube_cirumference + tube_spacing;
length = tube_num * (tube_cirumference + tube_spacing) + tube_spacing;
offset = (length/2) - (tube_spacing+(tube_cirumference/2));
heightoffset = stand_thickness + stand_bottom_thickness;

difference()
	{
	translate([offset, 0, 0])
	cube([length,width,height], center = true);
 
	translate([offset, stand_thickness, (heightoffset/2)-stand_thickness])
	cube([length-stand_thickness*2,width*2,height-heightoffset], center = true);
	}
}

//creates the tubes
module testtubes()
{
tube_radius = tube_cirumference/2;
offsetx = tube_cirumference+tube_spacing;
offsetz = stand_bottom_thickness + tube_radius - tube_recession ;

for (i = [0:tube_num-1])
	{
	translate([0,0,offsetz])
		{
		union()
			{
			translate([(offsetx*i), 0, 0])
			cylinder(r = tube_radius, h = stand_height, center = true);

			translate([(offsetx*i), 0, -(stand_height/2)])
			sphere(r = tube_radius, center = true);
			}
		}
	}
}

//initialises making of tubestand
maketubestand();
