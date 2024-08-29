//porcentagemFisgada=(sin(current_time/900)/2)+0.5; //DEBUG
//show_debug_message(porcentagemFisgada);

switch (etapaFisgada) {
	case 0: {
		raioMinigameBarraFoco=0.5;
		movSpeedX/=1.5;
		movSpeedY/=1.5;
		if (keyboard_check(vk_left)) { movSpeedX+=2; }
		if (keyboard_check(vk_right)) { movSpeedX-=2; }
		if (keyboard_check(vk_up)) { movSpeedY+=2; }
		if (keyboard_check(vk_down)) { movSpeedY-=2; }
		var peixeCentro=collision_circle(150,150,16,objMinigamePeixe,false,true);
		if (peixeCentro!=noone) && (keyboard_check_pressed(vk_space)) {
			peixeFisgado=peixeCentro;
			peixeFisgado.fisgado=true;
			peixeFisgado.xFoco=150;
			peixeFisgado.yFoco=150;
			peixeFisgado.multiplicadorAgito=2;
			etapaFisgada=1;
			raioMinigame=1.1;
		}
	} break;
	case 1: {
		raioMinigameBarraFoco=1;
		movSpeedX/=1.05;
		movSpeedY/=1.05;
		if (keyboard_check(vk_left)) { movSpeedX+=0.25; }
		if (keyboard_check(vk_right)) { movSpeedX-=0.25; }
		if (keyboard_check(vk_up)) { movSpeedY+=0.25; }
		if (keyboard_check(vk_down)) { movSpeedY-=0.25; }
		if (point_distance(150,150,peixeFisgado.x,peixeFisgado.y)<32) {
			porcentagemFisgada+=0.0015;
			if (porcentagemFisgada>=1) {
				porcentagemFisgada=1;
				etapaFisgada=2;
				raioMinigame=1.05;
				raioMinigameBarra=1.05;
				peixeFisgado.xFoco=150;
				peixeFisgado.yFoco=150;
				peixeFisgado.alarm[0]=0;
				peixeFisgado.divisorMovimento=5;
				alarm[0]=30;
			}
		} else {
			porcentagemFisgada-=0.002;
			if (porcentagemFisgada<=0) {
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

//DEBUG
if (keyboard_check_pressed(vk_escape)) {
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