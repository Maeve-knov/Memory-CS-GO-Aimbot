# Memory-CSGO-Aimbot
Um script simples de aimbot para o Counter Strike: Global Offensive.
Este script faz alterações na memória do jogo, sendo assim, há a necessidade de atualizar as offsets de acordo com as atualizações do game. 

# Como utilizá-lo?
- Abra primeiramente o seu CS:GO e aguarde na tela inicial;
- Execute o aimbot como administrador e aperte a tecla F2;
- Aguarde em torno de 15 segundos, inicie sua sala e bom game.

Caso fique em dúvida se você ativou ou não, há um soundbeep para sinalizar a ação, evitando te confundir. ;)

# O aimbot não funcionou. O que fazer?
O executável foi compilado na arquitetura 64x Unicode na versão 1.1.32.0 do AutoHotkey; Caso o aimbot não funcionar, compile a source na versão 32x ou na default utilizando o Ahk2Exe (compilador nativo). 

A resolução de tela também implica em seu funcionamento. É recomendado utilizar 1980x1080 ou superior, no modo borderless window.

# Quais offsets foram utilizadas no aimbot?
PlayerBase = **0xD8B2BC**

EntityBase = **0x4DA2F44**

ClientState = **0x58EFE4**

CrossHairOffset = **0xB3E4**

PositionOffset = **0x138**

TeamOffset = **0xF4**

HealthOffset = **0x100**

MemoryIncrement = **0x10**

ClientStateViewAngleOffset = **0x4D10**

CLientMemoryAddress = **client_panorama.dll**


**Observação:** Todas essas offsets foram atualizadas no dia 10/02 e se encontram funcionais.




