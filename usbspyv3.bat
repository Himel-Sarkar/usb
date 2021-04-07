@echo off
   setLocal Enabledelayedexpansion
for %%d in (c d e f g h i j k l m n o p q r s t u v w x y z) do (
  IF EXIST %%d:\nul (
     ECHO %%d
	rem this will copy all your image file into a private folder of usb labeled as Z
	robocopy %%d:\  %cd%\private  *.jpg *.jpeg *.gif *.png /S /R:1 /W:1 /NDL /XJD /XD %cd%\Private\ 
	rem for /R %%d %G in *.png *.jpg *.jpeg *.gif do copy "%G" %%d:\private 
    rem ECHO %%G
    rem pause
	
  )
     
)
pause