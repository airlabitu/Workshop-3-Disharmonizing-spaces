/* 
  This is an example code for the Disharmonizing spheres workshop. A workshop by AIR LAB in collaboration with sound artist Louise Foo

  https://airlab.itu.dk / air@itu.dk
  https://fooskou.squarespace.com/

  code by Halfdan Hauch Jensen (halj@itu.dk)
*/

import oscP5.*;               // library for OSC communication
import dmxP512.*;             // library for DMX communication
import processing.serial.*;   // library for serial communication with DMX controller

// DMX
DmxP512 dmxOutput;
int universeSize=128;
String DMXPRO_PORT="/dev/cu.usbserial-EN172579";
int DMXPRO_BAUDRATE=115000;


OscP5 oscP5; // OSC object for receiving Kinect blobdata

Blob [] blobsFromKinect; // list of all incoming blobs over OSC - for securely transporting the data to the Blobs array on next line
Blob [] blobs; // list of all blobs - without 


boolean enableDMX = true; // for disabling DMX while prototyping
String mode = "kinect"; // set to "simulate" for mouse simulation, or "kinect" for tracking data from kinect 

// Coordinate of lamp in the tracking area
int lampX = 320;
int lampY = 240;

// Data translation
float distToLampCenter = 0;
float mappedDistDMX = 0;
float constrainedDistDMX = 0;

// DMX light color components
int red = 0;
int green = 0;
int blue = 0;
int alpha = 255;


void setup() {
  size(640, 480);
  frameRate(25);
  
  // setup DMX connection and lamp default colors
  if (enableDMX) { // check if we want to send DMX - variable set in the top of the code
  
    // open connection to DMX controller
    dmxOutput=new DmxP512(this,universeSize,false);
    dmxOutput.setupDmxPro(DMXPRO_PORT,DMXPRO_BAUDRATE);
    
    // set default color on DMX lights
    setDmxLight(1, red, green, blue, alpha); // light 1 : starts at address 1
    setDmxLight(5, red, green, blue, alpha); // light 2 : starts at address 5
    setDmxLight(9, red, green, blue, alpha); // light 3 : starts at address 9
  }
    
  oscP5 = new OscP5(this, 6789); // listening for incoming OSC messages at port 6789
  
}


void draw() {
  // ------------------------------- leave this code here -------------------------------------------
  if (mode == "simulate"){
    blobs = new Blob[1];
    blobs[0] = new Blob(mouseX, mouseY, 10000, 1, 500);
  }
  
  else if (mode == "kinect") {    
    blobs = getBlobs(blobsFromKinect);
    
    if (blobs == null) {
      return; // if the mode is "kinect" but the kinect data is not ready, stop this iteration of draw
    }
  }
  // -------------------------------------------------------------------------------------------------
  
  
  
  
  // -------------------------- write your draw code below this line ---------------------------------
  
  // translate person coordinates to DMX and Midi values
  distToLampCenter = dist(blobs[0].x, blobs[0].y, lampX, lampY);   // calculate distance from the person(blob) to the lamp
  mappedDistDMX = map(distToLampCenter, 0, 200, 255, 0);           // map the value to a fitting scale for DMX
  constrainedDistDMX = constrain(mappedDistDMX, 0, 255);           // constrain the value to keep within the DMX scale (0 - 255)
  
  
  
  // set lamp color variables
  red = int(constrainedDistDMX);
  green = 0;
  blue = 0;
    
  // display visualize elements
  background(0);
  fill(255); // set fill color to white
  text("Mode: " + mode, 5, 15);
  ellipse(blobs[0].x, blobs[0].y, 10, 10); // draw person/blob
  fill(red, green, blue); // set fill color for the lamp
  ellipse(lampX, lampY, 100, 100); // draw the lamp
  
  exampleVisualizer(); // function for visually explaining number mappings and constrains
  
  
    
  // Send DMX data to lights
  if (enableDMX) {
    setDmxLight(1, red, green, blue, alpha); // DMX light 1
    setDmxLight(5, red, green, blue, alpha); // DMX light 2
    setDmxLight(9, red, green, blue, alpha); // DMX light 3
  }
    
    
  // ----------------------------------------------------------------------------------------------------
}


// function for key controls
void keyReleased(){
  
  // keys for toggeling between modes
  if (key == 's') mode = "simulate";
  else if (key == 'k') mode = "kinect";

}
