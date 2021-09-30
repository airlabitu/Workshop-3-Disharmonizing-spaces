// ----------- HELPER FUNCTIONS - leave as is, unless you know what you are changing works ;-) ---------------

// function for setting the color on one DMX lamp
void setDmxLight(int address, int red_, int green_, int blue_, int alpha_){
  dmxOutput.set(address, red_);
  dmxOutput.set(address+1, green_);
  dmxOutput.set(address+2, blue_);
  dmxOutput.set(address+3, alpha_); // sets alpha channel to fully open
}


// function for getting blobs, and catching potential data errors  
Blob[] getBlobs(Blob [] inputArray){
  Blob [] returnArray;
    try{
      returnArray = new Blob[inputArray.length];
      for (int i = 0; i < inputArray.length; i++){
        
        returnArray[i] = new Blob(inputArray[i].x, inputArray[i].y, inputArray[i].minDepth, inputArray[i].id, (int)inputArray[i].nrOfPixels);
      }
    } 
    catch (NullPointerException e){
      //println("catched ERROR and returns NULL");
      return null;
    }
    return returnArray;
}



// function helping visualize the translation of values - for instruction purpose
void exampleVisualizer(){
  fill(255);
  text("distToCenter : " + int(distToLampCenter), 5, 40);
  text("mappedDistDMX : " + int(mappedDistDMX), 5, 60);
  text("constrainedDistDMX : " + int(constrainedDistDMX), 5, 80);
  noFill();
  stroke(255);
  line(lampX, lampY, blobs[0].x, blobs[0].y); // distToLampCenter
  
  ellipse(lampX, lampY, mappedDistDMX, mappedDistDMX); // mappedDistDMX
  ellipse(lampX, lampY, 200*2, 200*2); // interaction space
  ellipse(lampX, lampY, constrainedDistDMX+5, constrainedDistDMX+5); // constrainedDistDMX
}
