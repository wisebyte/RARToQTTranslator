# RARToQTTranslator
This came from the need to edit DPX image sequence in ProRes4444. The bandwidth and storage requirement to work directly in DPX image sequences compared to the lost of visual quality that can not be detected by the human eye means ProRes4444 is the solution for us.

The problem is that to automate the conversion at the time, there was not really a good method. Apple's Compressor can do the job, but there is a color shift due to the way QT assumes what color space it's working in.  I wrote Apple, they confirmed the problem, but it was way down on their list of things to work on. I couldn't find anything else that can do the automated transcoding, so decided to write my own solution by stringing RAR, AJA DPXToQTTranslator and Adobe Media Enocoder together through Applescript. This is the resulting script that did the automatic transcoding by watching a "hot folder" for incoming DPX image sequence compressed via RAR to speed up the transfer.

I don't know who else needs something like this, so if you do you can benefit from my work. I would appreciate it if you let me know how it's helping your workflow.

Made by Meza Hsu Oct. 24th 2012 to solve the problem of DXP to ProRes conversion

## Changlog ##

version 8.2 2015.07.23
+ Delete Adobe Media Enocder source files when AME is done converting, so it won't fill up the hard drive
version 8.1 2015.02.10
+	Remove cycle twice add putting in a "plug" to work with the Gate Keeper
version 8.0 2014.10.16
+	Need to run the cycle twice, so that it will pick up anything else that came it after the script had triggered.
+	still working on this: Need the ability to prase episode and put the ProRes and DPX into the Final Cut Server.
+	Start and stop AME each time due to H264 crashing overtime - Adobe Media Encoder bug

version 7.0 2014.04
+	added a few more Gizmo expressions, change storage pointer to sbWorkspace, updated verbage to indicate that the corruption happens before the transfer not during the transfer
	
version 6.02 2014.03.27
+	stop multi-mount problem
	
version 6.01 2013.10.22
+	Just updated the error message to reflect the new naming convention.
+	Eliminated the FTP section since we are now getting it directly from FileCatalyst.
	
version 6.00 2013.06.12
+	It will now detect iteration number and add matching iteration naming to the dpx files
+	This will also split the script, so that moving after AME transcoding and notification are done separately and hopefully DAM will take over that part of the job eventually.
+	It's also possible now to have a watch folder script to delete files ready for processing instead of depending on timed cycles
	
version 5.00 2013.02.07
+	major changes:
+	detects .rar extension on incoming file, so resumeable upload that has temporary extension may be used
+	write out stats to help with auto reporting
+	remove almost all bash related scripting, so that it's more efficient
+	added dynamic configuration settings, so when it's on a brand new system it will prompt for configuration and save it in a preference file
+	converting by wrapping DPX into a MOV by using AJA's DPXToQTTranslator app., unfortunately the latest version is not Applescriptable, so have to do keystrokes
+	send to AME for conversion to H264 and ProRes
+	wait for AME to finish
+	rename the files then send to proper RAID destinations
