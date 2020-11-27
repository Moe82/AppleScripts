repeat
 set statusOld to checkStatus()
 set statusNew to checkStatus()
 repeat while statusOld is equal to statusNew
 delay 1 --for 1 second checks
 set statusNew to checkStatus()
 end repeat
 if statusNew is true then
 display dialog "Device Added - put some real code here"
 else
 display dialog "Device Removed - put some real code here"
 end if
end repeat
on checkStatus()
 
 (*Delete the 2 lines below when done testing*)
 set myString to button returned of (display dialog "Connected?" buttons {"Yes", "No"})
 set myString to "name: DR-BT101 Connected: " & myString
 
 (*uncomment line below when done testing*)
 --set myString to do shell script "system_profiler SPBluetoothDataTyp"
 
 --initial check if it's not even there
 if myString does not contain "DR-BT101" then
 return false
 else
 
 --find out if connected/disconnected
 set AppleScript's text item delimiters to "name:"
 set myList to the text items of myString --each item of mylist is now one of the devices
 
 set numberOfDevices to count of myList
 set counter to 1
 repeat numberOfDevices times --loop through each devices checking for Connected string
 if item counter of myList contains "DR-BT101" then
 if item counter of myList contains "Connected: Yes" then
 return true
 else if item counter of myList contains "Connected: No" then
 return false
 else
 display dialog "Error Parsing" --this shouldn't happen
 end if
 end if
 set counter to counter + 1
 end repeat
 end if