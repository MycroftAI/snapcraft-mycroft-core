<h1>
  <img src="https://avatars1.githubusercontent.com/u/29598503?v=3&s=32" alt="Project"> 
  Mycroft Snap
</h1>
<p>
<a href="https://snapcraft.io/mycroft">
<img alt="mycroft" src="https://snapcraft.io/mycroft/badge.svg" />
</a>
</p>

<p>This is the snap for Mycroft AI, the world’s first open source voice assistant. It works on Ubuntu, Fedora, Debian, and other major Linux distributions.</p>



## Install

    sudo snap install mycroft
    snap connect mycroft:audio-record # Enable microphone access

([Don't have snapd installed?](https://snapcraft.io/docs/core/install))

### Create an account
Setup your account at https://home.mycroft.ai

### Launch the Snap 
Launching Mycroft using the desktop icon or application launcher will run in the background. 

To run Mycroft with a visual CLI, launch the Snap from your Terminal by running mycroft

<!-- Uncomment and modify this when you have a screenshot
![my-snap-name](screenshot.png?raw=true "my-snap-name")
-->

## Known Issues
This Snap is being actively developed. There are a few known bugs we are currently working through:

* After pairing with your account, Mycroft will immediately report that it is ready. There may still be some setup processes finalizing and Mycroft may not respond to commands immediately. Please give it a few more minutes to finish setting up.
* An `OSError` will be raised for each installation using PIP. This should not affect your usage of the system.
Additional command line tools such as the Mycroft Skills Manager are not yet available. Skills can be installed by voice:  
_"Hey Mycroft, install Dice Skill"_  
Or by typing directly in the Mycroft CLI:  
_"install https://github.com/author/skill-repo"_
* The wake word response time may also be slower than expected. This is the time between you saying "Hey Mycroft" and Mycroft acknowledging and starting to record.

## Community and Support
Mycroft has a vibrant, engaged and helpful community. Join us at

* Community Chat - https://chat.mycroft.ai
* Community Forums - https://community.mycroft.ai
