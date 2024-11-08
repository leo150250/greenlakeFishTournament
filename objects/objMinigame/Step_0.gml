//porcentagemFisgada=(sin(current_time/900)/2)+0.5; //DEBUG
//show_debug_message(porcentagemFisgada);

switch (etapaFisgada) {
	case 0: {
		raioMinigameBarraFoco=0.5;
		movSpeedX/=1.5;
		movSpeedY/=1.5;
		if (ControleEsquerda()) { movSpeedX+=2; }
		if (ControleDireita()) { movSpeedX-=2; }
		if (ControleAcima()) { movSpeedY+=2; }
		if (ControleAbaixo()) { movSpeedY-=2; }
		var peixeCentro=collision_circle(150,150,16,objMinigamePeixe,false,true);
		if (peixeCentro!=noone) && (ControleAcao()) {
			peixeFisgado=peixeCentro;
			peixeFisgado.fisgado=true;
			peixeFisgado.xFoco=150;
			peixeFisgado.yFoco=150;
			peixeFisgado.multiplicadorAgito=2;
			etapaFisgada=1;
			raioMinigame=1.1;
			executarMusica(musPesca);
			executarSom(sndAnzolFisgou);
		}
	} break;
	case 1: {
		raioMinigameBarraFoco=1;
		movSpeedX/=1.05;
		movSpeedY/=1.05;
		if (ControleEsquerda()) { movSpeedX+=0.25; }
		if (ControleDireita()) { movSpeedX-=0.25; }
		if (ControleAcima()) { movSpeedY+=0.25; }
		if (ControleAbaixo()) { movSpeedY-=0.25; }
		if (point_distance(150,150,peixeFisgado.x,peixeFisgado.y)<32) {
			porcentagemFisgada+=0.0015;
			if (somFisgada!=0) {
				somFisgada=0;
				audio_stop_sound(sndMolineteRapido);
				executarSom(sndMolineteLento,true);
			}
			if (porcentagemFisgada>=1) {
				audio_stop_sound(sndMolineteLento);
				executarSom(sndPegouPeixe);
				porcentagemFisgada=1;
				etapaFisgada=2;
				raioMinigame=1.05;
				raioMinigameBarra=1.05;
				peixeFisgado.xFoco=150;
				peixeFisgado.yFoco=150;
				peixeFisgado.alarm[0]=0;
				peixeFisgado.divisorMovimento=5;
				obj_player.podePescar = false;
				alarm[0]=30;
			}
		} else {
			porcentagemFisgada-=0.002;
			if (somFisgada!=1) {
				somFisgada=1;
				audio_stop_sound(sndMolineteLento);
				audio_stop_sound(sndMolineteRapido);
				executarSom(sndMolineteRapido,true);
			}
			if (porcentagemFisgada<=0) {
				audio_stop_sound(sndMolineteLento);
				audio_stop_sound(sndMolineteRapido);
				etapaFisgada=-1;
				raioMinigame=0.975;
				raioMinigameBarra=0.975;
				peixeFisgado.fisgado=false;
				peixeFisgado.multiplicadorAgito=3;
				peixeFisgado=noone;
				alarm[0]=60;
			}
		}
	} break;
	case -1: {
		if (raioMinigame<=0) && (raioMinigameBarra<=0) {
			//Encerra o minigame
			instance_destroy(objMinigamePeixe);
			instance_destroy();
			obj_player.alarm[0]=5;
		}
	} break;
	case 2: {
		movSpeedX/=1.5;
		movSpeedY/=1.5;
		if (raioMinigame<=0) && (raioMinigameBarra<=0) {
			//TODO: Inserir animação do ícone do peixe indo para o personagem, e exibir o peixe pego
			instance_destroy(objMinigamePeixe);
			instance_destroy();
		}
	} break;
	default: {
		movSpeedX/=2;
		movSpeedY/=2;
	} break;
}
if (instance_number(objMinigamePeixe)<10) {
	var direcaoNovoPeixe=random(360);
	instance_create_layer(150+lengthdir_x(300,direcaoNovoPeixe),150+lengthdir_y(300,direcaoNovoPeixe),layer,objMinigamePeixe,{
		idPeixe:SelecionarPeixeAleatorio(idPeixes)
	});
}
posMinigameX+=movSpeedX;
posMinigameY+=movSpeedY;
with (objMinigamePeixe) {
	x+=other.movSpeedX;
	y+=other.movSpeedY;
	xFX+=other.movSpeedX;
	yFX+=other.movSpeedY;
	xFoco+=other.movSpeedX;
	yFoco+=other.movSpeedY;
}

#region Suavização da exibição
raioMinigameFX += (raioMinigameFoco - raioMinigame) / 6;
raioMinigame += (raioMinigameFX - raioMinigame) / 3;
raioMinigameBarraFX += (raioMinigameBarraFoco - raioMinigameBarra) / 8;
raioMinigameBarra += (raioMinigameBarraFX - raioMinigameBarra) / 16;
#endregion

if (ControleMenu() && (etapaFisgada!=-1)) {
	audio_stop_sound(sndMolineteLento);
	audio_stop_sound(sndMolineteRapido);
	etapaFisgada=-1;
	raioMinigame=0.975;
	raioMinigameBarra=0.975;
	if (peixeFisgado!=noone) {
		peixeFisgado.fisgado=false;
		peixeFisgado.multiplicadorAgito=3;
	}
	peixeFisgado=noone;
	alarm[0]=1;
}