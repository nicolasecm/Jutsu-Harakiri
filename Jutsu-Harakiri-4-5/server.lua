local tiempo = 3500
 
function dataharakirimas (sourcePlayer)
local Harakiridata = tonumber ( getElementData( sourcePlayer,"DataHarakiri" ) ) or 0
if Harakiridata == 1 then
outputChatBox("Ya tiene el jutsu Harakiri", sourcePlayer, 255, 0, 0, true)
else
setElementData(sourcePlayer,"DataHarakiri", Harakiridata + 1)
end
end

addCommandHandler("harakiridatamasuno", dataharakirimas)

function dataharakirimenos (sourcePlayer)
local Harakiridata = tonumber ( getElementData( sourcePlayer,"DataHarakiri" ) ) or 0
if Harakiridata == 1 then
outputChatBox("Ya tiene el jutsu Harakiri", sourcePlayer, 2255, 0, 0, true)
else
setElementData(sourcePlayer,"DataHarakiri", Harakiridata - 1)
end
end

addCommandHandler("harakiridatamenosuno", dataharakirimenos)

function verdataharakiri(sourcePlayer)
local Harakiridata = tonumber ( getElementData ( sourcePlayer,"DataHarakiri" ) ) or 0
outputChatBox("".. Harakiridata .."", sourcePlayer, 255, 0, 0, true)
end

addCommandHandler("verdataharakiri", verdataharakiri)

addCommandHandler("harakirihid",
function( sourcePlayer )
if isPedInVehicle(sourcePlayer) then outputChatBox("Estas en un vehiculo no puedes usar jutsus.",sourcePlayer,0,0,0,false) return end
if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(sourcePlayer)), aclGetGroup("Jutsus.prohibidos")) then
if getElementData(sourcePlayer, "DataHarakiri") == 1 then
if getElementModel(sourcePlayer) == 100 then
if getPedWeapon(sourcePlayer) == 7 then
if (getTickCount ( ) - tiempo > 10000) then
if exports["Chacrka_system"]:ischakraSuficientePara(sourcePlayer,50) then
exports["Chacrka_system"]:Diminuirchakra(sourcePlayer,5)
tiempo = getTickCount ( )
outputChatBox ( "!Harakiri Jutsu¡", sourcePlayer, 0, 0, 0, false )
triggerClientEvent (sourcePlayer, "TextoHidanJutsu", sourcePlayer)
triggerClientEvent (sourcePlayer, "SonidoHidanJutsu", sourcePlayer)
triggerClientEvent (sourcePlayer, "ImagenSelloHidan", sourcePlayer)
setElementFrozen(sourcePlayer, true)
setElementModel(sourcePlayer,287)
toggleControl ( sourcePlayer, "next_weapon", false )
toggleControl ( sourcePlayer, "previous_weapon", false )
--setPedAnimation( sourcePlayer , "freeweights", "gym_free_pickup", -1, true, false, false )
setTimer (
        function ( )
           -- setPedAnimation(sourcePlayer,'BOMBER','BOM_Plant_2Idle',-1,false,false,false,false)
		   setElementFrozen(sourcePlayer, false)
        end
        ,6000, 1
    )
setTimer (
        function ( )
			setElementModel(sourcePlayer,100)
			toggleControl ( sourcePlayer, "next_weapon", true )
			toggleControl ( sourcePlayer, "previous_weapon", true )
        end
        ,22000, 1
    )
 setTimer (
        function ( )
			setPedWeaponSlot ( sourcePlayer, 1 )
        end
        ,200, 1
    )
else
outputChatBox("No tiene chakra suficiente!",sourcePlayer,0,0,0,false)
end
else
outputChatBox("Debes esperar 10 segundos para poder utilizar este jutsu!",sourcePlayer,255,0,0,false)
end
else
outputChatBox("No tienes el arma de Hidan",sourcePlayer,0,0,0,false)
end
else
outputChatBox("No tienes el skin de Hidan",sourcePlayer,0,0,0,false)
end
else
outputChatBox ("No has desbloqueado el jutsu Harakiri",sourcePlayer,0, 0, 0,true )
end
else
outputChatBox("No puedes usar los jutsus prohibidos",sourcePlayer,0,0,0,false)
end end)

