#!/usr/bin/osascript
-- set delimiter
set AppleScript's text item delimiters to {"_"}
-- here's the .counter file dictionary below:
set good_counter to 0 -- line 1: to help generate a journal of good files processed
set btrans_counter to 0 -- line 2: to help generate a journal of bad transfer files received
set bname_counter to 0 -- line 3: to help generate a journal of badly named files received

-- Gizmo's closings… give him some personality
set gizmoto to {"Ready for warp speed!", "Can't wait for the next adventure!", "Woohoo!", "Ready for the next batch!", "Can't wait to see the next episode!", "Keep up the good work!", "I wish Professor Quantum can see you now!", "Piece!", "You rule!", "That's the way I like it!", "I'm glad you are so efficient!", "Wonder where we are going next!", "I have not detected an era,", "BTW Do you know where Chris and Joy are?", "I'm going to charge up a bit after this,", "I like that new thing you are doing!", "Did you miss me?", "I can't wait to work with DAM!", "I have an idea for a great story!", "I think I'm getting a Shotgun.", "Finally, storage migration is completed.", "It's time for the next time!"}

-- notification lists
set notify_good to "Good RAR" -- make sure the AddressBook contains both of these groups, make this into official Exchange notification group later
set notify_bad to "Bad RAR"

-- read from preference file then mount if preference file exists… if not ask for paths then write it out to a preference file
set Preference_folder to (path to library folder from user domain as string) & "Preferences:"
set preferencefile to Preference_folder & "com.meza.RAR2AJA.preferences"
tell application "Adobe Media Encoder CS6" to launch -- startup the Media Encoder
tell application "Finder"
	
	if exists preferencefile then
		set theFileReference to open for access preferencefile
		set parse_preferences to read theFileReference using delimiter return
		close access theFileReference
		set storage_server to item 1 of parse_preferences
		set storage_base to item 2 of parse_preferences
		-- set wtf_server to item 1 of parse_preferences
		-- set wtf_base to item 2 of parse_preferences
		-- set raid1_server to item 3 of parse_preferences
		-- set raid1_base to item 4 of parse_preferences
		-- set raid2_server to item 5 of parse_preferences
		-- set raid2_base to item 6 of parse_preferences
		
		set local_base to item 3 of parse_preferences
		set ame_base to item 4 of parse_preferences -- Adobe Media Encoder watch folder
		-- if not (exists disk wtf_base) then mount volume wtf_server
		-- if not (exists disk raid1_base) then mount volume raid1_server
		-- if not (exists disk raid2_base) then mount volume raid2_server
	else
		-- display dialog "Path to WAN Transferred Files Server:" default answer "smb://ftp.cbn.org/superbookwk"
		-- set wtf_server to text returned of result
		-- display dialog "Path to Superbook RAID:" default answer "afp://superbook-server/SB 28TB RAID/"
		-- set raid1_server to text returned of result
		-- display dialog "Path to Superbook RAID2:" default answer "afp://superbook-server/SB 28TB RAID2/"
		-- set raid2_server to text returned of result
		display dialog "Path to Superbook Storage:" default answer "nfs://nl.nas.cbn.local/ifs/Superbook/sbWorkspace"
		set storage_server to text returned of result
		
		try
			with timeout of 1200 seconds
				-- mount volume wtf_server
				-- mount volume raid1_server
				--	mount volume raid2_server
			end timeout
		on error
			quit
		end try
		
		--	set wtf_base to choose folder with prompt "Mounted WAN Transferred Folder:"
		--	set wtf_base to wtf_base as string
		--	set raid1_base to choose folder with prompt "Mounted Superbook RAID1:"
		--	set raid1_base to {raid1_base, "Converted:"} as string
		--	set raid2_base to choose folder with prompt "Mounted Superbook RAID2:"
		--	set raid2_base to {raid2_base, "Converted:"} as string
		set storage_base to choose folder with prompt "Where to put the converted files:"
		set storage_base to {storage_base, "Converted:"} as string
		
		set local_base to choose folder with prompt "Choose location for local caching:"
		set local_base to local_base as string
		set ame_base to choose folder with prompt "Adobe Media Encoder Watch Folder:"
		set ame_base to ame_base as string
		
		set theFileReference to open for access preferencefile with write permission
		set eof of theFileReference to 0
		--	write (wtf_server as string) & return & (wtf_base as string) & return & (raid1_server as string) & return & (raid1_base as string) & return & (raid2_server as string) & return & (raid2_base as string) & return & (local_base as string) & return & (ame_base as string) & return to the theFileReference starting at eof
		write (storage_server as string) & return & (storage_base as string) & return & (local_base as string) & return & (ame_base as string) & return to the theFileReference starting at eof
		
		close access theFileReference
	end if
end tell

-- now that we know where local_base is set the posix equvilent so that we can unrar via the unrar binary
set posix_local_base to POSIX path of local_base

-- figure out the 8 digit date name to name the folder created for each day
set mm to month of (current date) as integer
if mm < 10 then set mm to {"0", mm} as string -- put in an extra zero to make the file name uniform
set yy to year of (current date)
set dd to day of (current date) as integer
if dd < 10 then set dd to {"0", dd} as string -- put in an extra zero to make the file name uniform
set date_folder to {yy, "-", mm, "-", dd} as string
set dated to {yy, mm, dd} as string


-- check to see if the needed sub-folders exist, if not then create them
tell application "Finder"
	set folder_add to local_base & "rar:"
	if not (exists folder folder_add) then make new folder at local_base with properties {name:"rar"}
	set lrar_folder to local_base & "rar:"
	
	set folder_add to lrar_folder & "working:" -- making the "plug" folder so no more files will come into the queue when the script is already working
	if not (exists folder folder_add) then make new folder at local_base & "rar:" with properties {name:"working"}
	set plug_folder to local_base & "rar:working:"
	
	set folder_add to local_base & "aja:"
	if not (exists folder folder_add) then make new folder at local_base with properties {name:"aja"}
	set aja_folder to local_base & "aja:"
	
	set folder_add to local_base & "log"
	if not (exists folder folder_add) then make new folder at local_base with properties {name:"log"}
	set log_folder to local_base & "log:"
	set folder_add to storage_base & "mp4:" & date_folder
	if not (exists folder folder_add) then make new folder at (storage_base & "mp4:") with properties {name:date_folder}
	set folder_add to storage_base & "ProRes:" & date_folder
	if not (exists folder folder_add) then make new folder at (storage_base & "ProRes:") with properties {name:date_folder}
	set ame_output to (ame_base & "output:")
end tell



-- find if log of the day exists, if not create a new one
set counter_file to log_folder & dated & ".counter"
tell application "Finder"
	if not (exists file counter_file) then
		set theFileReference to open for access counter_file with write permission
		set eof of theFileReference to 0
		write "0" & return & "0" & return & "0" & return to theFileReference starting at eof
		close access theFileReference
	else
		set theFileReference to open for access counter_file
		set parse_counter to read theFileReference using delimiter return
		close access theFileReference
		set good_counter to item 1 of parse_counter
		set btrans_counter to item 2 of parse_counter
		set bname_counter to item 3 of parse_counter
	end if
end tell

-- unrar section
set lrar_folder to local_base & "rar:"
set good_list to {} -- clear out the good RAR files list before counting up each of the good RAR files to be included in the notification e-mail

repeat
	tell application "Finder" to set drill_files to name of files of folder lrar_folder
	if drill_files is {} then exit repeat
	-- parse name
	set drill_file to item 1 of drill_files as string
	set prefix to text 1 thru 3 of drill_file
	set cam to text 5 thru ((length of drill_file) - 7) of drill_file
	set iteration to text ((length of drill_file) - 5) thru ((length of drill_file) - 4) of drill_file
	set basename to prefix & "_" & cam & "_" & iteration
	set lrarfile to local_base & "rar:" & basename & ".rar"
	(* if prefix < 200 then -- see which RAID to use - all going to RAID2 requested by Lindy on July 15, 2013
		set remote_base to raid1_base
	else
		set remote_base to raid2_base
	end if *)
	set remote_base to storage_base
	
	if prefix = "" then set prefix to "000"
	set prefix to prefix & "_"
	tell application "Finder"
		set folder_add to remote_base & "good:"
		if not (exists folder folder_add) then make new folder at remote_base with properties {name:"good"}
		set folder_add to remote_base & "mp4:"
		if not (exists folder folder_add) then make new folder at remote_base with properties {name:"mp4"}
		set folder_add to remote_base & "ProRes:"
		if not (exists folder folder_add) then make new folder at remote_base with properties {name:"ProRes"}
		set folder_add to remote_base & "badrar:"
		if not (exists folder folder_add) then make new folder at remote_base with properties {name:"badrar"}
	end tell
	
	set lcache_folder to local_base & "cache:"
	
	tell application "Finder"
		set goodfolder to remote_base & "good:"
		set folder_add to goodfolder & date_folder
		if not (exists folder folder_add) then make new folder at goodfolder with properties {name:date_folder}
		set goodfolder to goodfolder & date_folder
	end tell
	
	
	
	set posix_ldpxfolder to posix_local_base & "cache/" & basename & "/"
	set ldpxfolder to lcache_folder & basename & ":"
	
	
	set lajaFolder to local_base & "aja:"
	
	-- there are two tests we need to perform:
	-- 1) test and extract DPX from the RAR file
	tell application "Finder" -- clean up cache
		set folder_add to local_base & "cache:"
		
		if exists folder folder_add then
			delete folder folder_add
		else
			make new folder at local_base with properties {name:"cache"}
		end if
	end tell
	
	try
		-- set corename to text 5 thru (length of basename) of basename
		set lDPXFile to ldpxfolder & prefix & cam & ".0001.dpx"
		
		do shell script "/usr/local/bin/rar/unrar e " & posix_local_base & "rar/" & basename & ".rar " & posix_ldpxfolder -- make sure the the RAR file is good
		set rar_error to false
		try
			alias lDPXFile -- 2) if the RAR file is good, make sure the naming is correct			
			set rar_error to false
		on error
			set rar_error to true
			set error_msg to "档案名不正确。不能有子资料夹并须使用 ###_cam###_##.####.dpx。" & return & "named incorrectly. The RAR file should not include folder and dpx frames should be named ###_cam###_##.####.dpx"
			set bname_counter to bname_counter + 1
		end try
		
	on error
		set rar_error to true
		set error_msg to "是乱码。" & return & "are corrupt."
		set btrans_counter to btrans_counter + 1
	end try
	
	-- converstion to AJA format
	if not (rar_error) then
		-- now that we know the RAR file is good and dpx frames have been extracted, we will need to inject iteration to the dpx name
		set lcache_folder to lcache_folder & basename
		tell application "Finder" to set drill_files to name of files of folder lcache_folder
		
		if drill_files is not {} then
			repeat with drill_file in drill_files
				
				set name_length to length of drill_file
				set name_extension to text (name_length - 3) thru name_length of drill_file
				if name_extension is ".dpx" then -- if it's not a DPX file then skip it
					
					set original_name to lcache_folder & ":" & drill_file
					set new_name to basename & text (name_length - 8) thru name_length of drill_file
					tell application "Finder" to set the name of file original_name to new_name
					
				end if
			end repeat
		end if
		set lDPXFile to lcache_folder & ":" & basename & ".0001.dpx"
		
		-- the conversion can not be directly after the good RAR confirmation because when there is a long sequence it will trigger a timeout, which will cause the RAR file to become falsely identified as a bad RAR
		tell application "AJA DPXToQTTranslator"
			activate
			delay 5
			open lDPXFile
			
			tell application "System Events"
				keystroke "s" using {command down, shift down}
				keystroke return
			end tell
			delay 15
			tell application "Finder"
				repeat
					try
						set firstlook to size of file (ldpxfolder & basename & ".mov")
						delay 5
					on error
						set firstlook to 0
					end try
					try
						set secondlook to size of file (ldpxfolder & basename & ".mov")
						delay 5
					on error
						set secondlook to 1
					end try
					if firstlook = secondlook then exit repeat
				end repeat
				
				move file (ldpxfolder & basename & ".mov") to aja_folder replacing yes
				delay 5
			end tell
			
			activate
			tell application "System Events"
				keystroke "w" using {command down}
			end tell
			
		end tell
		
		--clean up	
		tell application "Finder"
			set goodfolder to remote_base & "good:"
			set folder_add to goodfolder & date_folder
			if not (exists folder folder_add) then make new folder at goodfolder with properties {name:date_folder}
			set goodfolder to goodfolder & date_folder
		end tell
		
		tell application "Finder" -- move good RAR, DPX, ProRes, mp4 from cache to pickup
			with timeout of 1200 seconds
				move lrarfile to folder goodfolder with replacing -- move RAR file
				delete lrarfile
				
				move folder lcache_folder to folder goodfolder with replacing -- move DPX frames
				delete folder lcache_folder
			end timeout
			
		end tell
		copy tab & basename & return to the end of good_list
		set good_counter to good_counter + 1
	else
		-- if there was problems move the bad RAR file to the badrar folder and send out notification
		set badrarfolder to remote_base & "badrar:"
		tell application "Finder"
			set folder_add to badrarfolder & date_folder
			if not (exists folder folder_add) then make new folder at badrarfolder with properties {name:date_folder}
		end tell
		set badrarfolder to badrarfolder & date_folder
		tell application "Finder"
			with timeout of 600 seconds
				move lrarfile to folder badrarfolder with replacing
			end timeout
			delete lrarfile
			if exists folder ldpxfolder then delete folder ldpxfolder
		end tell
		
		-- send notification if bad RAR file is detected
		tell application "Mail"
			set status_msg to make new outgoing message with properties {visible:true, subject:"SuperBook Bad RAR File Detected - " & date_folder, content:"亲爱的每日团队," & return & "Dear Daysview Team:" & return & return & basename & ".rar " & error_msg & return & return & "请检查档案，然后重新发送." & return & "Please check file and resend." & return & return & "谢谢," & return & " Thanks," & return & "Gizmo"}
			tell status_msg
				make new to recipient at end of to recipients with properties {name:notify_bad}
			end tell
			send status_msg
		end tell
	end if
end repeat

-- move files to Adobe Media Encoder watchfolder
tell application "Finder" to set drill_files to name of files of folder aja_folder
if drill_files is not {} then
	repeat with drill_file in drill_files
		tell application "Finder" to move file (aja_folder & drill_file) to folder ame_base with replacing
	end repeat
end if

-- give it some time for AME to start
delay 60

-- find prefix and extension of file then determine if needs to be fixed then fix it then move it… if not ignore
repeat
	-- wait until AME is not busy
	repeat
		tell application "System Events"
			-- set pid to unix id of process "Adobe Media Encoder CS6"
			set cpu_usage to (do shell script "/bin/ps -xco %cpu,command | /usr/bin/awk '/" & "Adobe Media Encoder CS6" & "$/ {print $1}'")
			-- display dialog cpu_usage
			if cpu_usage < 0.1 then exit repeat
			delay 30
		end tell
	end repeat
	
	delay 30 -- give it some time to finish releasing the file
	
	tell application "Finder" to set drill_files to name of files of folder ame_output
	if drill_files is {} then
		exit repeat
	else
		repeat with drill_file in drill_files
			set skip to true
			
			-- parse file name
			set name_length to length of drill_file
			set name_extension to text (name_length - 3) thru name_length of drill_file
			set prefix to "cp_" & first text item of drill_file
			set cam to second text item of drill_file
			set iteration to "v" & third text item of drill_file
			-- display dialog "file prefix: " & prefix & return & "basename: " & basename & return & "file extension: " & name_extension
			if name_extension = ".mov" then
				set destination to "ProRes:"
				set skip to false
			end if
			if name_extension = ".mp4" then
				set destination to "mp4:"
				set skip to false
			end if
			
			-- assemble desired file name
			set new_name to {prefix, cam, iteration} as string
			
			-- move the file if it's a mov or mp4 file, else skip it
			if not skip then
				-- display dialog new_name
				tell application "Finder"
					try
						with timeout of 600 seconds
							set the name of file (ame_output & drill_file) to new_name
							
							move file (ame_output & new_name) to folder (remote_base & destination & date_folder & ":") with replacing
							delete file (ame_output & new_name)
						end timeout
					end try
				end tell
			end if
			
		end repeat
	end if
end repeat

-- send summary notification… send one email per session rather than one email each conversion to cut down on email clutter
if good_counter = 1 then
	set counter_translator to "First cam of the day is in queue. The ProRes and Preview versions are being sent to Superbook storage:"
else
	set counter_translator to "There are now total of " & good_counter & " cams in queue. ProRes and Preview versions are being sent to Superbook storage. See the latest below:"
end if

if (count good_list) > 0 then
	tell application "Mail"
		set status_msg to make new outgoing message with properties {visible:true, subject:"RE: SuperBook Good RAR File Detected - " & date_folder, content:"Dear SuperBook Team," & return & return & counter_translator & return & return & good_list & return & some item of gizmoto & return & "Gizmo"}
		tell status_msg
			make new to recipient at end of to recipients with properties {name:notify_good}
		end tell
		send status_msg
	end tell
end if

-- write out journal
set theFileReference to open for access counter_file with write permission
set eof of theFileReference to 0
write (good_counter & return & btrans_counter & return & bname_counter & return as string) to theFileReference starting at eof
close access theFileReference

-- clean up the trash
tell application "AJA DPXToQTTranslator" to quit
tell application "Adobe Media Encoder CS6" to quit
delay 5
tell application "Finder"
	move folder (ame_base & "Source") to trash
	if folder plug_folder exists then delete folder plug_folder
	empty trash
end tell
