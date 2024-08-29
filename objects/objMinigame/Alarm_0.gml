/// @description Finalizar minigame
if (peixeFisgado!=noone) {
	cJogo.idPeixePescado=peixeFisgado.idPeixe;
	sprite_delete(cJogo.spritePeixePescado);
	cJogo.spritePeixePescado=sprite_duplicate(global.peixes[peixeFisgado.idPeixe].spritePeixe);
	sprite_set_offset(cJogo.spritePeixePescado,sprite_get_width(cJogo.spritePeixePescado)/2,sprite_get_height(cJogo.spritePeixePescado)/2);
	cJogo.posXPeixe=0;
}
raioMinigameBarraFoco=0;
raioMinigameFoco=0;