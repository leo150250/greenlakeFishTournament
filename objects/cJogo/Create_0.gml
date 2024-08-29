display_set_gui_maximize(2,2,0,0);
tempoMinutos=0;
tempoHoras=6;
offsetNumeros=-51;
surfaceHorario=surface_create(99,47);
alarm[0]=60;
numerosFXFoco=[0,0,0,0];
numerosFXSuave=[0,0,0,0];
numerosFX=[0,0,0,0];
estado=estadosJogo.moverJogador;

resultadoPeixeFXFoco=0;
resultadoPeixeFXSuave=0;
resultadoPeixeFX=0;
rotacaoPeixe=720;
escalaPeixe=0;
posXPeixe=0;
idPeixePescado=0;

spritePeixePescado=sprite_duplicate(sprPeixeTeste);
sprite_set_offset(spritePeixePescado,sprite_get_width(spritePeixePescado)/2,sprite_get_height(spritePeixePescado)/2);