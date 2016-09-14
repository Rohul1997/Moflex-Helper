@echo off
echo Moflex Helper
set /p "title=Project Name: "
if exist "output\%title%\" (
    echo "output\%title%\" folder already exists, will delete the folder. Ok?
    pause
    RD /q /s "output\%title%"
)
md "output\%title%\"
md "input\%title%\"
xcopy "template\*" "output\%title%\" /e /i /y >nul
cls
echo VoodooChaos will open next.
echo Click the button "Open Exheader File" then go to the directory:
echo "output\%title%\"
echo and open up the "DecryptedExHeader.bin" file.
echo Now where it says "New Unique ID" put in your desired Title ID
echo (must be 0-9 and/or A-F) then press "Save Exheader File" and close VoodooChaos.
echo Then come back here.
echo Press Enter To Continue...
pause>nul
"tools\VoodooChaos.exe"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Mobiclip will open next with a preloaded template.
echo Open up your video files by double-clicking "Video Files" and then "Browse".
echo You can then select the +/- button to select multiple files on that directory
echo if you have more than one video. Then press ok. Next double-click
echo "Mobiclip Encoder" and select your output directory of where you would like to
echo save your moflex videos. Then press ok. Next press "Queue Job" and click on the
echo "Progress" tab and wait until the process has been completed.
echo Then close Mobiclip and come back here.
echo Press Enter To Continue...
pause>nul
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
echo BIMG-PGN converter will open next. Click on "RGB565".
echo Click on open "Open bimg file"
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
echo Press Enter To Continue...
pause>nul
"tools\BIMG-PGN Converter.exe"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Notepad++ will open the "movie_title.csv" file next.
echo Edit the file to the text you would like each video to be called.
echo You may notice the text is repeated 12 times for each video. This is because
echo each one represents a different language. You may choose to write it in
echo different languages or you could just leave it the same for each. To do so you
echo could just find and replace. Remember to save.
echo Then close Notepad++ and come back here.
echo Press Enter To Continue...
pause>nul
"tools\Notepad++\notepad++.exe" "output\%title%\ExtractedRomFS\movie\movie_title.csv"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Notepad++ will open the "movie_bnrname.csv" file next.
echo Set the first line to the number of videos you are using.
echo The next set of lines are the names of the .bimg files that will be included.
echo These are placed separately on each line. So add or remove the number of bimg
echo you got. Remember to save.
echo Then close Notepad++ and come back here.
echo Press Enter To Continue...
pause>nul
"tools\Notepad++\notepad++.exe" "output\%title%\ExtractedRomFS\movie\movie_bnrname.csv"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Notepad++ will open the "settingsTL.csv" file next.
echo now on line 38 you will see some Japanese text
echo Below that are texts that will show up on your top screen below thumbnail.
echo Below some Japanese text on line 75, you put the your title ID
echo that you put at the beginning when editing the "DecryptedExHeader.bin" file
echo using VoodooChaos.
echo Then below some Japanese text on line 96, you set that to the number of
echo videos you are using. Remember to save.
echo Then close Notepad++ and come back here.
echo Press Enter To Continue...
pause>nul
"tools\Notepad++\notepad++.exe" "output\%title%\ExtractedRomFS\movie\settingsTL.csv"
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
cls
pause>nul
move "tools\banner.png" "input\%title%"
move "tools\banner.wav" "input\%title%"
move "tools\icon.png" "input\%title%"
del "output\%title%\ExtractedExeFS\banner.bin"
del "output\%title%\ExtractedExeFS\icon.bin"
del "output\%title%\ExtractedRomFS\icon.icn"
move "tools\banner.bin" "output\%title%\ExtractedExeFS"
move "tools\icon.bin" "output\%title%\ExtractedExeFS"
copy "output\%title%\ExtractedExeFS\icon.bin" "output\%title%\ExtractedRomFS\icon.icn"
cls
echo Press Enter To Continue...
Pause>nul
