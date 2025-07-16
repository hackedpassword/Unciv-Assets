:: Author: github.com/hackedpassword
:: https://yairm210.github.io/Unciv/Modders/Creating-a-custom-tileset/#edge-images
:: <tile name>-<origin tile filter>-<destination tile filter>-<neighbor direction>.png
:: Expectations: One edge group i.e. "Lakes-Plains" will be symmetrically duplicated to a new group
:: 	The converse local group, example "Plains-Lakes" will follow, or will not create if not present/undesired.
:: Place in the source edges folder to convert: Images/TileSets/[HexaRealm]/Edges/[Group]/
:: Don't forget to use "full-width quotes" on the path if the folder has space chars.
:: Special note: The original creator of the first edge set accepted into Unciv used inconsistent naming with folders, i.e. Lake = Lakes.
::      If you're building an edge *theme* vs an edge *tileset*, you MUST adhere to the folder/names present in base Unciv. This includes
::      manually overriding undesired images with alpha blank images, or you'll see original edges applied for those areas.

:: Once you create your edge set for one group, you can clone that group as another group that you want to retain the same look.
:: Place this script in the group folder of the source edge .png images to clone. Set the source vars to match this group.

:: example source: Beach-Coast-Land-Bottom.png
set TILE_NAME=Beach
set ORIGIN_TILE=Coast
set DEST_TILE=Land

:: What group you want to create. This will overwrite existing edge .png's if they exist.

:: example destination: Water-Lakes-Land-Bottom.png
set NEW_TILE_NAME=Water
set NEW_ORIGIN_TILE=Ocean
set NEW_DEST_TILE=Grassland

:: Finally, the confusing part when you haven't done this before, as mentioned above original edges have inconsistent naming. So, once
::     you run this script, you'll have to for example move Coast-Land/* to Coast-Land Art/* because that's where base Unciv knows to
::     find Beach-Coast-Land-Bottom.png etc. Same with Lake not being Lakes, you'll have to move Lakes-*/* to Lake-*/*. Meh.

:: Nothing more to do here! Save/run this .bat once the above is modified as you need.




:: where are we going to place the duplicate files?
set DEST_GROUP=..\%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%

mkdir %DEST_GROUP%

:: convert the first batch
copy /Y %TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-Bottom.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%-Bottom.png
copy /Y %TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-BottomLeft.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%-BottomLeft.png
copy /Y %TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-BottomRight.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%-BottomRight.png
copy /Y %TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-Top.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%-Top.png
copy /Y %TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-TopLeft.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%-TopLeft.png
copy /Y %TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-TopRight.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_ORIGIN_TILE%-%NEW_DEST_TILE%-TopRight.png


:: MANUAL if-then: second batch exists: convert the second batch if there's a bi-directional edge group OR
:: second batch does not exist: convert the first batch without a second batch to the new second batch
:: swap the block below with the block after exit as needed

:: Special case block
copy /Y %TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-Bottom.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-Bottom.png
copy /Y %TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-BottomLeft.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-BottomLeft.png
copy /Y %TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-BottomRight.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-BottomRight.png
copy /Y %TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-Top.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-Top.png
copy /Y %TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-TopLeft.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-TopLeft.png
copy /Y %TILE_NAME%-%ORIGIN_TILE%-%DEST_TILE%-TopRight.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-TopRight.png

echo
dir /B %DEST_GROUP%
echo Complete.

goto end


:: Regular second batch to second batch block
copy /Y %TILE_NAME%-%DEST_TILE%-%ORIGIN_TILE%-Bottom.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-Bottom.png
copy /Y %TILE_NAME%-%DEST_TILE%-%ORIGIN_TILE%-BottomLeft.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-BottomLeft.png
copy /Y %TILE_NAME%-%DEST_TILE%-%ORIGIN_TILE%-BottomRight.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-BottomRight.png
copy /Y %TILE_NAME%-%DEST_TILE%-%ORIGIN_TILE%-Top.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-Top.png
copy /Y %TILE_NAME%-%DEST_TILE%-%ORIGIN_TILE%-TopLeft.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-TopLeft.png
copy /Y %TILE_NAME%-%DEST_TILE%-%ORIGIN_TILE%-TopRight.png %DEST_GROUP%\%NEW_TILE_NAME%-%NEW_DEST_TILE%-%NEW_ORIGIN_TILE%-TopRight.png


:end