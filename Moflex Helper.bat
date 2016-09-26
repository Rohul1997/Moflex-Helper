@echo off
color 0e
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
echo INFO:
echo Mobiclip will open with a template graph.
echo Please Follow ALL Instructions Here Carefully!
echo.
echo Press Enter To Continue...
pause>nul
cls
echo Step 1.
echo Open up your video files by double-clicking the Red "Video Files" Box.
echo.
echo Step 2.
echo Then Click "Browse" and navigate to your video files.
echo.
echo INFO:
echo Use the +/- button to select multiple files of a given directory. Press OK.
echo.
echo Step 3.
echo Double-click the Red "Mobiclip Encoder" Box.
echo.
echo Step 4.
echo Select your output directory of your file/s
echo save to the Input folder: "Moflex Helper\input\%title%\" and press OK.
echo.
echo Step 5.
echo Next press "Queue Job" and click OK.
echo.
echo THIS MAY TAKE A LONG TIME! Please Be Patient,
echo.
echo INFO:
echo You can Check the Progress on the "Jobs" and "Progress" Tabs.
echo When finished, close Mobiclip and come back here.
"tools\3ds_template.mograph"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Step 6
echo In your Input folder ("Moflex Helper\input\%title%\"),
echo Rename the .Moflex Files Carefully.
echo Video01 = "movie_0.moflex"
echo Video02 = "movie_1.moflex"
echo Video03 = "movie_2.moflex"
echo And so on...
echo Video12 = "movie_13.moflex"
echo.
echo CAREFULL!!! (its easy to get confused here!)
echo.
echo Press Enter To Continue...
pause>nul
copy "tools\template.png" "input\%title%\"
cls
echo INFO:
echo Now you need bimg file(s). Which are thumbnail images.
echo They appear on the top screen of the 3DS when selecting a video.
echo.
echo Step 1
echo Go to the "Moflex Helper\input\%title%\" folder
echo and you will find a "template.png" file.
echo Open and edit the image file with your own image
echo.
echo INFO:
echo Paste and resize your image into the empty box, within the template,
echo leave the black boarder alone!
echo CAUTION!
echo 1 pixel out of place ruins it all!
echo On the top-left where it is blank, thats where your image must be. Then save.
echo.
echo Press Enter To Continue...
pause>nul
copy "tools\movie_.bimg" "input\%title%\"
cls
echo BIMG-PGN Converter will open next.
echo.
echo Press Enter To Continue...
pause>nul
cls
echo Step 1.
echo Click on "RGB565" and then Click on open "Open bimg file"
echo in the "Moflex Helper\input\%title%\" folder you will find a "movie_.bimg" file open that.
echo.
echo Step 2.
echo Click "import bitmap" and open up the image that you edited before.
echo.
echo Step 3
echo Click "save bimg file". Save in the "Moflex Helper\input\%title%\" folder.
echo.
echo INFO:
echo The bimg files need to be named the same way your moflex videos are...
echo (you HAVE to add ".bimg" the program wont do it for you!)
echo Also each moflex video must have a bimg file.
echo E.G
echo movie_0.moflex, movie_0.bimg,
echo movie_1.moflex, movie_1.bimg and so on...
echo.
echo You may choose to use a different image in your bimg file for each video or
echo you could just use the same one for all.
echo (Save one, then copy and rename it)
echo.
echo close BIMG-PGN Converter and come back here.
"tools\BIMG-PGN Converter.exe"
cls
echo Press Enter To Continue...
pause>nul
cls
echo VoodooChaos will open next.
echo.
echo Press Enter To Continue...
pause>nul
cls
echo Step 1
echo Click the "Open Exheader File" button, then go to the directory:
echo "Moflex Helper\output\%title%\"
echo open up the "DecryptedExHeader.bin" file.
echo.
echo Step 2.
echo Where it says "New Unique ID" put in your desired Title ID
echo (only characters 0-9 and/or A-F can be used. Must be 6 Characters long!
echo Must start with "00" the other four numbers are yours to choose)
echo then press "Save Exheader File"
echo.
echo Close VoodooChaos and come back here.
"tools\VoodooChaos.exe"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Notepad++ will open the "movie_title.csv" file next.
echo.
echo Press Enter To Continue...
pause>nul
cls
echo Step 1.
echo Replace:
echo 01 - Red Night,01 - Red Night,01 - Red Night, ... 01 - Red Night,01 - Red Night
echo.
echo with...
echo.
echo 01 - My Title,01 - My Title,01 - My Title, ... 01 - My Title,01 - My Title
echo (copy 12 times, the last has no ',')
echo.
echo INFO:
echo You may notice the text is repeated 12 times for each video. This is because
echo each one represents a different language. You may choose to write it in
echo different languages or you could just leave it the same for each.
echo To do so you could just find and replace. (ctrl+H)
echo Make sure you do not use a comma (,) for your text.
echo There should only be 1 comma separating each one... no space.
echo.
echo Remember to save.
echo Then close Notepad++ and come back here.
"tools\Notepad++\notepad++.exe" "output\%title%\ExtractedRomFS\movie\movie_title.csv"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Notepad++ will open the "movie_bnrname.csv" file next.
echo.
echo Press Enter To Continue...
pause>nul
cls
echo Step 1.
echo Set the number on the first line to the number of videos you are using.
echo.
echo INFO: The rest of lines are the names of the
echo .bimg files that will be included.
echo These are placed separately on each line. So add or remove the number of bimg
echo you have. Remember to save.
echo.
echo Then close Notepad++ and come back here.
"tools\Notepad++\notepad++.exe" "output\%title%\ExtractedRomFS\settings\movie_bnrname.csv"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Notepad++ will open the "settingsTL.csv" file next.
echo.
echo Press Enter To Continue...
pause>nul
cls
echo Step 1
echo On line 38 you will see some Japanese text
echo Below that are texts that will show up on your top screen below thumbnail.
echo Change them to what you want, but they all have to be the same.
echo.
echo Step 2
echo on line 76, you put the your title ID
echo (Must be a 5 digit hex number begining with "0". I.E. "011DF")
echo.
echo INFO:
echo This MUST be the same as the Title ID from the "DecryptedExHeader.bin"
echo file you edited earlyer using VoodooChaos.
echo If the number there was "0011DF"
echo then the number here must be "011DF"
echo.
echo Step 3
echo On Line 97, Set the Number the the amount of videos you are using.
echo Remember to save.
echo.
echo Then close Notepad++ and come back here.
"tools\Notepad++\notepad++.exe" "output\%title%\ExtractedRomFS\settings\settingsTL.csv"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Now put a png image inside "input\%title%\" for the banner.
echo Rename it to "banner.png"
echo Also put a png image inside "input\%title%\" for the icon.
echo Rename it to "icon.png"
echo Also put a wav sound file inside "input\%title%\" for the banner sound.
echo.
echo INFO:
echo This should only be 3 seconds or less.
echo Use Audacity to make one (Check the "Moflex Helper\Extras" Folder for the Installer + Plugins)
echo and save it as "banner.wav"
echo.
echo Once your done come back here
echo.
echo Press Enter To Continue...
pause>nul
"tools\convert" "input\%title%\banner.png" -resize 196x101! "input\%title%\tempbanner.png"
del "input\%title%\banner.png"
"tools\convert" "tools\TemplateBanner.png" "input\%title%\tempbanner.png" -geometry +30+8 -composite "input\%title%\banner.png"
del "input\%title%\tempbanner.png"
"tools\convert" "input\%title%\icon.png" -resize 38x38! "input\%title%\tempicon.png"
del "input\%title%\icon.png"
"tools\convert" "tools\TemplateIcon.png" "input\%title%\tempicon.png" -gravity center -composite "input\%title%\icon.png"
del "input\%title%\tempicon.png"
ren "input\%title%\*.wav" "banner.wav"
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
echo.
echo Press Enter To Continue...
pause>nul
cls
echo Step 1
echo You need to locate the Folders and Files.
echo For each one, click the buttons and find the Folders
echo (for ExtractedRomFS and ExtractedExeFS)
echo and file (for DecryptedExHeader.bin)
echo.
echo INFO:
echo Navigate directly or just copy and paste the file paths from explorer
echo to their correct boxes.
echo.
echo For Romfs locate it to "output\%title%\ExtractedRomFS"
echo For Exefs locate it to "output\%title%\ExtractedExeFS"
echo For Exheader locate it to "output\%title%\DecryptedExHeader.bin"
echo.
echo If you get prompted by something just press no.
echo Choose the save location to "Moflex Helper\CiaConvert\roms"
echo and name it as anything but make
echo sure you add the ".3ds" extension on the end.
echo.
Echo Step 2
echo Change the "XXXX" inside the seriel box to anything you want.
echo Then press "Go" and wait for it to complete building the .3DS file.
echo.
echo Then close 3DSBuilder and come back here.
"tools\3DSBuilder.exe"
cls
echo Press Enter To Continue...
pause>nul
cls
echo 3ds_simple_cia will open next
echo.
echo Press Enter To Continue...
pause>nul
cls
echo Step 1.
echo Click on "Create 'ncchinfo.bin' file".
echo Then use the folder "Moflex Helper\CiaConvert\roms"
echo and then save the "ncchinfo.bin" file.
echo.
echo Step 2.
echo Copy that nchinfo.bin file onto your 3DSs SD Card,
echo insert into 3DS and use Decrypt9 to create Xorpads.
echo.
echo Step 3.
echo copy the Xorpads to the "Moflex Helper\CiaConvert\xorpads" folder.
echo Then on 3ds_simple_cia click on
echo "Convert 3DS ROM to CIA" and use the folder "Moflex Helper\CiaConvert\roms"
echo.
echo Step 4.
echo Now wait for it to complete converting to a CIA file.
echo You should eventually see prompt that says "Finished".
echo.
echo INFO:
echo (Until this moment, it can appear
echo that the convert has crashed/frozen, do not panic,
echo just leave it, it can take a while!)
echo.
echo After that close 3ds_simple_cia and come back here.
"CiaConvert\3ds_simple_cia.exe"
cls
echo Press Enter To Continue...
pause>nul
cls
echo Your converted CIA file will be inside the
echo "Moflex Helper\CiaConvert\cia" folder.
echo Now to install and test on your 3DS.
echo.
echo Press Enter To Close...
Pause>nul
