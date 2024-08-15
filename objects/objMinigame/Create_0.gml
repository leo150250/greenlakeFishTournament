#region Variáveis do minigame
etapaFisgada=0;
porcentagemFisgada=1/3;
naArea=false;
movSpeedX=0;
movSpeedY=0;
posMinigameX=0;
posMinigameY=0;
surfaceMinigame=surface_create(300,300);
peixeFisgado=noone;
#endregion

#region Criação de peixes
repeat(10) {
	instance_create_layer(150-250+random(500),150-250+random(500),layer,objMinigamePeixe);
}
#endregion

#region Exibição
raioMinigame=0;
raioMinigameFoco=1;
raioMinigameFX=0;
raioMinigameBarra=0;
raioMinigameBarraFoco=0.5;
raioMinigameBarraFX=0;
texBarra=sprite_get_texture(sprBarraMinigame,0);
#endregion

display_set_gui_maximize(2,2);