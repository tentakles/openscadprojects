use <MCAD/shapes.scad>

/*params*/{
baseheight=3;
baseradius=57;

baseholewidth=55;
baseholeheight=7;

baseservoholeradius=6.75;
baseservoholeoffset=20;

axialrestrictorouterplatewidth=18;
axialrestrictorouterplateheight=10;
axialrestrictorouterplatedepth=3;

axialrestrictorinnerplatewidth=18;
axialrestrictorinnerplateheight=7;
axialrestrictorinnerplatedepth=3.6;

axialrestrictorholewidth=6;
axialrestrictorholeheight=4;

gaittrustorservomountdiameter=9;
gaittrustorservomountheight=6;

fudgefactor=0.5;
gaittrustorlength=70;

axialrestrictorscrewholeoffset=6;
screwholediameter=3.5;

servomountheight=14;
//why does the servo measure up to 40.5?!
servomountlength=40.75+fudgefactor;
servomountwidth=26;

servomountholeoffset=12;

largenumber=100;


uppermountwidth=8;
uppermountlength=10;
uppermountheight=20;

uppermountholediam=4;
uppermountholeoffsetx=5;
uppermountholeoffsety=4;

uppermountupperholeoffsetx=11;

xoffsetservomount=baseholeheight/2+17;
yoffsetservomount=servomountlength/2-9;


}

/*init*/{
//gaittrustor();
//translate([0,20,0])
//axialmotionrestrictor(true);

//axialmotionrestrictor(false);

//baseplate_test();



union(){
baseplate();



translate([-yoffsetservomount,xoffsetservomount,baseheight])
servomount();
}
}

module baseplate(){
//difference(){
	difference() {
 cylinder(r=baseradius,h=baseheight, $fn=200);
cube([baseholewidth, baseholeheight, baseholeheight], center = true);
}

//translate([0, baseservoholeoffset, 0])
//cylinder(r=baseservoholeradius,h=baseholeheight);
//}
}

module baseplate_test(){

	difference() {

 cube([baseholewidth+10, baseholeheight+10, baseheight], center = true);
 
 
cube([baseholewidth, baseholeheight, baseholeheight], center = true);
}

}

module axialmotionrestrictor(drawCenterPiece){



axialrestrictorholewidth=6;
axialrestrictorholeheight=4;


difference() {

difference()
{

union()
{

cube([axialrestrictorouterplatewidth, axialrestrictorouterplateheight, axialrestrictorouterplatedepth], center = true);

if(drawCenterPiece)
	{
	translate([0, 0, axialrestrictorouterplatedepth])
	cube([axialrestrictorinnerplatewidth, axialrestrictorinnerplateheight, axialrestrictorinnerplatedepth], center = true);
	}
}

cube([axialrestrictorholewidth, axialrestrictorholeheight, largenumber], center = true);

}
translate([axialrestrictorscrewholeoffset, 0, 0])
cylinder(r=screwholediameter/2,h= largenumber,center=true);

translate([-axialrestrictorscrewholeoffset, 0, 0])
cylinder(r=screwholediameter/2,h= largenumber,center=true);

}


}

module gaittrustor(){

difference()
	{

	union()
		{

		cube([gaittrustorlength, axialrestrictorholewidth-fudgefactor,axialrestrictorholeheight-fudgefactor], center = true);

		translate([gaittrustorlength/2,0,-(axialrestrictorholeheight-fudgefactor)/2])
			{
				cylinder(r=gaittrustorservomountdiameter/2,h= gaittrustorservomountheight,center=false);
			}

		}
		
			translate([gaittrustorlength/2,0,-(axialrestrictorholeheight-fudgefactor)/2])
	{
		cylinder(r=screwholediameter/2,h= largenumber,center=true);
	}
	}
	

}

module servomountpillar(){



difference(){



cube([uppermountwidth,uppermountlength,servomountheight+uppermountheight]);



union(){
translate([uppermountwidth/2,largenumber/2,servomountheight+uppermountholeoffsetx])
rotate([90,90,0])
cylinder(r=uppermountholediam/2,h=largenumber);

translate([uppermountwidth/2,largenumber/2,servomountheight+uppermountholeoffsetx+uppermountupperholeoffsetx])
rotate([90,90,0])
cylinder(r=uppermountholediam/2,h=largenumber);

}


}

}

module servomount(){


union(){
translate([servomountlength,0,0])
servomountpillar();

translate([-uppermountwidth,0,0])
servomountpillar();

difference(){
cube([servomountlength,servomountwidth,servomountheight]);

translate([servomountholeoffset/2,servomountholeoffset/2,0])
cube([servomountlength-servomountholeoffset,servomountwidth-servomountholeoffset,servomountheight]);
}
}
}

