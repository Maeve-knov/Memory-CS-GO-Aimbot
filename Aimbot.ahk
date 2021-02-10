msgbox, Ao abrir o game, aperte a tecla F2 e aguarde alguns segundos antes de iniciar uma sala. 

version = 1.0
traytip, Memory CS:GO Aimbot %version%, Abra seu jogo e aperte F2!, 5, 1


ReadMemory(MADDRESS,PROGRAM)
{
winget, pid, PID, %PROGRAM%
VarSetCapacity(MVALUE,4,0)
ProcessHandle := DllCall("OpenProcess", "Int", 24, "Char", 0, "UInt", pid, "UInt")
DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"Str",MVALUE,"UInt",4,"UInt *",0)
Loop 4
result += *(&MVALUE + A_Index-1) << 8*(A_Index-1)
return, result
}

WriteMemory(WVALUE,MADDRESS,PROGRAM)
{
winget, pid, PID, %PROGRAM%
ProcessHandle := DllCall("OpenProcess", "int", 2035711, "char", 0, "UInt", PID, "UInt")
DllCall("WriteProcessMemory", "UInt", ProcessHandle, "UInt", MADDRESS, "Uint*", WVALUE,"Uint", 4, "Uint *", 0)
 
DllCall("CloseHandle", "int", ProcessHandle)
return
}

PlayerBase = 0xD8B2BC
EntityBase = 0x4DA2F44
ClientState = 0x58EFE4
CrossHairOffset = 0xB3E4
PositionOffset = 0x138
TeamOffset = 0xF4
HealthOffset = 0x100
MemoryIncrement = 0x10
ClientStateViewAngleOffset = 0x4D10
CLientMemoryAddress = client_panorama.dll

*~$F2::
Soundbeep
localplayer:=ReadMemory(clientMemoryAddress+playerbase,"Counter-Strike: Global Offensive")
CrosshairID:=ReadMemory(localplayer+crosshairoffset,"Counter-Strike: Global Offensive")
Enemyincrosshair:=ReadMemory(clientMemoryAddress+entitybase+((crosshairid - 1)*memoryincrement),"Counter-Strike: Global Offensive")
EnemyHealth:=ReadMemory(Enemyincrosshair+Healthoffset,"Counter-Strike: Global Offensive")
EnemyTeam:=ReadMemory(Enemyincrosshair+Teamoffset,"Counter-Strike: Global Offensive")
LocalTeam:=ReadMemory(LocalPLayer+Teamoffset,"Counter-Strike: Global Offensive")
if (CrossHairID > 0 && EnemyTeam!=LocalTeam && EnemyTeam)
{
DllCall("mouse_event", uint,1, int,0, int,0, uint,0, int,0 )
}
c=0
flag = false
i=1
(i<32)
i++
Currentbaseaddress:=ReadMemory(ClientMemoryAddress+Entitybase + (i * MemoryIncrement),"Counter-Strike: Global Offensive")
Entity[i].x:=ReadMemory(Currentbaseaddress+positionoffset,"Counter-Strike: Global Offensive")
Entity[i].y:=ReadMemory(Currentbaseaddress+positionoffset + 4,"Counter-Strike: Global Offensive")
Entity[i].z:=ReadMemory(Currentbaseaddress+positionoffset + 8,"Counter-Strike: Global Offensive")
Entity[i].health:=ReadMemory(Currentbaseaddress+healthoffset,"Counter-Strike: Global Offensive")
Entity[i].teamid:=ReadMemory(Currentbaseaddress+teamoffset,"Counter-Strike: Global Offensive")
Entity[i].distance:=sqrt(((player.x-entity[i].x),2) +((player.y-entity[i].y),2) + ((player.z-entity[i].z),2)  )
if(entity[i].health > 0 && player.teamID != entity[i].teamID)
		{
			enemyDistance[c] = entity[i].distance
			enemyID[c++] = i
		}
i=0
(i<c-1)
i++
j=i+1
(j<c)
j++
if(enemyDistance[j]<enemyDistance[i])
			{
				enemyDistance[i]=enemyDistance[i]+enemyDistance[j]
				enemyDistance[j]=enemyDistance[i]-enemyDistance[j]
				enemyDistance[i]=enemyDistance[i]-enemyDistance[j]
				enemyID[i] = enemyID[i] + enemyID[j]
				enemyID[j] = enemyID[i] - enemyID[j]
				enemyID[i] = enemyID[i] - enemyID[j]
				
			}
Currentbaseaddress:=ReadMemory(ClientMemoryAddress+Playerbase,"Counter-Strike: Global Offensive")
Player.x:=ReadMemory(ClientMemoryAddress+Positionoffset,"Counter-Strike: Global Offensive")
Player.y:=ReadMemory(ClientMemoryAddress+Positionoffset+4,"Counter-Strike: Global Offensive")
Player.z:=ReadMemory(ClientMemoryAddress+Positionoffset+8,"Counter-Strike: Global Offensive")
Player.health:=ReadMemory(Client+healthoffset,"Counter-Strike: Global Offensive")
Player.teamid:=ReadMemory(Client+teamoffset,"Counter-Strike: Global Offensive")
player.distance := -1

distance_X = entity[i].x - player.x
distance_Y = entity[i].y - player.y
	distance_Z = entity[i].z - player.z - ycorr
  distance_XY_Plane = sqrt((distance_X, 2) + (distance_Y, 2))
	if((distance_X / distance_XY_Plane) > 1 || (distance_X / distance_XY_Plane) < -1)
{
		
   x_r = acos(distance_X / distance_XY_Plane) * 180 / 3.141592
    x_r *= (entity[i].y < player.y) ? -1 : 1
    y_r = -1 * atan(distance_Z / distance_XY_Plane) * 180 / 3.141592
	changeAngle(x_r,y_r)
}
changeAngle(xangle, yangle)
{
WriteMemory(xangle,client+clientstateviewangleoffset,"Counter-Strike: Global Offensive")
WriteMemory(yangle,client+clientstateviewangleoffset,"Counter-Strike: Global Offensive")
}
main()
{
aimto = 0
client:=ReadMemory(Enginememoryaddress+clientstate,"Counter-Strike: Global Offensive")
localplayer:=ReadMemory(clientmemoryaddress+Playerbase,"Counter-Strike: Global Offensive")
localteam:=ReadMemory(localplayer+teamoffset,"Counter-Strike: Global Offensive")
crosshairid:=ReadMemory(localplayer+crosshairoffset,"Counter-Strike: Global Offensive")
if(aimto<0)
			aimto = 0
}