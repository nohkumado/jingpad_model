jingpad(mask=5);
//jingpad();


module jingpad(mask=0)
{
  width = 243;
  height = 178;
  thick = 7.1;
  fillet = 22;

  w2 = width/2;
  h2 = height/2;
  t2 = thick/2;

  difference()
  {
    cube([width,height,thick], center=true);
    union()
    {
      //fillets, rotation, xpos, ypos
      filDefs = [[2,1,1,"red"],[1,1,-1,"blue"],[3,-1,1,"green"], [0,-1,-1,"brown"]];
      for(args=filDefs)
      {
	translate([args[1]*w2,args[2]*h2,0])
	  rotate([0,0,args[0]*90])
	  //color(args[3])
	  fillet(fillet, 1.2*thick, center = true); 
      }
      color("black")
	translate([w2+3.5-6.6,0,0])
	usb_c();
    }
  }
    if(mask != 0)
      color("black")
	translate([w2+3.5-6.1,0,0])
	scale([1.1,1.1,1.1])
	usb_c(mask = mask);

  //front camera
  color("black")
    translate([-w2+3.5,0,t2-.1])
    if(mask == 0)
    cylinder(d=2.5, h=1, center = true, $fn=20);
 else 
    cylinder(d1=2.5,d2=5, h=mask, center = true, $fn=20);
  //power switch
  color("black")
    translate([-w2+0.5,h2-34,0])
  rotate([90,0,90])
    translate([0,0,-1-mask])
    round_square(w=15.5,h=4.5,l=2+mask);
  //sound switch
  color("black")
    translate([-w2+36,h2,0])
  rotate([90,0,00])
    translate([0,0,-1-mask])
    round_square(w=23.5,h=2.5,l=2+mask);
  //back cam
  color("black")
    translate([-w2+23,h2-16.3,-t2-2-mask])
    round_square(w=25,h=12.5,l=2+mask);
  //pogo pins
  color("black")
    translate([w2-15.5,0,-t2-1-mask])
  rotate([0,0,90])
    round_square(w=28,h=5,l=2+mask);
   //   color("magenta")
   // translate([width/2-15.5,0,-thick/2-1])
   // cube([1,1,20], center = true);
  magnets = [
    //upper left side
    [-w2+26,h2-32],
    [-w2+26,h2-40],
    [-w2+26,h2-48],
    [-w2+26,h2-56],
    //lower left side
    [-w2+26,-h2+56],
    [-w2+26,-h2+48],
    [-w2+26,-h2+40],
    [-w2+26,-h2+32],
    //right side
    [w2-18,h2-20],
    [w2-27,h2-20],
    [w2-36,h2-20],
    [w2-12,h2-58],
    [w2-20,h2-58],
    [w2-28,h2-58],

    [w2-20,-h2+55],
    [w2-28,-h2+55],
    [w2-28,-h2+55],
    //pogo pins
    [w2-38,h2-69],
    [w2-38,-h2+69],
    ];
    for(pos = magnets)
      color("grey")
	translate([pos[0],pos[1],-t2-.1])
	cylinder(d=5, h=2, $fn=20);

}

module fillet(r, h, center = true) 
{
  disp = (center)?r/2:0;

  translate([disp, disp, 0])

    difference() 
    {
      cube([r + 0.01, r + 0.01, h], center = true);

      translate([r/2, r/2, -0.01])
        cylinder(r = r, h = h + 2, center = true, $fn=100);

    }
}

module fillet2D(r, h, center = true) 
{
  translate([disp, disp, 0])

    difference() {
      square([r + 0.01, r + 0.01], center = true);

      translate([r/2, r/2, 0])
        circle(r = r, $fn=100);

    }
}

module usb_c(mask = 0)
{
  //usb c USB-C port measuring 8.4 millimetres (0.33 in) wide, 2.6 millimetres (0.10 in) high, and 6.65 millimetres (0.262 in) deep.
  rotate([90,0,90])
    translate([0,0,-6.65/2])
  round_square(w=8.4,h=2.6,l=6.65+mask);
}
module round_square(w,h,l)
{
  ws = (w-h)/2;
  translate([0,0,l/2]) cube([w-h,h,l],center=true);
  translate([-ws,0,0]) cylinder(d=h,h=l, $fn=20);
  translate([ws,0,0]) cylinder(d=h,h=l, $fn=20);
}
