
module hexmesh(xnum,ynum,partlength,partheight,partwidth){
a=partlength* sin(30);
b=partlength* cos(30);
halfwidth=partwidth/2;
b2= sqrt(pow(partwidth,2) - pow(partwidth/2,2)) ;
xoffset = b*2-b2;
yoffset= (a+partlength-b2)*2;

	module bar(xoffset,yoffset,rot) {
		translate([xoffset,yoffset,0])
		rotate([0,0,rot])
		cube([partwidth,partlength,partheight],center=false);	
		}

	module part(finalY,finalX) {
		bar(0,0,0);

		bar(partwidth,0,120);

		
		if(finalX){
		bar(-xoffset,0,0);
		}
	
		bar(-b+partwidth+halfwidth,a+partlength-b2,120);
		bar(-b+partwidth,-a,60);
			
		if(!finalY){
		bar(-b+halfwidth,a+b,0);
		}
		
		
		bar(halfwidth,partlength-b2,60);

		}
	
	union(){
	
		for ( j = [1 : ynum/2] )
		{
			for ( i = [1 : xnum] )
			{	
			translate([i*xoffset,j*yoffset])	
			part(j==ynum/2 ,i==1);
			}
		}
	}

}
//hexmesh(xnum,ynum,partlength,partheight,partwidth)
hexmesh(8,8,16,6,2);