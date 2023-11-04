//
// Rc Rock Crawler with new gearbox.
// The original design got deleted from everywhere I could find it before: Thingiverse, Cult, MiniFactory.
// I updated the original file along with the new gearbox on Thingiverse, Cult and github.
//

//
//! This is a remix version of an RC Rock Crawler that I found on Thingiverse.
//! The original model got deleted since then.
//! I modified the gearbox to make it slower, hence with more torque.
//!
//! Video:
//! 1. [In action](https://youtu.be/3EBpf9YP5C4)
//! 2. [Showing the shock](https://youtu.be/YSYngEb9dG8)
//! 3. [Gearbox assembly](https://youtu.be/KAkp_eB5qdQ)
//!
//! I found a link to the original video from the original designer:
//! 1. [Make an RC Rock Crawler - Part 1](https://www.youtube.com/watch?v=WgZuojB2sF8&t=138s)
//! 2. [Make an RC Rock Crawler - Part 2](https://www.youtube.com/watch?v=jjvKoB2oO8Q&t=319s)
//!
//! Documentation generated by the OpenSCAD library [NopSCADlib](https://github.com/nophead/NopSCADlib/tree/master).
//!
//! License: [Creative Commons - Attribution - Share Alike](https://creativecommons.org/licenses/by-sa/3.0/).
//!

$show_threads = true;      // Set to false to speed up the processing
$extrusion_width = 0.4;
$layer_height = 0.2;
$pp1_colour = "dimgrey";
$pp2_colour = "red";
$pp3_colour = "blue";

include <NopSCADlib/core.scad>
use <NopSCADlib/utils/tube.scad>
use <NopSCADlib/utils/thread.scad>
use <NopSCADlib/vitamins/rod.scad>
use <NopSCADlib/vitamins/insert.scad>
include <NopSCADlib/vitamins/ball_bearings.scad>  // bb_width()
use <NopSCADlib/vitamins/ball_bearings.scad>
//use <MCAD/servos.scad>
$fn = 180;     // Uncomment to increase quality of stl

showAxle = false;
showttt = false;
showAssembly = true;


// The include ot MCAD library does't work with the script. Until I figure out what the problem is, I copied the function here.
module towerprosg90(position=undef, rotation=undef, screws = 0, axle_length = 0, cables=0)
{
	translate(position) rotate(rotation) {
        difference(){
            union()
            {
                translate([-5.9,-11.8/2,0]) cube([22.5,11.8,22.7]);
                translate([0,0,22.7-0.1]){
                    cylinder(d=11.8,h=4+0.1);
                    hull(){
                        translate([8.8-5/2,0,0]) cylinder(d=5,h=4+0.1);
                        cylinder(d=5,h=4+0.1);
                    }
                    translate([0,0,4]) cylinder(d=4.6,h=3.2);
                }
                translate([-4.7-5.9,-11.8/2,15.9]) cube([22.5+4.7*2, 11.8, 2.5]); 
            }
            //screw holes
            translate([-2.3-5.9,0,15.9+1.25]) cylinder(d=2,h=5, center=true);
            translate([-2.3-5.9-2,0,15.9+1.25]) cube([3,1.3,5], center=true);
            translate([2.3+22.5-5.9,0,15.9+1.25]) cylinder(d=2,h=5, center=true);
            translate([2.3+22.5-5.9+2,0,15.9+1.25]) cube([3,1.3,5], center=true);
        }
        if (axle_length > 0) {
            color("red", 0.3) translate([0,0,29.9/2]) cylinder(r=1, h=29.9+axle_length, center=true);
        }
        if (cables > 0) color("red", 0.3) translate([-12.4,-1.8,4.5]) cube([10,3.6,1.2]);
        if(screws > 0) color("red", 0.3) {
            translate([-2.3-5.9,0,15.9+1.25]) cylinder(d=2,h=10, center=true);
            translate([2.3+22.5-5.9,0,15.9+1.25]) cylinder(d=2,h=10, center=true);
        }
    }
    
}



module Axle_Case_p1_stl()
{
    stl("Axle_Case_p1");
    stl_colour(pp1_colour)
    translate([-10,-29.5,-11.5]) rotate([90,0,90]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/Axle_Case_p1.STL");
}
module Axle_Case_p2_stl()
{
    stl("Axle_Case_p2");
    stl_colour(pp1_colour)
    translate([0,-9.6,-10.3]) rotate([90,0,0]) rotate([0,90,0]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/Axle_Case_p2.STL");
}
module Axle_Case_p3_stl()
{
    stl("Axle_Case_p3");
    stl_colour(pp2_colour)
    translate([-5,0,0]) rotate([-90,0,0]) rotate([0,90,0]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/Axle_Case_p3.STL");
}
module Axle_Case_p4_stl()
{
    stl("Axle_Case_p4");
    stl_colour(pp2_colour)
    translate([0,-2,-5]) rotate([90,0,0]) rotate([0,90,0]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/Axle_Case_p4.STL");
}
module 5_5_ball_Closed_stl()
{
    stl("5_5_ball_Closed");
    stl_colour(pp1_colour)
    translate([0,2.7,-2.7]) rotate([0,0,-90]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/5.5_ball_Closed.STL");
}
module 5_5_ball_Open_stl()
{
    stl("5_5_ball_Open");
    stl_colour(pp1_colour)
    translate([0,2.7,-2.7]) rotate([0,0,-90]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/5.5_ball_Open.STL");
}

module G34_P14_p1_stl()
{
    stl("G34_P14_p1");
    stl_colour(pp2_colour)
    translate([0,-8.3,-8.3]) rotate([0,0,0]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/G34_P14_p1.STL");
}
module G34_P14_p2_stl()
{
    stl("G34_P14_p2");
    stl_colour(pp2_colour)
    translate([0,-4,-4]) rotate([0,0,0]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/G34_P14_p2.STL");
}
module P14_G34_stl()
{
    stl("P14_G34");
    stl_colour(pp2_colour)
    translate([-5.5,-4,-4]) rotate([0,0,0]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/P14_G34.STL");
}
module Drive_Shaft_stl()
{
    stl("Drive_Shaft");
    stl_colour(pp2_colour)
    translate([-3,0,-3]) rotate([90,0,0]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/Drive_Shaft.STL");
}
module Servo_Holder_stl()
{
    stl("Servo_Holder");
    stl_colour(pp2_colour)
    translate([0,-2.5,0]) rotate([0,0,90]) rotate([90,0,0]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/Servo_Holder.STL");
}
module Hub_stl()
{
    stl("Hub");
    stl_colour(pp2_colour)
    translate([14.5,-5.5,9.0]) rotate([0,-90,0]) rotate([0,0,90]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/Hub.STL");
}
module Drive_Cup_stl()
{
    stl("Drive_Cup");
    stl_colour(pp2_colour)
    translate([-4.5,0,4.5]) rotate([-90,0,0]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/Drive_Cup.STL");
}
module Center_Drive_Cup_stl()
{
    stl("Center_Drive_Cup");
    stl_colour(pp2_colour)
    translate([0,-4.5,4.5]) rotate([0,90,0]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/Center_Drive_Cup.STL");
}
module Servo_Horn_stl()
{
    stl("Servo_Horn");
    stl_colour(pp2_colour)
    translate([0,-5.3,-5.0]) rotate([0,0,90]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/Servo_horn_-_5.5_4_ball.STL");
}
module Link_Closed_35mm_stl()
{
    stl("Link_Closed_35mm");
    stl_colour(pp1_colour)
    translate([-3.5,0,-3.5]) rotate([0,0,-90]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/5.5_Link_Closed_35mm_C.STL");
}
module Ball_Link_62mm_stl()
{
    stl("Ball_Link_62mm");
    stl_colour(pp1_colour)
    translate([-3.5,0,-3.5]) rotate([0,0,-90]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/ballLink_62.stl");
}
module Ball_Link_41mm_stl()
{
    stl("Ball_Link_41mm");
    stl_colour(pp1_colour)
    translate([-0,0,-3.5]) rotate([0,0,-90]) import ("/home/rejeantremblay/Documents/openscad/RockCrawlerNewGearBox/ballLink_41.stl");
}


// Vitamin

module bb_MR128()
{
    MR128   = ["MR128",  8,  12, 3.5,   "blue",    0.5,  0.5,  0,    0];

    translate([bb_width(MR128)/2,0,0]) rotate([0,90,0]) ball_bearing(MR128);
}
module bb_MR63()
{
    MR128   = ["MR63",  5,  8, 2.5,   "silver",    0.25,  0.25,  0,    0];

    translate([bb_width(MR128)/2,0,0]) rotate([0,90,0]) ball_bearing(MR128);
}
M2_screw = ["M2", "M2 pan self tap",    hs_pan, 2.2, 4.2, 1.7,    0,   0, 0, M2p5_washer, false,    No2_pilot_radius, No2_clearance_radius];
module screw_12mm()
{
    screw(M2_screw, 12);
}
module screw_10mm()
{
    screw(M2_screw, 10);
}
module screw_8mm()
{
    screw(M2_screw, 8);
}
module screw_6mm()
{
    screw(M2_screw, 6);
}
module screw_5mm()
{
    screw(M2_screw, 5);
}

module servoSG90()
{
    vitamin("servoSG90():RC servo SG90");
    rotate([0,-90,0]) towerprosg90(position=[0,0,0], rotation=[0,0,90], screws = 0, axle_length = 0, cables=0);
}


//
//! 1. Insert G34_P14_p2 in G34_P14_p1 using a M2 self tapping screw 8 mm.
//! 2. Add the ball bearing MR128 at both ends.
//
module G34_assembly()
assembly("G34", ngb=true)
{
    G34_P14_p1_stl();
    explode([15,0,0]) {
        translate([10,0,0]) G34_P14_p2_stl();
    }
    explode([-15,0,0]) {
        bb_MR128();
    }
    explode([15+15+15,0,0]) {
        translate([12.8,0,0]) bb_MR128();
    }
    explode([15+15,0,0]) {
        translate([11.8,0,0]) rotate([0,90,0]) screw_6mm();
    }

}

//
//! 1. Install a 5_5_ball_Closed on Axel_Case_p4 using a M2 self tapping screw 8 mm.
//
module Axle_part1_assembly() pose([77,0,60], exploded=false)
assembly("Axle_part1", big=false, ngb=true) {

    Axle_Case_p4_stl();
    explode([0,-15,0], offset=[5,0,0]) {
        translate([5,-2,0]) rotate([0,0,-90]) 5_5_ball_Open_stl();
    }
    explode([0,-15-10,0], offset=[5,0,0]) {
        translate([5,-7,0]) rotate([90,0,0]) screw_10mm();
    }
}

//
//! 1. Install a 5_5_ball_Closed on left side of a Servo_Holder using a M2 self tapping screw 8 mm.
//
module Axle_part1_1_L_assembly() pose([77,0,60], exploded=false)
assembly("Axle_part1_1_L", big=false, ngb=true) {

    Servo_Holder_stl();
    explode([0,-15,0], offset=[3,2.5,4]) {
        translate([3,-2.5,4]) rotate([0,0,-90]) 5_5_ball_Open_stl();
    }
    explode([0,-15-10,0], offset=[3,-7.5,4]) {
        translate([3,-7.5,4]) rotate([+90,0,0]) screw_8mm();
    }
}

//
//! 1. Install a 5_5_ball_Closed on right side of a Servo_Holder using a M2 self tapping screw 8 mm.
//
module Axle_part1_1_R_assembly() pose([77,0,60], exploded=false)
assembly("Axle_part1_1_R", big=false, ngb=true) {

    Servo_Holder_stl();
    explode([0,10,0], offset=[3,2.5,4]) {
        translate([3,+2.5,4]) rotate([0,0,90]) 5_5_ball_Open_stl();
    }
    explode([0,10+10,0], offset=[3,2.5,4]) {
        translate([3,7.5,4]) rotate([-90,0,0]) screw_8mm();
    }
}

//
//! 1. Install both Axle_part1_assembly on the Axle_Case_p1 with 4 M2 self tapping screw 12 mm.
//
module Axle_part2_assembly() //pose([77,0,60], exploded=false)
assembly("Axle_part2", big=false, ngb=true) {

    Axle_Case_p1_stl();
    explode([15,0,0], offset=[5.6,-18,0]) {
        translate([5.6,-18,0]) rotate([0,0,0]) Axle_part1_assembly();
    }
    explode([15+15,0,0], offset=[13.1,-18,3]) {
        translate([+13.1,-18,3]) rotate([0,90,0]) screw_12mm();
    }
    explode([15+15,0,0], offset=[13.1,-18,-3]) {
        translate([+13.1,-18,-3]) rotate([0,90,0]) screw_12mm();
    }
    explode([15,0,0], offset=[5.6,+18,0]) {
        translate([5.6,+18,0]) rotate([180,0,0]) Axle_part1_assembly();
    }
    explode([15+15,0,0], offset=[13.1,+18,3]) {
        translate([+13.1,+18,3]) rotate([0,90,0]) screw_12mm();
    }
    explode([15+15,0,0], offset=[13.1,+18,-3]) {
        translate([+13.1,+18,-3]) rotate([0,90,0]) screw_12mm();
    }
}

//
//! 1. Insert G34_assembly in the axle.
//! 2. Install ball bearing MR63 on P14_G34.
//! 3. Install P14_G34 in Axle_Case_p2.
//! 4. Fix Axle_Case_p2 on Axle_Case_p1 with 4 M2 self tapping screw 6 mm.
//! 5. Insert both Drive_Shaft in axle. Note: there is no ball bearing on the shaft.
//
module Axle_part3_assembly() 
assembly("Axle_part3", big=false, ngb=true) {

    Axle_part2_assembly();
    explode([20,0,0]) {
        translate([0,-8.1,0]) rotate([0,0,90]) G34_assembly();
    }
    explode([20+20,0,0]) {
        translate([5,0,0]) P14_G34_stl();
    }
    explode([20+20+20,0,0]) {
        translate([9,0,0]) bb_MR63();
    }
    explode([20+20+20+20,0,0]) {
        Axle_Case_p2_stl();
    }

    explode([0,-40,0]) {
        translate([0,-5.1,0]) rotate([0,0,0]) Drive_Shaft_stl();
    }
    explode([0,+40,0]) {
        translate([0,+5.1,0]) rotate([180,0,0]) Drive_Shaft_stl();
    }
    explode([+20+20+20+20+10,0,0], offset=[7.0,-6.5,-7.5]) {
        translate([7.0,-6.5,7.5]) rotate([0,90,0]) screw_6mm();
    }
    explode([+20+20+20+20+10,0,0], offset=[7.0,-6.5,-7.5]) {
        translate([7.0,-6.5,-7.5]) rotate([0,90,0]) screw_6mm();
    }
    explode([+20+20+20+20+10,0,0], offset=[7.0,+6.5,-7.5]) {
        translate([7.0,+6.5,7.5]) rotate([0,90,0]) screw_6mm();
    }
    explode([+20+20+20+20+10,0,0], offset=[7.0,+6.5,-7.5]) {
        translate([7.0,+6.5,-7.5]) rotate([0,90,0]) screw_6mm();
    }
}

//
//! 1. Install two 5_5_ball_Closed on Axle_Case_p2 with M2 self tapping screw 10 mm.
//! 2. Install the servo holders (Axle_part1_1_L_assembly & Axle_part1_1_R_assembly) on Axle_Case_p2 with 2 M2 self tapping screw 10 mm.
//
module Axle_part4_assembly() pose([70,0,55],[7,0,5])
assembly("Axle_part4", big=false, ngb=true) {

    Axle_part3_assembly();
    explode([0,-20,0], offset=[16,-10,8]) {
        translate([16.0,-5,8.05]) rotate([0,0,-90]) 5_5_ball_Open_stl();
    }
    explode([0,20,0], offset=[16,+10,8]) {
        translate([16.0,+5,8.05]) rotate([0,0,+90]) 5_5_ball_Open_stl();
    }
    explode([0,0,10], offset=[+3.0,-14,10.6]) {
        translate([-2.8,-14,6.5]) rotate([0,0,0]) Axle_part1_1_L_assembly();
    }
    explode([0,0,10], offset=[+3.0,+14,10.6]) {
        translate([-2.8,+14,6.5]) rotate([0,0,0]) Axle_part1_1_R_assembly();
    }

    explode([0,-20-10,0], offset=[16,-10,8]) {
        translate([16.0,-10.0,8.05]) rotate([90,0,0]) screw_10mm();
    }
    explode([0,20+10,0], offset=[16,-10,8]) {
        translate([16.0,+10.0,8.05]) rotate([-90,0,0]) screw_10mm();
    }
    explode([0,0,10+30], offset=[+3.0,-14,10.6]) {
        translate([+3.0,-14,10.6]) rotate([0,0,0]) screw_10mm();
    }
    explode([0,0,10+30], offset=[+3.0,+14,10.6]) {
        translate([+3.0,+14,10.6]) rotate([0,0,0]) screw_10mm();
    }
}

//
//! 1. Crew together a 5_5_ball_Open and a 5_5_ball_Closed with a M2 self tapping screw 12 mm.
//! 2. Install a bearing MR128 in the Hub.
//! 3. Install a bearing MR63 in the Hub.
//! 4. Install a Drive_Cup in the Hub.
//
module Hub_L_assembly() pose([55,0,38],[11,-10,-3])
assembly("Hub_L", big=false, ngb=true) {

    Hub_stl();
    explode([0,-20,0], offset=[0,0,0]) {
        translate([0,-1.8,0]) rotate([0,0,90]) bb_MR128();
    }
    explode([0,-20-20,0], offset=[0,0,0]) {
        translate([0,-3.5,0]) Drive_Cup_stl();
    }
    explode([0,20,0], offset=[0,0,0]) {
        translate([0,2.8,0]) rotate([0,0,90]) bb_MR63();
    }
    explode([0,0,10], offset=[11.8,-3,2]) {
        translate([11.8,-3.0,2.0]) rotate([0,-90,0]) 5_5_ball_Open_stl();
    }
    explode([0,0,-20], offset=[11.8,-3,2]) {
        translate([11.8,-3.0,-2.0]) rotate([0,+90,0]) 5_5_ball_Closed_stl();
    }
    explode([0,0,10+15], offset=[11.8,-3,2]) {
        translate([11.8,-3.0,7.0]) rotate([0,+0,0]) screw_12mm();
    }
}

//
//! 1. Install a 5_5_ball_Open with a M2 self tapping screw 10 mm.
//! 2. Install a bearing MR128 in the hub.
//! 3. Install a bearing MR63 in the hub.
//! 4. Install a Drive_Cup in the hub.
//
module Hub_R_assembly() pose([55,0,38],[11,-10,-3])
assembly("Hub_R", big=false, ngb=true) {

    Hub_stl();
    explode([0,-20,0], offset=[0,0,0]) {
        translate([0,-1.8,0]) rotate([0,0,90]) bb_MR128();
    }
    explode([0,-20-20,0], offset=[0,0,0]) {
        translate([0,-3.5,0]) Drive_Cup_stl();
    }
    explode([0,20,0], offset=[0,0,0]) {
        translate([0,2.8,0]) rotate([0,0,90]) bb_MR63();
    }
    explode([0,0,-10], offset=[11.8,-3.0,-2.0]) {
        translate([11.8,-3.0,-2.0]) rotate([0,+90,0]) 5_5_ball_Open_stl();
    }
    explode([0,0,-10-15], offset=[11.8,-3.0,-2.0]) {
        translate([11.8,-3.0,-7.0]) rotate([0,+180,0]) screw_10mm();
    }
}

//
//! 1. Install the Center_Drive_Cup in the Axle with a M2 self tapping screw 8 mm.
//! 2. Install the Hub_L_assembly along with two Axle_Case_p3 with 4 M2 self tapping screw 5 mm
//! 3. Install the Hub_R_assembly along with two Axle_Case_p3 with 4 M2 self tapping screw 5 mm
//
module Axle_part5_assembly() pose([68,0,73],[38,8,22])
assembly("Axle_part5", big=false, ngb=true) {

    Axle_part4_assembly();

    explode([0,0,20], offset=[0.1,-25.5,8.9]) {
        translate([0.1,-25.5,8.9]) rotate([0,0,0]) Axle_Case_p3_stl();
    }
    explode([0,0,-20], offset=[0.1,-25.5,-8.9+1.9]) {
        translate([0.1,-25.5,-8.9+1.9]) rotate([0,0,0]) Axle_Case_p3_stl();
    }
    explode([0,0,20], offset=[0.1,+25.5,8.9]) {
        translate([0.1,+25.5,8.9]) rotate([0,0,180]) Axle_Case_p3_stl();
    }
    explode([0,0,-20], offset=[0.1,+25.5,-8.9+1.9]) {
        translate([0.1,+25.5,-8.9+1.9]) rotate([0,0,180]) Axle_Case_p3_stl();
    }

    explode([0,20,0], offset=[0,+33,0]) {
        translate([0,+33.5,0]) rotate([0,180,0]) Hub_L_assembly();
    }
    explode([0,-20,0], offset=[0,-33,0]) {
        translate([0,-33.5,0]) rotate([0,0,180]) Hub_R_assembly();
    }

    explode([20,0,0], offset=[15.6,0,0]) {
        translate([15.6,0,0]) rotate([0,0,0]) Center_Drive_Cup_stl();
    }
    explode([20+10,0,0], offset=[18.6,0,0]) {
        translate([18.6,0,0]) rotate([0,90,0]) screw_6mm();
    }

    explode([0,0,20+10], offset=[-3.1,-27.5,8.9]) {
        translate([-3.0,-27.5,8.9]) rotate([0,0,0]) screw_5mm();
    }
    explode([0,0,20+10], offset=[3.1,-27.5,8.9]) {
        translate([+3.0,-27.5,8.9]) rotate([0,0,0]) screw_5mm();
    }
    explode([0,0,20+10], offset=[-3.1,+27.5,8.9]) {
        translate([-3.0,+27.5,8.9]) rotate([0,0,0]) screw_5mm();
    }
    explode([0,0,20+10], offset=[3.1,+27.5,8.9]) {
        translate([+3.0,+27.5,8.9]) rotate([0,0,0]) screw_5mm();
    }

    explode([0,0,-20-10], offset=[-3.1,-27.5,8.9]) {
        translate([-3.0,-27.5,-8.9]) rotate([0,180,0]) screw_5mm();
    }
    explode([0,0,-20-10], offset=[3.1,-27.5,8.9]) {
        translate([+3.0,-27.5,-8.9]) rotate([0,180,0]) screw_5mm();
    }
    explode([0,0,-20-10], offset=[-3.1,+27.5,8.9]) {
        translate([-3.0,+27.5,-8.9]) rotate([0,180,0]) screw_5mm();
    }
    explode([0,0,-20-10], offset=[3.1,+27.5,8.9]) {
        translate([+3.0,+27.5,-8.9]) rotate([0,180,0]) screw_5mm();
    }
}

//
//! 1. Install the servo SG90 with 2 M2 self tapping screw 6 mm.
//
module Axle_part6_assembly() pose([60,0,243],[-4,-18,27])
assembly("Axle_part6", big=false, ngb=true) {

    Axle_part5_assembly();

    explode([-30,0,0], offset=[15,-5,18]) {
        stl_colour(pp3_colour)
           render() translate([15,-5.3,18.5]) servoSG90();
    }

    explode([-30-20,0,0], offset=[-3.5,+14.0,18.5]) {
        translate([-3.5,+14.0,18.5]) rotate([0,-90,0]) screw_6mm();
    }
    explode([-30-20,0,0], offset=[-3.5,-14.0,18.5]) {
        translate([-3.5,-14.0,18.5]) rotate([0,-90,0]) screw_6mm();
    }
}

//
//! 1. Install the servo horn using the screw that came with the servo.
//
module Axle_part7_assembly() pose([60,0,243],[-4,-18,27])
assembly("Axle_part7", big=false, ngb=true) {

    Axle_part6_assembly();

    explode([-30,0,0], offset=[-9,-5.3,18.5]) {
        translate([-9,-5.3,18.5]) rotate([180,0,0]) Servo_Horn_stl();
    }
    explode([-30-10,0,0], offset=[-9,-5.3,18.5]) {
        translate([-16.6,-5.3,18.5]) rotate([0,-90,0]) screw_6mm();
    }

}

//
//! 1. Screw both Link_Closed_35mm on a 10 mm M2 threaded rod. Leave a gap of about 1 or 2 mm in the middle.
//
module Servo_control_link_assembly() pose([68,0,73],[38,8,22])
assembly("Servo_control_link", big=false, ngb=true) {

    // Threaded rod M2 0.4
    translate([0,0,0]) rotate([90,0,0]) studding(2, 10);

    explode([0,-20,0]) {
        translate([0,-1,0]) Link_Closed_35mm_stl();
    }
    explode([0,+20,0]) {
        translate([0,+1,0]) rotate([0,90,0]) rotate([180,0,0]) Link_Closed_35mm_stl();
    }
}

//
//! 1. Install a Servo_control_link_assembly from the servo horn to left hub.
//! 2. Install a Ball_Link_62mm between the two hubs.
//
module Axle_final_assembly() pose([60,0,243],[-4,-18,27])
assembly("Axle_final", big=false) {

    Axle_part7_assembly();

    explode([-30,0,0]) {
        stl_colour(pp2_colour)
           render() translate([-13,+12.5,7]) rotate([0,0,-3]) Servo_control_link_assembly();
    }
    explode([0,0,-20], offset=[-8.5,31,-4.5]) {
        stl_colour(pp2_colour)
           render() translate([-8.5,+31,-4.5]) Ball_Link_62mm_stl();
    }
}

//
//! 1. To be continued
//
module main_assembly() 
assembly("main", big=true) {

    Axle_final_assembly();

    //translate([10.5,-26.5,0]) rotate([90,0,0]) rotate([0,0,90]) Ball_Link_41mm_stl();
    
    translate([110,0,0]) rotate([0,0,180]) Axle_final_assembly();
    
}

if (showttt)
{
    //Axle_Case_p1_stl();
    //Axle_Case_p3_stl();
    //5_5_ball_Closed_stl();
    //Axle_final_assembly();
    //bb_MR63();
    screw(M2_screw, 10);
    //Servo_Holder_stl();
    //Drive_Cup_stl();
    //Hub_R_assembly();
    //Center_Drive_Cup_stl();
    //rotate([0,-90,0]) towerprosg90(position=[0,0,0], rotation=[0,0,90], screws = 0, axle_length = 0, cables=0);
    //servoSG90();
    //servoSG90();
    Servo_Horn_stl();
    //Link_Closed_35mm_stl();
    //Servo_control_link_assembly();
    //Ball_Link_62mm_stl();

}


if($preview)
    main_assembly();
    //Hub_L_assembly();
    //Axle_part6_assembly();
    //G34_assembly();
    //Axle_part7_assembly();
    //Servo_Horn_stl();
    //Axle_part7_assembly();
    //Ball_Link_41mm_stl();
else
    //Axle_Case_p1_stl();
    Axle_part7_assembly();
