# RARToQTTranslator
This came from the need to edit DPX image sequence in ProRes4444. The bandwidth and storage requirement to work directly in DPX image sequences compared to the lost of visual quality that can not be detected by the human eye means ProRes4444 is the solution for us.

The problem is that to automate the conversion at the time, there was not really a good method. Apple's Compressor can do the job, but there is a color shift due to the way QT assumes what color space it's working in.  I wrote Apple, they confirmed the problem, but it was way down on their list of things to work on. I couldn't find anything else that can do the automated transcoding, so decided to write my own solution by stringing RAR, AJA DPXToQTTranslator and Adobe Media Enocoder together through Applescript. This is the resulting script that did the automatic transcoding by watching a "hot folder" for incoming DPX image sequence compressed via RAR to speed up the transfer.

I don't know who else needs something like this, so if you do you can benefit from my work. I would appreciate it if you let me know how it's helping your workflow. - Meza Hsu
