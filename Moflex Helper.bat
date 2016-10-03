@echo off
:: Test for Adminrights
FSUTIL >NUL 2>&1
if ERRORLEVEL 1 (
    color CF
    cls
    echo Access Denied, Installation Aborted....
    echo Run this Program with Administrator Privileges.
    pause
    color 0F
    exit
)
color 0e
echo .........................................
echo .    Moflex Helper      By Rohul1997    .
echo .........................................
echo.
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
echo Double-click the "Mobiclip Encoder" Box.
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
echo You can Check the Progress on the "Jobs Queue" and "Progress" Tabs.
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
cls
echo INFO:
echo Now you need bimg file(s). Which are thumbnail images.
echo They appear on the top screen of the 3DS when selecting a video.
echo.
echo Step 1
echo Copy all of your png files that you would like to use as your bimg images to the
echo "Moflex Helper\input\%title%\" folder
echo.
echo Press Enter To Continue...
pause>nul
cls
:bimg
cls
echo Type in the name of the image that you
echo would like to use as a bimg image (without the file extension)
echo.
set /p "bimg=Name of image to be used as a bimg image (without file extension): "
"tools\convert" "input\%title%\%bimg%.png" -resize 200x120! "input\%title%\%bimg%0.png"
del "input\%title%\%bimg%.png"
"tools\convert" "tools\TemplateBimg.png" "input\%title%\%bimg%0.png" -geometry +0+0 -composite "input\%title%\%bimg%.png"
del "input\%title%\%bimg%0.png"
cls
echo Would you like to use a different image to make a different bimg image?
echo A - Yes
echo B - No
echo.
choice /C AB /M "Enter the letter of your choice:"
if ERRORLEVEL 2 goto continue
if ERRORLEVEL 1 goto bimg
:continue
copy "tools\movie_.bimg" "input\%title%\"
cls
echo BIMG-PGN Converter will open next.
echo.
echo Press Enter To Continue...
pause>nul
cls
echo Step 1.
echo Click on open "Open bimg file"
echo in the "Moflex Helper\input\%title%\" folder you will find a "movie_.bimg" file open that.
echo.
echo Step 2.
echo Click on "RGB565"
echo Click "import bitmap" and open up the image that got created before.
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
echo open up the "ExHeader.bin" file.
echo.
echo Step 2.
echo Where it says "New Unique ID" put in your desired Title ID
echo (only characters 0-9 and/or A-F can be used. Must be 6 Characters long!
echo Must start with "00" the other four numbers are yours to choose)
echo For example, "0011DF"
echo then press "Save Exheader File"
echo.
echo Close VoodooChaos and come back here.
"tools\VoodooChaos.exe"
cls
echo Tell me what Title ID you used on VoodooChaos
echo so I can tell you what to write later on.
echo Note: make sure you type it correctly or else it will cause problems.
echo.
set /p "uid=Title ID: "
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
"tools\Notepad++\notepad++.exe" "output\%title%\RomFS\movie\movie_title.csv"
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
"tools\Notepad++\notepad++.exe" "output\%title%\RomFS\settings\movie_bnrname.csv"
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
echo The "\n" means new line.
echo.
echo Step 2
echo on line 76, you put the your title ID
echo (Must be a 5 digit hex number begining with "0". I.E. "011DF")
echo.
echo INFO:
echo You put "%uid%" on VoodooChaos so you should put the last 5 characters of that.
echo If the number there was "0011DF"
echo then the number here must be "011DF"
echo.
echo Step 3
echo On Line 97, Set the Number the the amount of videos you are using.
echo Remember to save.
echo.
echo Then close Notepad++ and come back here.
"tools\Notepad++\notepad++.exe" "output\%title%\RomFS\settings\settingsTL.csv"
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
echo Use Audacity to make one
echo (Check the "Moflex Helper\tools\Audacity" Folder for the Installer + Plugins)
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
move "tools\banner.bin" "output\%title%\ExeFS"
move "tools\icon.bin" "output\%title%\ExeFS"
copy "output\%title%\ExeFS\icon.bin" "output\%title%\RomFS\icon.icn"
del "input\%title%\movie_.bimg"
move "input\%title%\*.bimg" "output\%title%\RomFS\movie"
move "input\%title%\*.moflex" "output\%title%\RomFS\movie"
cls
echo Press Enter To Continue...
Pause>nul
cls
echo Romfs.bin file will be built next.
echo Press Enter To Continue...
Pause>nul
cls
echo Romfs.bin file is being built. This may take a couple of minutes.
echo Please wait and do not press anything.
echo If you see the following meesage then dont worry about it just ignore it:
echo ERROR: open file C:/Moflex Helper/tools/ignore_3dstool.txt failed
echo Building Romfs....
echo.
"tools\3dstool.exe" -t romfs -c --romfs-dir "output\%title%\RomFS" -f "output\%title%\romfs.bin"
cls
echo Type in your desired serial ID. for example "CTR-N-XXXX". "XXXX" can be anything
echo you want it to be. Make sure type the "CTR-N-" followed by your own ID.
echo.
set /p "sid=Serial ID: "
cls
echo the CIA file will begin building next
echo Press Enter To Continue...
Pause>nul
cls
echo Building cia....
echo Please wait....
"tools\makerom.exe" -f cia -target t -rsf "tools\custom.rsf" -o "output\%title%.cia" -icon "output\%title%\ExeFS\icon.bin" -code "output\%title%\ExeFS\code.bin" -banner "output\%title%\ExeFS\banner.bin" -exheader "output\%title%\ExHeader.bin" -romfs "output\%title%\romfs.bin" -DAPP_TITLE="%st%" -DAPP_PRODUCT_CODE="%sid%" -DAPP_UNIQUE_ID="0x%uid%"
cls
echo CIA successfully built!
echo Your built CIA file should be inside "output\%title%.cia"
echo Now to install and test on your 3DS.
echo.
echo Press Enter To Open CIA Output Folder And Close Program...
Pause>nul
start output
