/// @description Finalizar minigame
cJogo.idPeixePescado=peixeFisgado.idPeixe;
sprite_delete(cJogo.spritePeixePescado);
cJogo.spritePeixePescado=sprite_duplicate(global.peixes[peixeFisgado.idPeixe].spritePeixe);
sprite_set_offset(cJogo.spritePeixePescado,sprite_get_width(cJogo.spritePeixePescado)/2,sprite_get_height(cJogo.spritePeixePescado)/2);
raioMinigameBarraFoco=0;
raioMinigameFoco=0;