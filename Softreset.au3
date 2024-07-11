#include<ImageSearch2015.au3>
#include <Misc.au3>
Global $Inicial=2;
Global $Contador=0;
Global $returnx = 0
Global $returny= 0
Global Const $shinyx1 = 360
Global Const $shinyy1 = 164
Global Const $shinyx2 = 486
Global Const $shinyy2 = 255
Global Const $redx1 = 893
Global Const $redy1 = 450
Global Const $redx2 = 1012
Global Const $redy2 = 593
Global Const $motex1 = 330
Global Const $motey1 = 765
Global Const $motex2 = 570
Global Const $motey2 = 893
Global Const $rngx1 = 330
Global Const $rngy1 = 765
Global Const $rngx2 = 608
Global Const $rngy2 = 893
Global Const $pictureShiny = "shiny.png"
Global Const $pictureRed = "rojo.png"
Global Const $pictureMote = "pedro.png"
Global Const $pictureRNG = "rng.png"
Global $hunting = True
Global $comprobando = True
Global $sinMote = True
Global $hDLL = DllOpen("user32.dll")
Func softReset()
	While $comprobando
		$result = _ImageSearchArea($pictureShiny,1,$shinyx1,$shinyy1,$shinyx2,$shinyy2,$returnx,$returny,0,0)
		$Contador+=1
if $result=1 Then
	send("{l down}")
	send("{k down}")
	send("{ENTER down}")
	send("{BS down}")
	send("{NUMPADADD down}")
	Sleep(1000)
	send("{l up}")
	send("{k up}")
	send("{ENTER up}")
	send("{BS up}")
	send("{NUMPADADD up}")
	$comprobando= False
	$Contador=0
ElseIf $Contador = 1250 Then
	$hunting = False
	$comprobando= False


	MsgBox($MB_OK,"Encontrado!!!!!","Se encontro un shiny")
EndIf

WEnd
EndFunc


Sleep(2000)
While $hunting
$result2 = _ImageSearchArea($pictureMote,1,$motex1,$motey1,$motex2,$motey2,$returnx,$returny,0,0)
if $result2=0 Then
	$result = _ImageSearchArea($pictureRed,1,$redx1,$redy1,$redx2,$redy2,$returnx,$returny,0,0)
	If $result=1 Then
	Select
	Case  $Inicial==0
	Sleep(500)
	Send("{l down}")
	Sleep(250)
	Send("{l up}")
	$Inicial+=1


		Case  $Inicial==1

	Sleep(250)
	send("{d down}")
	Sleep(250)
	send("{d up}")
	Sleep(250)
	send("{w down}")
	Sleep(250)
	send("{w up}")
	Sleep(250)
	Send("{l down}")
	Sleep(250)
	Send("{l up}")
	$Inicial+=1


		Case  $Inicial==2

	Sleep(250)
	send("{d down}")
	Sleep(250)
	send("{d up}")
	Sleep(250)
	send("{d down}")
	Sleep(100)
	send("{d up}")
	Sleep(250)
	send("{w down}")
	Sleep(250)
	send("{w up}")
	Sleep(250)
	Send("{l down}")
	Sleep(250)
	Send("{l up}")
	$Inicial=0

	EndSelect
Else
	Sleep(250)
	Send("{l down}")
	Sleep(250)
	Send("{l up}")
		EndIf


else

	While $sinMote
	Sleep(250)
	Send("{k down}")
	Sleep(250)
	Send("{k up}")
	$result3 = _ImageSearchArea($pictureRNG,1,$rngx1,$rngy1,$rngx2,$rngy2,$returnx,$returny,0,0)
	if $result3=1 Then
	Sleep(5000)
	Send("{ENTER down}")
	Sleep(500)
	Send("{ENTER up}")
	Send("{l down}")
	Sleep(500)
	Send("{l up}")
	Sleep(1000)
	Send("{l down}")
	Sleep(500)
	Send("{l up}")
	Sleep(1000)
	Send("{l down}")
	Sleep(500)
	Send("{l up}")
		softReset()

		$sinMote= False
	EndIf

	WEnd
EndIf
If $hunting==True Then
	$comprobando = True
	$sinMote= True
EndIf
if _IsPressed("1B", $hDLL) Then
	$hunting=False
	MsgBox($MB_OK,"Fueraaaaaaaaaaaa","Fuera del Programa")
	EndIf
WEnd

DllClose($hDLL)