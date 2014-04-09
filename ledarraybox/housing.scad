use <MCAD/shapes.scad>


height=10;
width=10;
highquality=50;
lowquality=10;
minimalheight=0.0001;

module hexknob(myheight,mywidth,rounded,showref,quality){

widthmodifier=0.6;

$fn=quality;

if(showref){
translate([mywidth*1.5,0,0])
hexagon(mywidth,myheight);

}

if(rounded)
{



//$fn=50;
minkowski()
{
hexagon(mywidth*widthmodifier,myheight);
cylinder(r=2,h=minimalheight);
}

}
else
{
hexagon(mywidth,myheight);

}


}


module knobinsert(){

basewidth=30;
baseheight=20;
insertheight=80;
insertwidth=20;
fudgefactor=17; //8,14,20,17
fudgefactor2=8; //8,10,8 



intersection(){

cylinder(r= (basewidth+fudgefactor)/2,h=insertheight);


translate([0,0,(insertheight/2)   ])
cube([basewidth*2, insertwidth+fudgefactor2, insertheight], center = true);


}

cylinder(r=(basewidth+fudgefactor)/2,h=baseheight);
}


module makehousing(isLid)
{

scalefactor1=0.9;
scalefactor2=0.94;
powerholderheight=6;
powerholderlength=14;
powerholderwidth=9;
fudgefactor=0.5;
powerholdershell=3;
caselength=55;

caselidheight=3;
caselidthickness=3;


powerholderoffset=7;
if(isLid)
{

union(){
house(caselidheight,caselidheight,caselength,true,true);



difference(){


translate([0,caselength/2-powerholderoffset,(powerholderheight/2) +(caselidheight/2) ])
cube([powerholderwidth+powerholdershell,powerholderlength+powerholdershell, powerholderheight], center = true);


union(){

translate([0,caselength/2-powerholderoffset,(powerholderheight/2) +(caselidheight/2) ])
cube([powerholderwidth+fudgefactor,powerholderlength+fudgefactor, powerholderheight], center = true);



translate([0,caselength/2+8,(powerholderheight/2) +(caselidheight/2) ])
cube([25,16,10], center = true);

}


}
}
}

else{
difference(){

house(20,caselidheight,caselength,true);

translate([0,0,caselidheight])
	{
	scale([scalefactor1,scalefactor2,1])
		{
		house(20,caselidheight,caselength,false);
		}
	}

}

}

}

module house(caseheight,caselidheight,caselength,doScrews,isLid)
{

cpuwidth=18;
cpuheight=10;
cpulength=49;

casewidth=30;
caseboxheight=22;  //

$fn = 50;
screwholewidth = 3;
bigscrewholewidth = 5;
bigheight=300;

fudgefactor=1;


lidslit=3;

screwhole_y=casewidth/2 - screwholewidth;
screwhole_x=caselength/2 - screwholewidth;;
lidscrewhole_y=8;
lidscrewhole_offset=6;

docenter=true;

screwshell=6;


difference(){



union()
{


	minkowski()
	{
	cube([casewidth,caselength, caseheight], center = true);
	cylinder(r=3,h=minimalheight);
	}

}

if(doScrews)
{

union()
	{

	translate([screwhole_y,-screwhole_x,0])
	cylinder(r=(screwholewidth+fudgefactor)/2,h=bigheight,center=docenter);


	translate([-screwhole_y,-screwhole_x,0])
	cylinder(r=(screwholewidth+fudgefactor)/2,h=bigheight,center=docenter);


	translate([screwhole_y,screwhole_x,0])
	cylinder(r=(screwholewidth+fudgefactor)/2,h=bigheight,center=docenter);

	translate([-screwhole_y,screwhole_x,0])
	cylinder(r=(screwholewidth+fudgefactor)/2,h=bigheight,center=docenter);


	translate([0,0,caselidheight+2])
	rotate([0,90,90])
	cylinder(r=(bigscrewholewidth/2+fudgefactor),h=bigheight*2,center=false);


	if(!isLid)
		{

	
		translate([0,-30,(caseheight/2) - (lidslit/2)])
		cube([11,10,lidslit], center=true);

		}


	}

}


if(isLid)
	{
	translate([0,-lidscrewhole_y - lidscrewhole_offset,0])
	cylinder(r=(bigscrewholewidth/2+fudgefactor/2),h=bigheight,center=docenter);

	translate([0,lidscrewhole_y-lidscrewhole_offset,0])
	cylinder(r=(bigscrewholewidth/2+fudgefactor/2),h=bigheight,center=docenter);
	}


}

}


module makeknob()
{
scalefactor = 0.10;

difference(){
	translate([0,0,(height/2)   ])
	hexknob(height,width,true,false,highquality);
	//hexknob(height,width,false,false,lowquality);
	   scale([scalefactor,scalefactor,scalefactor ]) 
			knobinsert();	
	}	


//knobinsert();
}



makehousing(true);
//makeknob();

