use <acessories.scad>
pencil();

module pencil(mask = 0)
{
  difference()
  {
    translate([0,(8.5+mask)/2,0])
    {
      cylinder(d=9+mask, h = 125, $fn =30);
      sphere(d=9+mask, $fn =30);
      translate([0,0,125-.1])
	cylinder(d1=9+mask, d2 = 2+mask,h = 20, $fn =30);
      translate([0,0,145-.2])
	sphere(d=2+mask, $fn =30);
    }
    union()
    {
      translate([-5,-2,-10]) cube([10,2,150]);
      translate([00,1.99,21])
	rotate([90,0,90])
	color("black")
	usb_c();
    }
  }
  translate([0,1.99,28])
    rotate([90,0,0])
    color("grey")
    cylinder(d=3, h = 2, $fn =30);
  translate([0,3.8,100])
    rotate([00,90,90])
    color("black")
    intersection()
    {
      round_square(w=12.5,h=4.5,l=5);
      translate([-7.5,0,0.50])
	rotate([00,90,0])
	cylinder(d=9,h=13, $fn=30);
    }
}
