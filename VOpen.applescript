on run {input, parameters}
	
	-- string processing for path to file being opened
	-- 'text' is the data (filename) captured by the GUI click
	-- text given as...
	-- "Macintosh HD:Users:coco_ohno:Documents:Mapz:Toggle:tog.html"
	set item_clicked_on to input as text
	set parse_file_path_cmd to "echo '" & item_clicked_on & "'|sed s#:#/#g|sed s#'Macintosh HD'##g"
	set clean_path to do shell script parse_file_path_cmd
	
	--new tab ?
	if application "Terminal" is running then
		tell application "Terminal"
			activate
			tell application "System Events"
				delay 1.0E-3
				keystroke "t" using {command down}
				delay 1.0E-3
				keystroke "vim "
				keystroke clean_path
				delay 1.0E-3
				key code 36 --enter key 
			end tell
		end tell
		display notification "file opened in new tab"
		delay 2
	else
		tell application "Terminal"
			activate
			delay 1.0E-3
			tell application "System Events"
				keystroke "vim "
				keystroke clean_path
				delay 1.0E-3
				key code 36 --enter key 
			end tell
		end tell
		display notification "file opened in new window"
		delay 3
	end if
end run
