use <MCAD/involute_gears.scad>

baseheight=3;
baseradius=57;
teeth=12;
gear_thickness=baseheight;

bore_diameter=0;
test_gears ();

/*
gear(

number_of_teeth=teeth,
circular_pitch=200,
gear_thickness = gear_thickness,
rim_thickness = gear_thickness,
hub_thickness = gear_thickness,
bore_diameter=bore_diameter,

flat=true,

involute_facets=30

);

*/