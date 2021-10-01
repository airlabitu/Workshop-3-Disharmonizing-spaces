## NB: Source codes will be updated until the beginning of the workshop
<br><br>
# Workshop-3-Disharmonizing-spaces

A creative coding workshop on Processing coding and interactive sound and light spaces – a collaboration between ITU and the Rhythmic Music Conservatory.

The frameworks for this workshop builds upons creating a interactive sound and light space, where peoples movements in the space will impact changes in both sound and light. 

The technical components at play are; a premade software getting data from the Kinect sensor(camera), and forwards positions of people in the tracking space to the software the workshop participants are writing. These will then send control messages to a lamp and the musical software Ableton Live.

Full description of the workshop is found at the Fabebook event [link](https://fb.me/e/1bkFva4xd)
<br><br>
## Preperations
### Install Processing IDE
Download the Processing IDE (version 3.5.4) https://processing.org/download<br>
Move the unzipped software to your applications folder - or leave it in downloads ( bad habit :-/ )<br>
Open it and run an example from the examples menu to verity that it works<br>
- Path to examples menu: (top menu) -> file -> examples<br>

### Install the following libraries into the processing IDE from the built-in libraries manager.
- oscP5
- The MidiBus
- dmxP512
- Open Kinect for Processing
- Video

Path to libraries manager: (top menu) -> sketch -> import library -> add library

### Install Ableton Live (free trial) - unless you have a licensed version
- https://www.ableton.com/en/trial/

### Download the source codes from this repository
<br><br>

## Processing hints
Links
- [map()](https://processing.org/reference/map_.html)
- [dist()](https://processing.org/reference/dist_.html)
- [constrain()](https://processing.org/reference/constrain_.html)
- [min()](https://processing.org/reference/min_.html)
- [max()](https://processing.org/reference/max_.html)
- [random](https://processing.org/reference/random_.html)
- [noise()](https://processing.org/reference/noise_.html)
- [noise 1D example](https://processing.org/examples/noise1d.html)

IDE (code editor)
- Inside the editor: Right-click on highlighted code and choose "find in reference" to see documentation.
- Use the examples provided with Processing to get inspired: (top-menu) -> File -> Examples

## Background materials
- What is Processing [link](https://processing.org/)
- What is the Kinect [link](https://www.youtube.com/watch?v=QmVNgdapJJM&list=PLRqwX-V7Uu6ZMlWHdcy8hAGDy6IaoxUKf&ab_channel=TheCodingTrain)<br>
- What is Midi (Musical Instrument Digital Interface) - short read in danish [link](https://da.wikipedia.org/wiki/MIDI) - long read [link](https://en.wikipedia.org/wiki/MIDI)<br>
- What is DMX512 - (Digital Multiplex 512) [link](https://www.learnstagelighting.com/what-is-dmx-512/)<br>
- Daniel Shifman playlist on Computer Vision, blob detection and Kinect [link](https://www.youtube.com/watch?v=nCVZHROb_dE&list=PLRqwX-V7Uu6aG2RJHErXKSWFDXU4qo_ro&index=2&ab_channel=TheCodingTrain)<br>
- Setting up virtual Midi ports [link](https://dialogaudio.com/modulationprocessor/guides/virtual_midi/virtual_midi_setup.php)
- Setting up a virtual Midi network [link](https://help.ableton.com/hc/en-us/articles/209071169-Setting-up-a-virtual-MIDI-network)
