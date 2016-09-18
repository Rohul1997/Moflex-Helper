@echo off
ECHO .........................................
echo .    Moflex Helper      By Rohul1997    .
ECHO .........................................
ECHO.
set /p "title=Project Name: "
if exist "output\%title%\" (
    echo "output\%title%\" folder already exists, will delete the folder. Ok?
    pause>nul
    rd /q /s "output\%title%"
)
md "output\%title%\"
md "input\%title%\"
xcopy "template\*" "output\%title%\" /e /i /y >nul
cls
echo Mobiclip will open next with a preloaded template.
echo Press Enter To Continue...
pause>nul
cls
echo Open up your video files by double-clicking "Video Files" and then "Browse".
echo You can then select the +/- button to select multiple files on that directory
echo if you have more than one video. Then press ok. Next double-click
echo "Mobiclip Encoder" and select your output directory of where you would like to
echo save your moflex videos. Then press ok. Next press "Queue Job" and click on the
echo "Progress" tab and wait until the process has been completed.
echo Then close Mobiclip and come back here.
"tools\3ds_template.mograph"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Now rename your .moflex files correctly.
echo For example Episode 1 would be movie_0.moflex and
echo episode 2 would be movie_1.moflex and so on...
echo Press Enter To Continue...
pause>nul
cls
echo Next move all of your moflex files to the "input\%title%\" folder
echo Once your done come back here
echo Press Enter To Continue...
pause>nul
copy "tools\template.png" "input\%title%\"
cls
echo Now you will create bimg file(s). Which is an image that shows up on the top
echo screen when selecting a video on your 3DS.
echo go to the "input\%title%\" folder and you will find a "template.png" file.
echo Open and edit the image file with your own image.
echo On the top-left where it is blank, thats where your image must be. Then save.
echo Press Enter To Continue...
pause>nul
copy "tools\movie_.bimg" "input\%title%\"
cls
echo BIMG-PGN converter will open next.
echo Press Enter To Continue...
pause>nul
cls
echo Click on "RGB565" and then Click on open "Open bimg file"
echo inside the "input\%title%\" folder you will find a "movie_.bimg" file open that.
echo Then click on "import bitmap" and open up your image that you edited before.
echo Now press "save bimg file". Save them in the "input\%title%\" folder
echo The bimg files need to be named the same way your moflex videos are named as.
echo Also each moflex video must have a bimg file.
echo for example
echo movie_0.moflex, movie_0.bimg, movie_1.moflex, movie_1.bimg and so on...
echo You may choose to use a different image on your bimg file for each video or
echo you could just use the same one for all.
echo close BIMG-PGN and come back here.
"tools\BIMG-PGN Converter.exe"
cls
echo Press Enter To Continue...
pause>nul
cls
echo VoodooChaos will open next.
echo Press Enter To Continue...
pause>nul
cls
echo Click the button "Open Exheader File" then go to the directory:
echo "output\%title%\"
echo and open up the "DecryptedExHeader.bin" file.
echo Now where it says "New Unique ID" put in your desired Title ID
echo (only characters 0-9 and/or A-F can be used) then press "Save Exheader File"
echo Then close VoodooChaos and come back here.
"tools\VoodooChaos.exe"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Notepad++ will open the "movie_title.csv" file next.
echo Press Enter To Continue...
pause>nul
cls
echo Edit the file to the text you would like each video to be called.
echo You may notice the text is repeated 12 times for each video. This is because
echo each one represents a different language. You may choose to write it in
echo different languages or you could just leave it the same for each. To do so you
echo could just find and replace. Make sure you do not use a comma (,) for your text.
echo There should only be 1 comma separating each one. Remember to save.
echo Then close Notepad++ and come back here.
"tools\Notepad++\notepad++.exe" "output\%title%\ExtractedRomFS\movie\movie_title.csv"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Notepad++ will open the "movie_bnrname.csv" file next.
echo Press Enter To Continue...
pause>nul
cls
echo Set the first line to the number of videos you are using.
echo The next set of lines are the names of the .bimg files that will be included.
echo These are placed separately on each line. So add or remove the number of bimg
echo you got. Remember to save.
echo Then close Notepad++ and come back here.
"tools\Notepad++\notepad++.exe" "output\%title%\ExtractedRomFS\settings\movie_bnrname.csv"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Notepad++ will open the "settingsTL.csv" file next.
echo Press Enter To Continue...
pause>nul
cls
echo now on line 38 you will see some Japanese text
echo Below that are texts that will show up on your top screen below thumbnail.
echo Below some Japanese text on line 75, you put the your title ID
echo that you put previously when editing the "DecryptedExHeader.bin" file
echo using VoodooChaos. Which are the last 5 digits.
echo Then below some Japanese text on line 96, you set that to the number of
echo videos you are using. Remember to save.
echo Then close Notepad++ and come back here.
"tools\Notepad++\notepad++.exe" "output\%title%\ExtractedRomFS\settings\settingsTL.csv"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Now put a png image inside "input\%title%\" for the banner. Which should be
echo 256x128 and name it as "banner.png"
echo Also put a png image inside "input\%title%\" for the icon. Which should be
echo 48x48 and name it as "icon.png"
echo Also put a wav sound file inside "input\%title%\" for the banner sound.
echo This should be about 3 seconds long. Use Audacity to make one and name it as
echo "banner.wav"
echo Once your done come back here
echo Press Enter To Continue...
pause>nul
move "input\%title%\banner.png" "tools"
move "input\%title%\banner.wav" "tools"
move "input\%title%\icon.png" "tools"
cd tools
bannertool.exe makebanner -i banner.png -a banner.wav -o banner.bin
cls
set /p "st=Short Title: "
set /p "lt=Long Title: "
set /p "pub=Publisher: "
bannertool.exe makesmdh -s "%st%" -l "%lt%" -p "%pub%" -i icon.png -o icon.bin
cd..
move "tools\banner.png" "input\%title%"
move "tools\banner.wav" "input\%title%"
move "tools\icon.png" "input\%title%"
move "tools\banner.bin" "output\%title%\ExtractedExeFS"
move "tools\icon.bin" "output\%title%\ExtractedExeFS"
copy "output\%title%\ExtractedExeFS\icon.bin" "output\%title%\ExtractedRomFS\icon.icn"
del "input\%title%\movie_.bimg"
move "input\%title%\*.bimg" "output\%title%\ExtractedRomFS\movie"
move "input\%title%\*.moflex" "output\%title%\ExtractedRomFS\movie"
cls
echo Press Enter To Continue...
Pause>nul
cls
echo 3DSBuilder will open next
echo Press Enter To Continue...
pause>nul
cls
echo Now you need to locate the paths and files.
echo For each one you may manually locate them by pressing on the buttons and going
echo to them directly or you could just copy and paste the paths from file explorer
echo to their correct boxes.
echo For Romfs locate it to "output\%title%\ExtractedRomFS"
echo For Exefs locate it to "output\%title%\ExtractedExeFS"
echo For Exheader locate it to "output\%title%\DecryptedExHeader.bin"
echo If you get prompted by something just press no.
echo Choose the save location to "CiaConvert\roms" and name it as anything but make
echo sure you add the .3ds extension on the end.
echo Change the "XXXX" inside the seriel box to anything you want.
echo Then press "Go" and wait for it to complete building the .3DS file.
echo Then close 3DSBuilder and come back here.
"tools\3DSBuilder.exe"
cls
echo Press Enter To Continue...
pause>nul
cls
echo 3ds_simple_cia will open next
echo Press Enter To Continue...
pause>nul
cls
echo Now click on "Create 'ncchinfo.bin' file". Then use the folder "CiaConvert\roms"
echo and then save the "ncchinfo.bin" file. Copy that nchinfo.bin file onto your 3DS
echo and use Decrypt9 to create Xorpads. After that back on your PC copy the Xorpads
echo on to the "CiaConvert\xorpads" folder. Then on 3ds_simple_cia click on
echo "Convert 3DS ROM to CIA" and use the folder "CiaConvert\roms" Now wait for it to
echo complete converting to a CIA file. You should see prompt that says "Finished".
echo After that close 3ds_simple_cia and come back here.
"CiaConvert\3ds_simple_cia.exe"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Your converted CIA file should be inside the "CiaConvert\cia" folder.
echo That should be your Moflex CIA. Now to install and test on your 3DS.
echo Press Enter To Close...
Pause>nul