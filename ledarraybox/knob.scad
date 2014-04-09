use <MCAD/shapes.scad>


height=10;
width=10;
highquality=50;
lowquality=10;

module hexknob(myheight,mywidth,rounded,showref,quality){

widthmodifier=0.6;
minimalheight=0.0001;
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


makeknob();

