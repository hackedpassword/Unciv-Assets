:: Author: github.com/hackedpassword
:: https://yairm210.github.io/Unciv/Modders/Creating-a-custom-tileset/#edge-images
:: <tile name>-<origin tile filter>-<destination tile filter>-<neighbor direction>.png
:: Expectations: One edge group i.e. "Lakes-Plains" will be symmetrically duplicated to a new group
:: 	The converse local group, example "Plains-Lakes" will follow, or will fail to create if not present/undesired.
:: Place in the source edges folder to convert: Images/TileSets/[HexaRealm]/Edges/[Group]/
:: Don't forget to use "full-width quotes" on the path if the folder has space chars.

:: example source: Beach-Coast-Land-Bottom.png
set TILE_NAME=Beach
set ORIGIN_TILE=Coast
set DEST_TILE=Grassland

:: example destination: Water-Lakes-Land-Bottom.png
:: Titles: Beach, Fresh, Water
set NEW_TILE_NAME=Beach
set NEW_ORIGIN_TILE=Coast
:: Grassland, Plains, Desert, Mountain, etc; wildcard terrain is Land, Water, etc.
set NEW_DEST_TILE=Desert

:: where are we going to place the duplicate files?
set DEST_GROUP=..\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%

mkdir "%DEST_GROUP%"

:: convert the first batch
copy /Y "%TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-Bottom.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%-Bottom.png"
copy /Y "%TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-BottomLeft.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%-BottomLeft.png"
copy /Y "%TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-BottomRight.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%-BottomRight.png"
copy /Y "%TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-Top.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%-Top.png"
copy /Y "%TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-TopLeft.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%-TopLeft.png"
copy /Y "%TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-TopRight.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%-TopRight.png"


:: MANUAL if-then: second batch exists: convert the second batch if there's a bi-directional edge group OR
:: second batch does not exist: convert the first batch without a second batch to the new second batch
:: swap the block below with the block after exit as needed

:: Regular second batch to second batch block
copy /Y "%TILE_NAME%-%DEST_TILE%-%ORIGIN_TILE%-Bottom.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-Bottom.png"
copy /Y "%TILE_NAME%-%DEST_TILE%-%ORIGIN_TILE%-BottomLeft.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-BottomLeft.png"
copy /Y "%TILE_NAME%-%DEST_TILE%-%ORIGIN_TILE%-BottomRight.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-BottomRight.png"
copy /Y "%TILE_NAME%-%DEST_TILE%-%ORIGIN_TILE%-Top.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-Top.png"
copy /Y "%TILE_NAME%-%DEST_TILE%-%ORIGIN_TILE%-TopLeft.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-TopLeft.png"
copy /Y "%TILE_NAME%-%DEST_TILE%-%ORIGIN_TILE%-TopRight.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-TopRight.png"


echo
dir /B %DEST_GROUP%
echo Complete.

goto end



:: Special case block
copy /Y "%TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-Bottom.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-Bottom.png"
copy /Y "%TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-BottomLeft.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-BottomLeft.png"
copy /Y "%TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-BottomRight.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-BottomRight.png"
copy /Y "%TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-Top.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-Top.png"
copy /Y "%TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-TopLeft.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-TopLeft.png"
copy /Y "%TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-TopRight.png" "%DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-TopRight.png"




:end