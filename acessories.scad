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

