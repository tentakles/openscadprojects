//hållare för Vaporisers och e-liquids
module vapebottleholder(d1,x,y,spacing,h1,hbottom,vapeholediam,q)
{
$fn=q;

d2 = d1+(spacing*2);

h2=h1*2;

holeoffset = d1 +spacing;
holeoffset2 =  -(d1/2+ spacing/2);

shelloffsetx=(x-1) *(d1+spacing);
shelloffsety=(y-1) *(d1+spacing);;

difference(){

	hull(){
		cylinder(r=d2/2,h=h1);

		translate([shelloffsety,0, 0])	
		cylinder(r=d2/2,h=h1);
		
		translate([shelloffsety,shelloffsetx, 0])	
		cylinder(r=d2/2,h=h1);
		
		translate([0,shelloffsetx, 0])	
		cylinder(r=d2/2,h=h1);
	}

	for ( iy = [1 : y] ) 
	{
		for ( ix = [1 : x] ) 
		{
			translate([(iy-1)*holeoffset, (ix-1)*holeoffset, hbottom])
			cylinder(r=d1/2,h=h2);
			
			if(iy<y && ix<x && vapeholediam>0){
			translate([(iy)*holeoffset + holeoffset2, (ix)*holeoffset+holeoffset2, hbottom])
			cylinder(r=vapeholediam/2,h=h2);
			}			
		}
	}
}

}

//v1 vapebottleholder(23.5,2,2,2.5,12,2.4, 100);
//kommentar v1: vaporizern sitter slappt.
//v2: vapebottleholder(d1=23.5,x=3,y=3,spacing=5,h1=13,hbottom=2.4,vapeholediam=15.25,q=100);
//kommentar v2: fortfarande lite för stort hål, lite för låg höjd på lådan.
vapebottleholder(d1=23.5,x=3,y=3,spacing=5,h1=40,hbottom=2.4,vapeholediam=15,q=20);
//vapebottleholder(d1=18.5,x=3,y=5,spacing=5,h1=40,hbottom=2.4,vapeholediam=2,q=50);
